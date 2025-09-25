function [copt,fopt] = gradDescRoots(cInit,cTot,rootsArray)
%GRADDESCROOTS 

%operate gradient descent on the high order equation whose coefficient is
%given by rootsArray
%initial c is given by cInit

% we want to find solution for f(c)=0
f = poly2sym(rootsArray);
% which is equivalent of finding max (not min in this case) of the integral
%F = int(f);

%gradient descent, fast at first, then slow to cover range of scales
[copt,~,~] = grad_descent(cTot,cInit,f,0.1);
[copt,~,~] = grad_descent(cTot,copt,f,0.01);
[copt,fopt,~] = grad_descent(cTot,copt,f,0.001);

end

