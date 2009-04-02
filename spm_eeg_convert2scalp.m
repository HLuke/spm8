function S = spm_eeg_convert2scalp(S)
% Convert epoched M/EEG data from SPM to NIfTI format by projecting
% onto the scalp surface
% FORMAT S = spm_eeg_convert2scalp(S)
%
% S         - input structure (optional)
% (optional) fields of S:
%   S.Fname            - cell/character array of M/EEG mat-filenames
%   S.n                - size of square output image (size: n x n x ?)
%   S.interpolate_bad  - flag (0/1) whether channels should be used for
%                        interpolation if they lie at the border of the
%                        setup [0: mask out]
%
% S         - output structure containing parameters used
%__________________________________________________________________________
%
% spm_eeg_convert2scalp converts M/EEG data from the SPM format to the
% scalp format. The data will be in 3D format, i.e., peri-stimulus time is
% the third dimension. The channel data is interpolated to voxel-space
% using a linear interpolation. Each channel's data will be found in a
% single voxel given that n is large enough. The data is written to 3D NIfTI
% images, i.e. the data of each single trial or evoked response is contained
% in one image file. The 'mask out' option interpolate_bad=0 will only have
% an effect if the bad channels are located at the edge of the setup, where
% it is assumed that there is not enough data for interpolation.
%__________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging

% Stefan Kiebel
% $Id: spm_eeg_convert2scalp.m 2860 2009-03-11 17:22:50Z guillaume $

SVNrev = '$Rev: 2860 $';

%-Startup
%--------------------------------------------------------------------------
spm('sFnBanner', mfilename, SVNrev);
spm('FnUIsetup', 'M/EEG conversion setup', 0);

%-Get parameters
%--------------------------------------------------------------------------
try
    Fname        = S.Fname;
catch
    [Fname, sts] = spm_select(Inf, 'mat', 'Select MEEG mat file(s)');
    if ~sts, S   = []; return; end
    S.Fname      = Fname;
end
Fname            = cellstr(Fname);

try
    n            = S.n;
catch
    n            = spm_input('Output image dimension', '+1', 'n', '32', 1);
    S.n          = n;
end
if length(n) > 1, error('n must be scalar'); end

try
    interpolate_bad = S.interpolate_bad;
catch
    interpolate_bad = spm_input('Interpolate bad channels or mask out?',...
        '+1', 'b', 'Interpolate|Mask out', [1,0]);
    S.interpolate_bad = interpolate_bad;
end

%-Recursive call if multiple MEEG files
%--------------------------------------------------------------------------
if numel(Fname) > 1
    for i=1:numel(Fname)
        S.Fname = Fname{i};
        S = spm_eeg_convert2scalp(S);
    end
    S.Fname = Fname;
    return;
else
    Fname = Fname{1};
end

%-Load M/EEG data
%--------------------------------------------------------------------------
spm('Pointer', 'Watch');

D = spm_eeg_load(Fname);

%-For multimodal datasets, set the types of non-chosen modality to 'Other'
% This is not saved in the dataset
%--------------------------------------------------------------------------
modality = spm_eeg_modality_ui(D, 1, 1);
if strcmp(modality, 'MEGPLANAR')
    error('MEG planar gradiometers are not supported yet.')
else
    otherind = setdiff(1:nchannels(D), strmatch(modality, chantype(D)));
    if ~isempty(otherind)
        D = chantype(D, otherind, 'Other');
    end
end

%-Project M/EEG data on the scalp surface
%--------------------------------------------------------------------------
[Cel, Cind, x, y] = spm_eeg_locate_channels(D, n, interpolate_bad);

%-Make output directory for each dataset
%--------------------------------------------------------------------------
[P, F] = fileparts(Fname);
if isempty(P), P = pwd; end
[sts, msg] = mkdir(P, F);
if ~sts, error(msg); end
P  = fullfile(P, F);

%-Loop over conditions
%--------------------------------------------------------------------------
d  = spm_cond_units(D(Cind, :,:));
cl = D.condlist;
for i = 1 : D.nconditions

    %-Make output directory for each condition
    %----------------------------------------------------------------------
    dname = sprintf('type_%s', cl{i});
    [sts, msg] = mkdir(P, dname);
    if ~sts, error(msg); end
    Pi = fullfile(P, dname);

    %-Loop over trials
    %----------------------------------------------------------------------
    Itrials = pickconditions(D, cl(i), 1);
    k = numel(Itrials);
    
    spm_progress_bar('Init',k,sprintf('Converting condition %s',cl{i}),'Trial');
    if k > 100, Ibar = floor(linspace(1, k, 100)); else Ibar = 1:k; end

    for j = 1 : k

        %-Create output image header (matching MNI space)
        %------------------------------------------------------------------
        fname = fullfile(Pi, sprintf('trial%04d.img', Itrials(j)));
        N     = nifti;
        DIM   = [n n D.nsamples];
        dat   = file_array(fname,[DIM 1],'FLOAT32-LE');
        N.dat = dat;
        V     = [136 172 100] ./ DIM;   % new voxel size
        C     = [68  100   0];          % new origin
        N.mat = [...
            V(1)  0     0               -C(1);...
            0     V(2)  0               -C(2);...
            %0     0     V(3)            -C(3);...
            0     0     1000/D.fsample  time(D, 1, 'ms');...
            0     0     0               1];
        N.mat_intent = 'Aligned';
        create(N);

        %-Create output image data
        %------------------------------------------------------------------
        for l = 1 : D.nsamples          % time bins
            di = NaN(n,n);
            di(sub2ind([n n], x, y)) = griddata(Cel(:,1),Cel(:,2),...
                double(d(:, l, Itrials(j))),x,y,'linear');
            N.dat(:,:,l,1) = di;
        end

        if ismember(j, Ibar), spm_progress_bar('Set', j); end

    end % for j = 1 : k

end % for i = 1 : D.nconditions


%-Cleanup
%--------------------------------------------------------------------------
spm_progress_bar('Clear');
spm('FigName','M/EEG conversion: done'); spm('Pointer','Arrow');
