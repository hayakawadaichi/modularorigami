function [c,rootsArray] = solveRoot(cTot,Ka,Kc,Nmax)
%FINDROOT 
%{
solve high order equation using roots function
The answer yields a good starting point for gradient descend but may not be
that accurate
%}

%find monomer concentration
%F = cTot - c - 2*(1+Kc(2))*Ka*c^2 - 3*(1+Kc(3))*Ka^2*c^3 - 4*(1+Kc(4))*Ka^3*c^4 - 5*(1+Kc(5))*Ka^4*c^5 - 6*(1+Kc(6))*Ka^5*c^6; %total monomer conserved
%c = roots([-6*(1+Kc(6))*Ka^5, - 5*(1+Kc(5))*Ka^4, - 4*(1+Kc(4))*Ka^3, - 3*(1+Kc(3))*Ka^2, - 2*(1+Kc(2))*Ka, -1, cTot]);

rootsArray2 = zeros(1,Nmax+1);
for n = 0:Nmax
    if n == 0
        rootsArray2(1) = cTot;
    elseif n == 1
        rootsArray2(2) = -1;
    elseif n == 2
        rootsArray2(3) = -2*Ka;
    elseif mod(n,2)==1 %odd number assemblies can't form a ring
        rootsArray2(n+1) = -n*Ka^(n-1);
    elseif mod(n,2)==0 %even number can also have closed state
        rootsArray2(n+1) = -n*(1+Kc(n))*Ka^(n-1);
    end
end
rootsArray2 = flip(rootsArray2);

%remove large values that mess up solving for monomer concentration
rootsArray = rootsArray2(~any( isinf( rootsArray2 ),1 ));
rootsArray(rootsArray<(-cTot*10^1000)) = 0;

%monomer concentration
c = roots(rootsArray);
%no imaginary
c = c(imag(c)==0);
%positive and smaller than cTot
c = c(c>0);
c = c(c<cTot);

end

