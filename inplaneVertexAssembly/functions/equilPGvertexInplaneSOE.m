function [cO,cC] = equilPGvertexInplaneSOE(cTot,delE,B,bendAngle,Nmax)
%EQUILPGVERTEXSOE 
%{
system of equations describing the concentrations of clusters at
equilibrium
For vertices with N<=6
%}

%cTot is the total monomer concentration
%delE is the binding energy (kT)
%B is bending modulus (kT)
%bevel angles in degrees

closureBendAngle = [0, 0, (180*(3:Nmax)-360)./(3:Nmax)];
%bevel angle to creat 1(nil), 2, 3, 4, 5, and 6-fold vertex

delTheta = (closureBendAngle - bendAngle)*pi/180; %deviation of actual BINDING ANGLE from vertex BINDING angle

sizearray = 1:Nmax;
%energy difference between open and closed vertex
closeEnergy = delE + B*sizearray.*delTheta.^2/2; 

%equilibrium constant for closure
Kc = exp(-closeEnergy);

%equilibrium constant for association
Ka = exp(-delE);

%F = cTot - c - 2*(1+Kc(2))*Ka*c^2 - 3*(1+Kc(3))*Ka^2*c^3 - 4*(1+Kc(4))*Ka^3*c^4 - 5*(1+Kc(5))*Ka^4*c^5 - 6*(1+Kc(6))*Ka^5*c^6; %total monomer conserved
    
%c = roots([-6*(1+Kc(6))*Ka^5, - 5*(1+Kc(5))*Ka^4, - 4*(1+Kc(4))*Ka^3, - 3*(1+Kc(3))*Ka^2, - 2*(1+Kc(2))*Ka, -1, cTot]);
c = roots([-(Nmax:-1:2).*(1+Kc(Nmax:-1:2)).*Ka.^((Nmax:-1:2)-1), -1, cTot]);

%no imaginary
c = c(imag(c)==0);
%positive and smaller than cTot
c = c(c>0);
c = c(c<cTot);
if size(c,2)>1
    error('more than two solutions')
end

%cO = [c,Ka*c^2,Ka^2*c^3,Ka^3*c^4,Ka^4*c^5,Ka^5*c^6];
cO = [c,(Ka.^(1:(Nmax-1))).*c.^(2:Nmax)];
cC = cO.*Kc;
cC(1) = 0; %shouldn't close with 1mer
end

