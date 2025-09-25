%given input parameters, this code enumerates the yield of different
%vertices
%this goes to wild concentrations depending on the initial concentration

clear all;

addpath('./functions');
%% input parameters

saveData=true;

cTot = 10^-8; %M
delE = -17;%kT

%% scannable parameters

B = 0:1:100; %kT/rad^2 Bending modulus of bevel angle!
bevel = 0:1:90; %degrees


%% solve
capsid_yield = cell(size(B,2),size(bevel,2));
capsid_selectivity = cell(size(B,2),size(bevel,2));
for i = 1 : size(B,2)
    for j = 1 : size(bevel,2)
        %open vertex and closed vertex concentration of 1-6mer
        [cO,cC] = equilPGvertexSOE(cTot,delE,B(i),bevel(j));
        capsid_yield{i,j} = cC.*[1,2,3,4,5,6]/cTot;
        openStruct_yield{i,j} = cO.*[1,2,3,4,5,6]/cTot;
        capsid_selectivity{i,j} = cC.*[1,2,3,4,5,6]/sum(cC.*[1,2,3,4,5,6]);
    end
end

%% save
if saveData == true
    filename = strcat('./delE=',string(delE),'_cTot=',string(cTot),'_equilibrium');
    save(filename);
end


