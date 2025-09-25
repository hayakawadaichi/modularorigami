function [vFace,tri,neibFace] = generateTriaugmentedTriPrismCoordinate
%GENERATETETOSACOORDINATE Summary of this function goes here
%   Detailed explanation goes here


%also generates list of neighboring triangles

vFace(1,:) = [0,2/sqrt(3),1];
vFace(2,:) = [1,-1/sqrt(3),1];
vFace(3,:) = [-1,-1/sqrt(3),1];
vFace(4,:) = [(1+sqrt(6))/2,(1+sqrt(6))/2/sqrt(3),0];
vFace(5,:) = [0,-(1+sqrt(6))/sqrt(3),0];
vFace(6,:) = [-(1+sqrt(6))/2,(1+sqrt(6))/2/sqrt(3),0];
vFace(7,:) = [0,2/sqrt(3),-1];
vFace(8,:) = [1,-1/sqrt(3),-1];
vFace(9,:) = [-1,-1/sqrt(3),-1];



% what are the 3 vertex coordinates for 10 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 2 4];
tri(3,:) = [2 3 5];
tri(4,:) = [3 1 6];
tri(5,:) = [1 4 7];
tri(6,:) = [1 6 7];
tri(7,:) = [2 4 8];
tri(8,:) = [2 5 8];
tri(9,:) = [3 5 9];
tri(10,:) = [3 6 9];
tri(11,:) = [6 7 9];
tri(12,:) = [7 8 4];
tri(13,:) = [9 8 5];
tri(14,:) = [7 8 9];


%permute so that 1st vertex is in between side 1 and 2
%tri(10:12,:) = circshift(tri(10:12,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,3,4;3,1,5;1,2,6;1,7,8;2,8,9;3,9,7;...
            4,6,10;5,4,11;6,5,12;8,12,11;9,10,12;7,11,10];
  
   
end

