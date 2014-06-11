function N = set( N, varargin )
%SET   Set chebop properties.
% 
%  N.lbc = F sets left boundary conditions. If is a DOUBLE or a CHEBFUN, 
%  then left Dirichlet conditions with boundary data F are set. 
%  If F = @(x,u) f(x,u), then the conditions f(x,u) = 0 are set along the 
%  left edge.  
% 
%  N.rbc = F, N.ubc = F, N.dbc = F are the same as N.lbc = F but for the
%  right, top, and bottom boundary conditions, respectively.
% 
%  N.domain = F sets the domain of the CHEBOP2. F is expected to be a
%  vector of length 4. 

% Copyright 2014 by The University of Oxford and The Chebfun Developers. 
% See http://www.maths.ox.ac.uk/chebfun/ for Chebfun information.

if ( isempty( N ) )   % empty check  
    N = []; return; 
end

rect = N.domain; 

propertyArgIn = varargin;


while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case {'dom','domain'}
            if isa(val,'double')
                N.domain = val;
            end
        case 'bc'
            N.lbc = chebop2.createBC(val, rect(3:4));
            N.rbc = N.lbc;
            N.ubc = chebop2.createBC(val, rect(1:2));
            N.dbc = N.ubc;
        case 'lbc'
             N.lbc = chebop2.createBC(val, rect(3:4));
        case 'rbc'
             N.rbc = chebop2.createBC(val, rect(3:4));
        case 'ubc'
             N.ubc = chebop2.createBC(val, rect(1:2));
        case 'dbc'
             N.dbc = chebop2.createBC(val, rect(1:2));
        case 'op'
            if isa(val,'function_handle')
                % Do nothing
            else
                error('CHEBOP:set:opType','Operator must by a function handle.')
            end
            N.op = val;
        case 'xorder'
            N.xorder = val; 
        case 'yorder'
            N.yorder = val; 
        case 'U'
            N.U = val;
        case 'S'
            N.S = val;
        case 'V'
            N.V = val;
        otherwise
            error('CHEBOP:set:unknownprop','Unknown chebop property')
    end
end
end