function make_exec
% SPM can be compiled using Matlab 7.
% This will generate a standalone program, which can be run
% outside Matlab, and therefore does not use up a Matlab license.
% The executable needs to be dynamically linked with runtime libraries
% bundled with the Matlab package.  Before executing, ensure that your
% LD_LIBRARY_PATH is set appropriately, so that $MATLAB/bin/$arch
% is included. LD_LIBRARY_PATH or PATH should also contain the directory
% containing the *.ctf files
%
% Software compiled with later MATLAB versions may need 
% LD_LIBRARY_PATH=$MATLAB/bin/$arch:$MATLAB/sys/os/$arch
%
% Note that when compiling, it is important to be careful with your
% startup.m file.  See the following link for more information:
% http://www.mathworks.com/support/solutions/data/1-QXFMQ.html?1-QXFMQ
%_______________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging

% John Ashburner
% $Id: make_exec.m 1143 2008-02-07 19:33:33Z spm $ 

mcc('-m','-v','-o',['spm_'    computer],'exec_spm.m'   ,'spm_load.m', '-I',spm('Dir'),'-R','-nojvm')
mcc('-m','-v','-o',['jobman_' computer],'exec_jobman.m','spm_load.m', '-I',spm('Dir'),'-R','-nojvm')

