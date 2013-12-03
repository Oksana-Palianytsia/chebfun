function [reduce,d,dRow,dVar] = getDownsampling(L)
%  Copyright 2013 by The University of Oxford and The Chebfun Developers.
%  See http://www.chebfun.org for Chebfun information.

[m,n] = size(L);
d = L.diffOrder;
dRow = max(d,[],2);
dVar = max(d,[],1);

dRow(~dRow) = NaN;
dVar(~dVar) = NaN;

% This will determine how much is downsampled. 
numBC = length(L.constraint);

% Each variable requires a downsampling contribution equal to its
% differential order. The total diff. orders of the variables might
% not equal the total of the rows.
totalRow = sum( dRow(~isnan(dRow)) );
totalVar = sum( dVar(~isnan(dVar)) );

totalVar = numBC;  % Alex's choice

if (totalRow == totalVar)
    reduce = dRow;
else
    % The only reasonable thing is to spread out the D.O. reductions
    % as evenly as possible among the rows.
    reduce = NaN(1,m);
    isOp = ~isnan(dRow);
    numOp = sum(isOp);
    k = floor( totalVar / numOp );
    reduce(isOp) = k;  % even distribution of order
    i = rem(totalVar,numOp);  % leftover to be made up
    if i > 0
        % Increment the first i rows
        incr = find(isOp,i);
        reduce(incr) = reduce(incr) + 1;
    end
end

reduce(isnan(reduce)) = 0;

end
