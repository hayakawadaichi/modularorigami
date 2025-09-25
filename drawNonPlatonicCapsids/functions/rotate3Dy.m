function vOut = rotate3Dy(v,angle)
%ROTATE3DY Rotate around y axis in 3D
%   angle in degrees
theta = angle/180*pi;
vOut(:,1) = v(:,3)*sin(theta) + v(:,1)*cos(theta);
vOut(:,2) = v(:,2);
vOut(:,3) = v(:,3)*cos(theta) - v(:,1)*sin(theta);
end