function [val,index] = findClosestVal(valArray,refVal)
%FINDCLOSEST 

%find a value in valArray that is closest to refVal
[val,index] = min(abs(valArray-refVal));

end

