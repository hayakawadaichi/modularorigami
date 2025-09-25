%given input parameters, this code enumerates the yield of different rings
%this goes to wild concentrations depending on the initial concentration
%only consider closed structure and monomer as possible state

clear all;

addpath('./functions');
%% input parameters

saveData=false;

cTot = 10^-8; %M
delE = -17;%kT
Nmax = 30; %max assembly/ring size (multiple of 2, larger than 4)

%% scannable parameters

B = 0:1:100; %kT/rad^2 Bending modulus of dihedral angle!
bevel = 0:1:90; %degrees


%% solve
ring_yield = cell(size(B,2),size(bevel,2));
ring_selectivity = cell(size(B,2),size(bevel,2));
NmaxEff = zeros(size(B,2),size(bevel,2));
totConc = zeros(size(B,2),size(bevel,2));
optFail = zeros(size(B,2),size(bevel,2));
ringBevel =  genRingBevel(Nmax);
for i = 1 : size(B,2)
    i
    for j = 1 : size(bevel,2)
        %open vertex and closed vertex concentration of 1-6mer
        [cO,cC,NmaxEff(i,j),optFail(i,j)] = equilPGringSOE(cTot,delE,Nmax,B(i),bevel(j),ringBevel);
        ring_yield{i,j} = cC.*(1:NmaxEff(i,j))/cTot;
        openRing_yield{i,j} = cO.*(1:NmaxEff(i,j))/cTot;
        ring_selectivity{i,j} = cC.*(1:NmaxEff(i,j))/sum(cC.*(1:NmaxEff(i,j)));
        totConc(i,j) = sum((cC+cO).* (1:NmaxEff(i,j)));
    end
end

%% save
if saveData == true
    filename = strcat('./delE=',string(delE),'_cTot=',string(cTot),'_equilibrium');
    save(filename);
end


