function [cO,cC,NmaxEff] = computeRingDistribution(c,Ka,Kc,Nmax)
%COMPUTERINGDISTRIBUTION 

%{computes the distribution of open and close rings given the monomer concentration
cO = zeros(1,Nmax);
cC = zeros(1,Nmax);

 for n = 1 : Nmax
    if n == 1
        cO(n) = c;
        cC(n) = 0;
    elseif n == 2
        cO(n) = Ka*c^2;
        cC(n) = 0;
    elseif mod(n,2)==1 %odd number assemblies can't form a ring
        cO(n) = Ka^(n-1)*c^n;
        cC(n) = 0;
    elseif mod(n,2)==0 %even number can also have closed state
        cO(n) = Ka^(n-1)*c^n;
        cC(n) = cO(n).*Kc(n);
    end
 end

cO = cO(~any( isinf(cO)| isnan( cO ),1 ));
cC = cC(~any( isinf(cC)| isnan( cC ),1 ));

NmaxEff = min(size(cO,2),size(cC,2));
cO = cO(1:NmaxEff);
cC = cC(1:NmaxEff);
    

end

