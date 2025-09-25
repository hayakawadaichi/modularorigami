function [vFace,tri,neibFace] = generateOcsaCoordinate
%GENERATEICOSACOORDINATE generates initial vertex coordinates of
%icosahedron (20 faces) and number the vertex and the face

%also generates list of neighboring triangles

z1 = sqrt(2)/2; 
z2 = sqrt(2)/2+2^(-1/4); 
z3 = sqrt(2)+2^(-1/4); 

vFace(1,:) = [0,0,0];
vFace(2,:) = [1/2,-1/2,z1];
vFace(3,:) = [1/2,1/2,z1];
vFace(4,:) = [-1/2,1/2,z1];
vFace(5,:) = [-1/2,-1/2,z1];
vFace(6,:) = [sqrt(2)/2,0,z2];
vFace(7,:) = [0,sqrt(2)/2,z2];
vFace(8,:) = [-sqrt(2)/2,0,z2];
vFace(9,:) = [0,-sqrt(2)/2,z2];
vFace(10,:) = [0,0,z3];

% what are the 3 vertex coordinates for 20 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 5];
tri(4,:) = [1 5 2];
tri(5,:) = [2 6 3];
tri(6,:) = [3 7 4];
tri(7,:) = [4 8 5];
tri(8,:) = [5 9 2];
%permute so that 1st vertex is in between side 1 and 2
tri(5:8,:) = circshift(tri(5:8,:),[0,2]);

tri(9,:) = [6 7 3];
tri(10,:) = [7 8 4];
tri(11,:) = [8 9 5];
tri(12,:) = [9 6 2];
%permute so that 1st vertex is in between side 1 and 2
tri(9:12,:) = circshift(tri(9:12,:),[0,1]);

tri(13,:) = [6 10 7];
tri(14,:) = [7 10 8];
tri(15,:) = [8 10 9];
tri(16,:) = [9 10 6];
%permute so that 1st vertex is in between side 1 and 2
tri(13:16,:) = circshift(tri(13:16,:),[0,2]);

%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [5,4,2;6,1,3;7,2,4;8,3,1;9,12,1;10,9,2;11,10,3;12,11,4;...
            6,13,5;7,14,6;8,15,7;5,16,8;14,16,9;15,13,10;16,14,11;13,15,12];
  
        
        
end

