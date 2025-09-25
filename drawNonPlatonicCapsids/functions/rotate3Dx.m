function vOut = rotate3Dx(v,angle)
%ROTATE3DX Rotate around x axis in 3D
%   angle in degrees
theta = angle/180*pi;
vOut(:,1) = v(:,1);
vOut(:,2) = v(:,2)*cos(theta) - v(:,3)*sin(theta);
vOut(:,3) = v(:,2)*sin(theta) + v(:,3)*cos(theta);
end

