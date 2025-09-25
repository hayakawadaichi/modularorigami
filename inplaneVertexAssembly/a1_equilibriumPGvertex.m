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
bendAngle = 0:1:180; %degrees (programmed angle between two rigid bricks)

Nmax = 10;

%% solve
vertex_yield = cell(size(B,2),size(bendAngle,2));
vertex_selectivity = cell(size(B,2),size(bendAngle,2));
for i = 1 : size(B,2)
    for j = 1 : size(bendAngle,2)
        %open vertex and closed vertex concentration of 1-6mer
        [cO,cC] = equilPGvertexInplaneSOE(cTot,delE,B(i),bendAngle(j),Nmax);
        vertex_yield{i,j} = cC.*(1:Nmax)/cTot;
        openStruct_yield{i,j} = cO.*(1:Nmax)/cTot;
        vertex_selectivity{i,j} = cC.*(1:Nmax)/sum(cC.*(1:Nmax));
    end
end

%% save
if saveData == true
    filename = strcat('./delE=',string(delE),'_cTot=',string(cTot),'_equilibrium');
    save(filename);
end


