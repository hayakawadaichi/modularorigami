function [vFace,tri,neibFace] = generateAugmentedOctaCoordinate
%GENERATETETOSACOORDINATE Summary of this function goes here
%   Detailed explanation goes here


%also generates list of neighboring triangles

g = sqrt(2)/2;

vFace(1,:) = [0,0,g];
vFace(2,:) = [0.5,0.5,0];
vFace(3,:) = [0.5,-0.5,0];
vFace(4,:) = [-0.5,0.5,0];
vFace(5,:) = [-0.5,-0.5,0];
vFace(6,:) = [0,0,-g];


%rotate righthanded (towards z) by phi, then righthanded (toward x) by
%theta
theta = 0; %[0 180]
phi = 180 - acos(-1/3)*180/pi; %[0 360]

vFace = rotate3Dz(vFace,0);
vFace = rotate3Dx(vFace,-phi/2);

%find the 7th vertex
vFace(7,:) = sum(vFace([1,2,4],:),1)/3;
vFace(7,2) = vFace(7,2)+sqrt(6)/3;

% what are the 3 vertex coordinates for 20 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 5];
tri(3,:) = [1 4 5];
tri(4,:) = [6 2 3];
tri(5,:) = [6 2 4];
tri(6,:) = [6 3 5];
tri(7,:) = [6 4 5];
tri(8,:) = [1 2 7];
tri(9,:) = [2 4 7];
tri(10,:) = [4 1 7];


%permute so that 1st vertex is in between side 1 and 2
%tri(10:12,:) = circshift(tri(10:12,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,3,4;3,1,5;1,2,6;1,7,8;2,8,9;3,9,7;...
            4,6,10;5,4,11;6,5,12;8,12,11;9,10,12;7,11,10];
  
   
end

