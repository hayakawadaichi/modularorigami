function [vFace,tri,neibFace] = generateStackedPyramidCoordinate
%GENERATESTACKEDPYRAMIDCOORDINATE Summary of this function goes here
%   Detailed explanation goes here

%also generates list of neighboring triangles
z = sqrt(2/3);
x = -1/2/sqrt(3);

vFace(1,:) = [0,0,z];
vFace(2,:) = [1/sqrt(3),0,0];
vFace(3,:) = [x,1/2,0];
vFace(4,:) = [x,-1/2,0];
vFace(5,:) = [0,0,-z];

% what are the 3 vertex coordinates for 10 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 2];
tri(4,:) = [2 5 3];
tri(5,:) = [3 5 4];
tri(6,:) = [4 5 2];
%permute so that 1st vertex is in between side 1 and 2
tri(4:6,:) = circshift(tri(4:6,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,3,4;3,1,5;1,2,6;1,6,5;2,4,6;3,5,4];
  
   
        
end

