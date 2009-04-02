function Dsource = spm_eeg_ft_beamformer_source(S)
% Use LCMV beamformer to extract source activity from specific points in
% the brain.
%
% FORMAT Dsource = spm_eeg_ft_beamformer_source(S)
%
% S         - struct (optional)
% (optional) fields of S:
% S.D - meeg object or filename
% S.conditions - cell array of strings - condition labels to use
% S.sources - specification of source locations. Struct with two fields:
%             .label - cell array of strings - labels for the sources
%             .pos - N x 3 matrix of MNI positions
% S.lambda -  regularization constant (either numeric or string like '10%')
% S.outfile - output file name (default 'B' + input name)
% S.appendchannels - cell array of strings - labels of channels from the
%             input dataset to be appended to the source data
%
% Output:
% Dsource   - MEEG object containing the source data and (optionally)
%             appended channel data.
%
%
% Disclaimer: this code is provided as an example and is not guaranteed to work
% with data on which it was not tested. If it does not work for you, feel
% free to improve it and contribute your improvements to the MEEGtools toolbox
% in SPM (http://www.fil.ion.ucl.ac.uk/spm)
%
% _______________________________________________________________________
% Copyright (C) 2008 Institute of Neurology, UCL

% Vladimir Litvak, Robert Oostenveld
% $Id: spm_eeg_ft_beamformer_source.m 2841 2009-03-09 13:26:05Z vladimir $

[Finter,Fgraph,CmdLine] = spm('FnUIsetup', 'Beamformer source activity extraction',0);

if nargin == 0
    S = [];
end

try
    D = S.D;
catch
    D = spm_select(1, '\.mat$', 'Select EEG mat file');
    S.D = D;
end

if ischar(D)
    try
        D = spm_eeg_load(D);
    catch
        error(sprintf('Trouble reading file %s', D));
    end
end

[ok, D] = check(D, 'sensfid');

if ~ok
    if check(D, 'basic')
        errordlg(['The requested file is not ready for source reconstruction.'...
            'Use prep to specify sensors and fiducials.']);
    else
        errordlg('The meeg file is corrupt or incomplete');
    end
    return
end

if ~isfield(S, 'sources')
    S.sources.pos = [];
    S.sources.label = {};
    while isempty(S.sources.pos) || spm_input('Add another source?','+1','yes|no',[1 0], 1);
        S.sources.label = [S.sources.label {spm_input('Source label', '+1', 's')}];
        S.sources.pos = [S.sources.pos;  spm_input('Source MNI coordinates', '+1', 'r', '', 3)'];
    end
end

if ~isfield(S, 'lambda')
    S.lambda = spm_input('lambda (regularization)', '+1', 's',  '0.01%');
end

if ~isfield(S, 'outfile')
    S.outfile = spm_input('Output file name', '+1', 's', ['B' D.fname]);
end

modality = spm_eeg_modality_ui(D, 1, 1);

%% ============ Select the data and convert to Fieldtrip struct
if ~isfield(S, 'conditions')
    clb = D.condlist;

    if numel(clb) > 1

        [selection, ok]= listdlg('ListString', clb, 'SelectionMode', 'multiple' ,'Name', 'Select conditions' , 'ListSize', [400 300]);

        if ~ok
            return;
        end
    else
        selection = 1;
    end
    S.conditions = clb(selection);
end
%%
trialind = find(ismember(D.conditions, S.conditions) & ~reject(D));
%%
if isempty(trialind)
    error('No data was selected.');
end

%%
if ~isfield(S, 'appendchannels')
    if spm_input('Append other channels?','+1','yes|no',[1 0])
        selection = listdlg('ListString', D.chanlabels, 'SelectionMode', 'multiple' ,'Name', 'Select channels' , 'ListSize', [400 300]);
        if ~isempty(selection)
            S.appendchannels = D.chanlabels(selection);
        else
            S.appendchannels = {};
        end
    else
        S.appendchannels = {};
    end
end
%%

sens = sensors(D, modality);
%% ============ Find or prepare head model

if ~isfield(D, 'val')
    D.val = 1;
end

if ~isfield(D, 'inv') || ~iscell(D.inv) ||...
        ~(isfield(D.inv{D.val}, 'forward') && isfield(D.inv{D.val}, 'datareg')) ||...
        ~isa(D.inv{D.val}.mesh.tess_ctx, 'char') % detects old version of the struct
    D = spm_eeg_inv_mesh_ui(D, D.val);
    D = spm_eeg_inv_datareg_ui(D, D.val);
    D = spm_eeg_inv_forward_ui(D, D.val);
end

for m = 1:numel(D.inv{D.val}.forward)
    if strncmp(modality, D.inv{D.val}.forward(m).modality, 3)
        vol  = D.inv{D.val}.forward(m).vol;
        if isa(vol, 'char')
            vol = fileio_read_vol(vol);
        end
        datareg  = D.inv{D.val}.datareg(m);
    end
end

sens = datareg.sensors;

toMNI = datareg.toMNI;
fromMNI = datareg.fromMNI;

if isfield(S,'symmetry') && S.symmetry
    [U, L, V] = svd(toMNI(1:3, 1:3));
    M1(1:3,1:3) =U*V';

    vol = forwinv_transform_vol(M1, vol);
    sens = forwinv_transform_sens(M1, sens);

    fromMNI = M1*fromMNI;
    toMNI = toMNI*inv(M1);
end

channel = D.chanlabels(setdiff(meegchannels(D, modality), D.badchannels));

[vol, sens] = forwinv_prepare_vol_sens(vol, sens, 'channel', channel);

pos = spm_eeg_inv_transform_points(fromMNI, S.sources.pos);
%%
spm('Pointer', 'Watch');drawnow;
%%

data = D.ftraw(0);
data.trial = data.trial(trialind);
data.time = data.time(trialind);

cfg = [];
cfg.channel = modality;
cfg.covariance = 'yes';
cfg.keeptrials = 'no';
timelock1 = ft_timelockanalysis(cfg, data);
cfg.keeptrials = 'yes';
timelock2 = ft_timelockanalysis(cfg, data);
%%
sourcedata=[];
sourcedata.trial=zeros(size(timelock2.trial, 1), size(pos, 1), length(timelock2.time));

for s = 1:size(pos, 1)

    cfg = [];
    cfg.reducerank = 2;
    cfg.grid.pos     = pos(s, :);

    cfg.grad = sens;
    cfg.inwardshift = -10;
    cfg.vol = vol;
    cfg.channel = modality;
    cfg.method = 'lcmv';
    cfg.lcmv.fixedori = 'yes';
    cfg.keepfilter = 'yes';
    cfg.lambda =  S.lambda;
    source1 = ft_sourceanalysis(cfg, timelock1);

    cfg = [];
    cfg.inwardshift = -10;
    cfg.vol = vol;
    cfg.grad = sens;
    cfg.grid = ft_source2grid(source1);
    cfg.channel = modality;
    cfg.lambda =  S.lambda;
    cfg.rawtrial = 'yes';
    source2 = ft_sourceanalysis(cfg, timelock2);


    for i=1:length(source2.trial)
        sourcedata.trial(i, s, :)=remove_jumps(source2.trial(i).mom{1});
    end
end

sourcedata.time = timelock2.time;
sourcedata.dimord = 'rpt_chan_time';
sourcedata.label = S.sources.label;
sourcedata.fsample = timelock2.fsample;
sourcedata.avg = [];
%%
if ~isempty(S.appendchannels)
    cfg = [];
    cfg.channel= S.appendchannels;
    cfg.keeptrials = 'yes';
    externdata = ft_timelockanalysis(cfg, data);
    sourcedata = ft_appenddata([], sourcedata, externdata);
end
%%

Dsource = spm_eeg_ft2spm(sourcedata, S.outfile);

Dsource = chantype(Dsource, 1:length(S.sources.label), 'LFP');

Dsource = conditions(Dsource, [], D.conditions(trialind));

Dsource = history(Dsource, 'spm_eeg_ft_beamformer_source', S);

save(Dsource);

spm('Pointer', 'Arrow');drawnow;
%%
function dat = remove_jumps(dat)

ddat = diff(dat);

peaks = find(abs(ddat) > 5 * std(ddat));

if ~isempty(peaks)

    peaks(find(diff(peaks) < 10) + 1) = [];

    for i = 1:length(peaks)
        ind = peaks(i)+[-20:20];
        if ind(1) < 1
            ind = ind + 1 - ind(1);
        end

        if ind(end) > length(ddat)
            ind = ind - (ind(end) - length(ddat));
        end

        ddat(ind) = medfilt1(ddat(ind), 15, [], 2);
    end

    dat(2:end) = cumsum(ddat) + dat(1);
end