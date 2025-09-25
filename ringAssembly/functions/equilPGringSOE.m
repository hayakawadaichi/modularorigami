function [cO,cC,NmaxEff,optFail] = equilPGringSOE(cTot,delE,Nmax,B,bevel,ringBevel)
%EQUILPGVERTEXSOE 
%{
system of equations describing the concentrations of clusters at
equilibrium
For vertices with N<=6
%}

tol = 1; %tolerance for c (in %)

%cTot is the total monomer concentration
%delE is the binding energy (kT)
%B is bending modulus (kT)
%bevel angles in degrees

%% set up

%bevel angle to creat 1(nil), 2, 3, 4, 5, and 6-fold vertex
delTheta = 2*(ringBevel - bevel)*pi/180; %deviation of actual BINDING ANGLE from vertex BINDING angle

sizeArray = 1:Nmax;
%energy difference between open and closed vertex
closeEnergy = delE + B*sizeArray.*delTheta.^2/2; 

%equilibrium constant for closure
Kc = exp(-closeEnergy);
%can't close on odd numbers
Kc(1:2:end)=0;

%equilibrium constant for association
Ka = exp(-delE);

%%

[c,rootsArray] = solveRoot(cTot,Ka,Kc,Nmax);

%c can have multiple solutions, in which choose the solution where the sum
%of all nmers give me the closest number to cTot
if sum(size(c)) > 2
    cTotCandidate = [];
    for i = 1 : size(c,1)
        [cO,cC,NmaxEff] = computeRingDistribution(c(i),Ka,Kc,Nmax);
        cTotCandidate(i) = sum((cC+cO).*(1:Nmax));
    end
    %find cTotCandidate that's closest to cTot
    [~,index] = findClosestVal(cTotCandidate,cTot);
    c = c(index);
end

%there might be no solution to c, just give a placeholder, it will probably
%be rejected in the end
if isempty(c)
    c = cTot;
end

[cO,cC,NmaxEff] = computeRingDistribution(c,Ka,Kc,Nmax);

%run gradient descend if the sum of conc. of all states don't add up to cTot
if isalmost(sum((cC+cO).*(1:Nmax)),cTot,cTot*tol/100)
else
   %optimize further using gradient descent
   [copt,~] = gradDescRoots(c,cTot,rootsArray);
   [cO,cC,NmaxEff] = computeRingDistribution(copt,Ka,Kc,Nmax);
end

%sometimes, the optimization still can't complete to a good level
%in that case, return failedOptimization
optFail = false;
if ~isalmost(sum((cC+cO).*(1:Nmax)),cTot,cTot*tol/100)
    warning('c value not optimized well');
    optFail = true;
end


end


