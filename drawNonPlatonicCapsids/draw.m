% maps 632 patters onto icosahedral surfaces


clear all;
%%
currentpath = pwd;

addpath ./functions/

%% parameters

isSaveFigure = false;
savename = strcat('./output/d3');

drawOrientation = true;
rotateViews = true;

%% choose one of the following geometry:
%[vFace,tri,neibFace] = generateOcsaCoordinate; %b4
%[vFace,tri,neibFace] = generateStackedPentaCoordinate; %d5
%[vFace,tri,neibFace] = generateStackedPyramidCoordinate; %d3
%[vFace,tri,neibFace] = generateTetosaCoordinate; %b3
[vFace,tri,neibFace] = generateToumborineCoordinate; %b6
%[vFace,tri,neibFace] = generateSnubDisphenoidCoordinate; 
%[vFace,tri,neibFace] = generateTriaugmentedTriPrismCoordinate; 
%[vFace,tri,neibFace] = generateAugmentedOctaCoordinate; 

%% draw
cT = videcolors(1);

drawNonPlatonicCapsid(vFace,tri,cT,drawOrientation);
daspect([1,1,1])

view([33,70]);
camlight;
if isSaveFigure == true                 
    saveFigure(savename,'');
end

%% rotate different views

phiList = 0:30:90;
thetaList = 0:30:90;

if rotateViews == true
    
    for i = 1 : size(phiList,2)
        for j = 1 : size(thetaList,2)
            view([phiList(i),thetaList(j)]);
            if isSaveFigure == true                 
                saveFigure(savename,strcat('_',string(phiList(i)),'_',string(thetaList(j))));
            end
        end
    end
end
