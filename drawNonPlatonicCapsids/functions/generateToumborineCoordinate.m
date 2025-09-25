function [vFace,tri,neibFace] = generateToumborineCoordinate
%GENERATEICOSACOORDINATE generates initial vertex coordinates of
%icosahedron (20 faces) and number the vertex and the face

%also generates list of neighboring triangles

z = sqrt(sqrt(3)-1); 

vFace(1,:) = [0,0,0];
vFace(2,:) = [0,-1,0];
vFace(3,:) = [sqrt(3)/2,-1/2,0];
vFace(4,:) = [sqrt(3)/2,1/2,0];
vFace(5,:) = [0,1,0];
vFace(6,:) = [-sqrt(3)/2,1/2,0];
vFace(7,:) = [-sqrt(3)/2,-1/2,0];
vFace(8,:) = [0,0,z];
vFace(9,:) = [1/2,-sqrt(3)/2,z];
vFace(10,:) = [1,0,z];
vFace(11,:) = [1/2,sqrt(3)/2,z];
vFace(12,:) = [-1/2,sqrt(3)/2,z];
vFace(13,:) = [-1,0,z];
vFace(14,:) = [-1/2,-sqrt(3)/2,z];


% what are the 3 vertex coordinates for 20 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 5];
tri(4,:) = [1 5 6];
tri(5,:) = [1 6 7];
tri(6,:) = [1 7 2];
tri(7,:) = [2 9 3];
tri(8,:) = [3 10 4];
tri(9,:) = [4 11 5];
tri(10,:) = [5 12 6];
tri(11,:) = [6 13 7];
tri(12,:) = [7 14 2];
%permute so that 1st vertex is in between side 1 and 2
tri(7:12,:) = circshift(tri(7:12,:),[0,2]);

tri(13,:) = [3 9 10];
tri(14,:) = [4 10 11];
tri(15,:) = [5 11 12];
tri(16,:) = [6 12 13];
tri(17,:) = [7 13 14];
tri(18,:) = [2 14 9];
tri(19,:) = [8 10 9];
tri(20,:) = [8 11 10];
tri(21,:) = [8 12 11];
tri(22,:) = [8 13 12];
tri(23,:) = [8 14 13];
tri(24,:) = [8 9 14];

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [7,6,2;8,1,3;9,2,4;10,3,5;11,4,6;12,5,2;...
            13,18,1;14,13,2;15,14,3;16,15,4;17,16,5;18,17,6;...
            19,7,8;20,8,9;21,9,10;22,10,11;23,11,12;24,12,7;...
            13,20,24;14,21,19;15,22,20;16,23,21;17,24,22;18,19,23];
  
        
        
end

