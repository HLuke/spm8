function [spike] = read_fcdc_spike(filename)

% READ_FCDC_SPIKE reads spike information (timestamps and optionally also
% waveforms) from a file.
%
% Use as
%   spike = read_fcdc_spike(filename)
%
% The output spike structure contains
%   spike.label     = 1xnchans cell-array, with channel labels
%   spike.waveform  = 1xnchans cell-array, each element contains a matrix (Nsamples X Nspikes), can be empty
%   spike.timestamp = 1xnchans cell-array, each element contains a vector (1 X Nspikes)
%   spike.unit      = 1xnchans cell-array, each element contains a vector (1 X Nspikes)
%
% The spike structure can be used to add spike channels to continuusly
% recorded LFP data. The spike channels represent the point process and
% have a value of zero most of the time and a value of one if a spike
% occurred at that sample in the LFP data. Adding spike channels to LFP
% data is done using APPENDDATA. The continuous LFP data should be imported
% using PREPROCESSING.

% Copyright (C) 2007, Robert Oostenveld
%
% $Log: read_fcdc_spike.m,v $
% Revision 1.4  2009/02/17 11:08:31  roboos
% changed varargin into filename for more strict input handling: multiple input arguments are not supported because the (old) read_fcdc_xxx function interface did not support that.
%
% Revision 1.3  2009/01/28 14:45:46  roboos
% added fieldtripdefs (thanks to Verena)
%
% Revision 1.2  2008/12/16 21:22:23  roboos
% changed some comments and documentation
%
% Revision 1.1  2007/02/27 09:57:35  roboos
% new implementation, wrapper around private/read_spike
%

fieldtripdefs

% use the low-level reading function
[spike] = read_spike(filename);

