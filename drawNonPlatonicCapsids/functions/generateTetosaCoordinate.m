function [vFace,tri,neibFace] = generateTetosaCoordinate
%GENERATETETOSACOORDINATE Summary of this function goes here
%   Detailed explanation goes here

%also generates list of neighboring triangles
z = sqrt(2/3);
y = 1/2/sqrt(3);

vFace(1,:) = [0,0,z];
vFace(2,:) = [1/sqrt(3),0,0];
vFace(3,:) = [-y,1/2,0];
vFace(4,:) = [-y,-1/2,0];
vFace(5,:) = [y,1/2,-z];
vFace(6,:) = [-1/sqrt(3),0,-z];
vFace(7,:) = [y,-1/2,-z];
vFace(8,:) = [0,0,-2*z];

% what are the 3 vertex coordinates for 10 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 2];
tri(4,:) = [2 5 3];
tri(5,:) = [3 6 4];
tri(6,:) = [4 7 2];
%permute so that 1st vertex is in between side 1 and 2
tri(4:6,:) = circshift(tri(4:6,:),[0,2]);

tri(7,:) = [2 7 5];
tri(8,:) = [3 5 6];
tri(9,:) = [4 6 7];
tri(10,:) = [5 8 6];
tri(11,:) = [6 8 7];
tri(12,:) = [7 8 5];
%permute so that 1st vertex is in between side 1 and 2
tri(10:12,:) = circshift(tri(10:12,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,3,4;3,1,5;1,2,6;1,7,8;2,8,9;3,9,7;...
            4,6,10;5,4,11;6,5,12;8,12,11;9,10,12;7,11,10];
  
   
end

