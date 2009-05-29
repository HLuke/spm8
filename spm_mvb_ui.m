function [MVB] = spm_mvb_ui(xSPM,SPM,hReg)
% multivariate Bayes (Bayesian decoding of a contrast)
% % FORMAT [MVB] = spm_mvb_ui(xSPM,SPM,hReg)
%
% Sets up, evaluates and saves an MVB structure:
%
% MVB.contrast            % contrast structure
% MVB.name                % name
% MVB.c                   % contrast weight vector
% MVB.M                   % MVB model (see below)
% MVB.X                   % subspace of design matrix
% MVB.Y                   % multivariate response
% MVB.X0                  % null space of design
% MVB.XYZ                 % location of voxels (mm)
% MVB.V                   % serial correlation in repeosne
% MVB.K                   % whitening matrix
% MVB.VOX                 % voxel scaling
% MVB.xyzmm               % centre of VOI (mm)
% MVB.Space               % VOI definition
% MVB.Sp_info             % parameters of VOI
% MVB.Ni                  % number of greedy search steps
% MVB.sg                  % size of reedy search split
% MVB.fSPM                % SPM analysis (.mat file)
%
% where MVB.M contins the following field:
%
%                F: log-evidence [F(0), F(1),...]
%                G: covariance partition indices
%                h: covariance hyperparameters
%                U: ordered patterns
%               qE: conditional expectation of voxel weights
%               qC: conditional variance of voxel weights
%               Cp: prior covariance (ordered  pattern space)
%               cp: prior covariance (original pattern space)
%
% See:
%
% Bayesian decoding of brain images.
% Friston K, Chu C, Mour�o-Miranda J, Hulme O, Rees G, Penny W, Ashburner J.
% Neuroimage. 2008 Jan 1;39(1):181-205
% 
% Multiple sparse priors for the M/EEG inverse problem.
% Friston K, Harrison L, Daunizeau J, Kiebel S, Phillips C, Trujillo-Barreto 
% N, Henson R, Flandin G, Mattout J.
% Neuroimage. 2008 Feb 1;39(3):1104-20.
% 
% Characterizing dynamic brain responses with fMRI: a multivariate approach.
% Friston KJ, Frith CD, Frackowiak RS, Turner R.
% Neuroimage. 1995 Jun;2(2):166-72.
%__________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging
 
% Karl Friston
% $Id: spm_mvb_ui.m 3139 2009-05-21 18:37:29Z karl $
 
 
%-Get figure handles and set title
%--------------------------------------------------------------------------
Fmvb = spm_figure('GetWin','MVB');
spm_clf(Fmvb);
 
%-Get contrast: only the first line of F-contrast 
%--------------------------------------------------------------------------
contrast = SPM.xCon(xSPM.Ic).name;
c        = SPM.xCon(xSPM.Ic).c(:,1); 
 
%-Get VOI name
%--------------------------------------------------------------------------
name   = ['MVB_' spm_input('name','-8','s',contrast)];
 
%-Get current location {mm}
%--------------------------------------------------------------------------
xyzmm  = spm_results_ui('GetCoords');
 
%-Specify search volume
%--------------------------------------------------------------------------
str    = sprintf(' at [%.0f,%.0f,%.0f]',xyzmm(1),xyzmm(2),xyzmm(3));
SPACE  = spm_input('Search volume...','!+1','m',...
        {['Sphere',str],['Box',str],'Image'},['S','B','I']);
Q      = ones(1,size(SPM.xVol.XYZ,2));
XYZmm  = SPM.xVol.M*[SPM.xVol.XYZ; Q];
XYZmm  = XYZmm(1:3,:);
 
switch SPACE
 
    case 'S' %-Sphere
    %---------------------------------------------------------------
    D     = spm_input('radius of VOI {mm}','!+1');
    str   = sprintf('%0.1fmm sphere',D);
    j     = find(sum((XYZmm - xyzmm*Q).^2) <= D^2);
    
 
    case 'B' %-Box
    %---------------------------------------------------------------
    D     = spm_input('box dimensions [k l m] {mm}','!+1');
    if length(D) < 3
        D = D(1)*[1 1 1];
    end
    str   = sprintf('%0.1f x %0.1f x %0.1f mm box',D(1),D(2),D(3));
    j     = find(all(abs(XYZmm - xyzmm*Q) <= D(:)*Q/2));
    
 
    case 'I' %-Mask Image
    %---------------------------------------------------------------
    Msk   = spm_select(1,'image','Image defining search volume');
    D     = spm_vol(Msk);
    str   = sprintf('image mask: %s',spm_str_manip(Msk,'a30'));
    XYZ   = D.mat \ [XYZmm; Q];
    j     = find(spm_sample_vol(D, XYZ(1,:), XYZ(2,:), XYZ(3,:),0) > 0);
 
end
 
% Get explanatory variables (data)
%--------------------------------------------------------------------------
XYZ    = XYZmm(:,j);
Y      = spm_get_data(SPM.xY.VY,SPM.xVol.XYZ(:,j));
 
% Check there are intracranial voxels
%--------------------------------------------------------------------------
if isempty(Y)
    warndlg({'No voxels in this VOI';'Please use a larger volume'})
    return
end
 
%-Get model[s]
%--------------------------------------------------------------------------
str    = {'compact','sparse','smooth','support'};
Ip     = spm_input('model (spatial prior)','!+1','m',str);
priors = str{Ip};
 
%-Number of iterations
%--------------------------------------------------------------------------
str    = 'size of successive subdivisions';
sg     = spm_input(str,'!+1','e',.5);

 
% MVB is now specified
%==========================================================================
spm('Pointer','Watch')
 
%-Get target and confounds
%--------------------------------------------------------------------------
X   = SPM.xX.X;
X0  = X*(speye(length(c)) - c*pinv(c));
try
    % accounting for multiple sessions
    %----------------------------------------------------------------------
    tmpX0  = [];
    for ii = 1:length(SPM.xX.K)
        tmp   = zeros(sum(SPM.nscan),size(SPM.xX.K(ii).X0,2));
        tmp(SPM.xX.K(ii).row,:) = SPM.xX.K(ii).X0;
        tmpX0 = [tmpX0 tmp];
    end
    X0 = [X0 tmpX0];
end
X   = X*c;
 
% serial correlations
%--------------------------------------------------------------------------
V   = SPM.xVi.V;
 
% invert
%==========================================================================
U        = spm_mvb_U(Y,priors,X0,XYZ,xSPM.VOX);
str      = 'Greedy search steps';
Ni       = spm_input(str,'!+1','i',max(8,ceil(log(size(U,2))/log(1/sg))));
M        = spm_mvb(X,Y,X0,U,V,Ni,sg);
M.priors = priors;
 
% assemble results
%--------------------------------------------------------------------------
MVB.contrast = contrast;                    % contrast of interest
MVB.name     = name;                        % name
MVB.c        = c;                           % contrast weight vector
MVB.M        = M;                           % MVB model (see below)
MVB.X        = X;                           % subspace of design matrix
MVB.Y        = Y;                           % multivariate response
MVB.X0       = X0;                          % null space of design
MVB.XYZ      = XYZ;                         % location of voxels (mm)
MVB.V        = V;                           % serial correlation in repeosne
MVB.K        = full(V)^(-1/2);              % whitening matrix
MVB.VOX      = xSPM.M;                      % voxel scaling
MVB.xyzmm    = xyzmm;                       % centre of VOI (mm)
MVB.Space    = SPACE;                       % VOI definition
MVB.Sp_info  = D;                           % parameters of VOI
MVB.Ni       = Ni;                          % number of greedy search steps
MVB.sg       = sg;                          % size of reedy search split
MVB.fSPM     = fullfile(SPM.swd,'SPM.mat'); % SPM analysis (.mat file)
 
% display
%==========================================================================
spm_mvb_display(MVB)
 
% save
%--------------------------------------------------------------------------
if spm_matlab_version_chk('7') >= 0
    save(fullfile(SPM.swd,name),'-V6','MVB')
else
    save(fullfile(SPM.swd,name),'MVB')
end
 
%-Reset title
%--------------------------------------------------------------------------
spm('FigName',['SPM{',xSPM.STAT,'}: Results']);
spm('Pointer','Arrow')


