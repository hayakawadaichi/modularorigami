function [vFace,tri,neibFace] = generateStackedPentaCoordinate
%GENERATESTACKEDPENTACOORDINATE generates initial vertex coordinates of
%stacked pentamer (10 faces) and number the vertex and the face

%also generates list of neighboring triangles
g = (sqrt(5)-1)/2;
a = 1/2/sin(deg2rad(144));
z = sqrt(1-a^2);

vFace(1,:) = [0,0,z];
vFace(2,:) = [a,0,0];
vFace(3,:) = [a*cos(deg2rad(72)),a*sin(deg2rad(72)),0];
vFace(4,:) = [a*cos(deg2rad(144)),a*sin(deg2rad(144)),0];
vFace(5,:) = [a*cos(deg2rad(144)),-a*sin(deg2rad(144)),0];
vFace(6,:) = [a*cos(deg2rad(72)),-a*sin(deg2rad(72)),0];
vFace(7,:) = [0,0,-z];

% what are the 3 vertex coordinates for 10 triangles?
tri(1,:) = [1 2 3];
tri(2,:) = [1 3 4];
tri(3,:) = [1 4 5];
tri(4,:) = [1 5 6];
tri(5,:) = [1 6 2];
tri(6,:) = [7 3 2];
tri(7,:) = [7 4 3];
tri(8,:) = [7 5 4];
tri(9,:) = [7 6 5];
tri(10,:) = [7 2 6];
%neighbor face for each triangle face
%in order of (left,bottom,right); the face has orientation; 3 vertices
%defined above are clockwise looking from outside, and the 1st two vertices
%compose the bottom of the triangle
neibFace = [2,5,6;3,1,7;4,2,8;5,3,9;6,4,10;...
            10,7,1;6,8,2;7,9,3;8,10,4;9,6,5];
  
        
        
end

