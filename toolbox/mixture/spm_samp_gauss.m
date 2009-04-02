function [x] = spm_samp_gauss (m, C, N)
% Sample from a Gaussian PDF
% FORMAT [x] = spm_samp_gauss (m, C, N)
% m     [d x 1] mean
% C     [d x d] covar
% N     Number of samples
%
% x     [N x d] matrix of samples
%___________________________________________________________________________
% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging

% Will Penny 
% $Id: spm_samp_gauss.m 1143 2008-02-07 19:33:33Z spm $

d = size(C, 1);
m = reshape(m, 1, d);   % Ensure that m is a row vector

[evec, eval] = eig(C);
deig=diag(eval);

imag_e=find(abs(imag(deig))>0);
neg_e=find(deig<0);
rem=unique([imag_e;neg_e]);

if (length(rem)>0), 
  %warning('Covariance Matrix is not OK, redefined to be positive definite');
  deig(rem)=[];
  evec(:,rem)=[];
end
k=length(deig);

proj = randn(N, k)*diag(sqrt(deig));
x = ones(N, 1)*m + proj*evec';
