function [str, name, ind] = gencode_substruct(subs, name)

% Generate MATLAB code that shows the subscript reference subs. If name is
% given, it is prepended to the string, otherwise it is set to ''.
% str is a 1-line cellstr, name is the used name and ind is 1 (to conform
% to general gencode calling syntax).
% For '()' and '{}' also pseudo subscripts are allowed: if subs.subs{...}
% is a string, it will be printed literally, even if it is not equal to
% ':'. This way, one can create code snippets that contain e.g. references
% to a loop variable by name.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: gencode_substruct.m 1862 2008-06-30 14:12:49Z volkmar $

rev = '$Rev: 1862 $'; %#ok

ind = 1;
if nargin < 2
    name = '';
end

if ~isstruct(subs) || ~all(isfield(subs, {'type','subs'}))
    cfg_message('matlabbatch:usage', 'Item is not a substruct.');
else
    str = {name};
    for k = 1:numel(subs)
        switch subs(k).type
            case '.',
                str{1} = sprintf('%s.%s', str{1}, subs(k).subs);
            case {'()','{}'},
                str{1} = sprintf('%s%s', str{1}, subs(k).type(1));
                for l = 1:numel(subs(k).subs)
                    if ischar(subs(k).subs{l})
                        substr = subs(k).subs{l};
                    else
                        substr = sprintf('%d ', subs(k).subs{l});
                        if numel(subs(k).subs{l}) > 1
                            substr = sprintf('[%s]', substr(1:end-1));
                        else
                            substr = substr(1:end-1);
                        end
                    end
                    str{1} = sprintf('%s%s, ', str{1}, substr);
                end
                str{1} = str{1}(1:end-2);
                str{1} = sprintf('%s%s', str{1}, subs(k).type(2));
        end
    end
end
