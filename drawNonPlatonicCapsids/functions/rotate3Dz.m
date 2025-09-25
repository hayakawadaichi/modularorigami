function vOut = rotate3Dz(v,angle)
%ROTATE3DZ Rotate around z axis in 3D
%   angle in degrees
theta = angle/180*pi;
vOut(:,1) = v(:,1)*cos(theta) - v(:,2)*sin(theta);
vOut(:,2) = v(:,1)*sin(theta) + v(:,2)*cos(theta);
vOut(:,3) = v(:,3);
end