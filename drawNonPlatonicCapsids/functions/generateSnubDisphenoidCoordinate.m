function [vFace,tri,neibFace] = generateSnubDisphenoidCoordinate
%GENERATETETOSACOORDINATE Summary of this function goes here
%   Detailed explanation goes here

q = roots([2,11,4,-1]);
q = q(q>0);
r = sqrt(q);
s = sqrt((1-q)/2/q);
t = 2*r*s;

%also generates list of neighboring triangles

vFace(1,:) = [0,-r,t];
vFace(2,:) = [0,s,1];
vFace(3,:) = [-t,r,0];
vFace(4,:) = [-1,-s,0];
vFace(5,:) = [1,-s,0];
vFace(6,:) = [t,r,0];
vFace(7,:) = [0,s,-1];
vFace(8,:) = [0,-r,-t];



% what are the 3 vertex coordinates for 10 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 5];
tri(4,:) = [1 5 6];
tri(5,:) = [1 6 2];
tri(6,:) = [2 3 7];
tri(7,:) = [2 6 7];

%permute so that 1st vertex is in between side 1 and 2
%tri(4:6,:) = circshift(tri(4:6,:),[0,2]);

tri(8,:) = [8 7 3];
tri(9,:) = [8 3 4];
tri(10,:) = [8 4 5];
tri(11,:) = [8 5 6];
tri(12,:) = [8 6 7];

%permute so that 1st vertex is in between side 1 and 2
%tri(10:12,:) = circshift(tri(10:12,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,3,4;3,1,5;1,2,6;1,7,8;2,8,9;3,9,7;...
            4,6,10;5,4,11;6,5,12;8,12,11;9,10,12;7,11,10];
  
   
end

