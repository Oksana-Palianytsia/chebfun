function varargout = eig(varargin)
%EIG   Find selected eigenvalues and eigenfunctions of a linear CHEBOP.
%   EIG(N) is not supported. Use EIGS(N) to find selected eigenvalues of a
%   linear operator.
%
% See also CHEBOP/EIGS

% Copyright 2014 by The University of Oxford and The Chebfun Developers. 
% See http://www.chebfun.org/ for Chebfun information.

error('CHEBFUN:chebop:eig:useEIGS',...
    'Use EIGS to find selected eigenvalues of a linear operator.')

end