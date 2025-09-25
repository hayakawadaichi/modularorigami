function vertexBevel = genRingBevel(Nmax)
%GENRINGBEVEL generates bevel angle of the triangles for given ring size

vertexBevel = zeros(1,Nmax);

for n = 4 : 2 : Nmax
    
    R = 1/2/sin(2*pi/n); %radius to triangle vertex
    z = sqrt(3/4 - R^2* (1-cos(2*pi/n))^2);
    
    ang = 2*pi/n;
    Acenter = [R*(1+2*cos(ang)), 0, 2*z]/3;
    Bcenter = [R*(1+cos(ang)+cos(2*ang)), R*(sin(ang)+sin(ang*2)), z]/3;
    middle = [R*(1+cos(ang)),R*sin(ang),z]/2;
    
    u = middle - Acenter;
    v = Bcenter - middle;
    bindingangle = atan2(norm(cross(u,v)),dot(u,v))*180/pi;
    
    vertexBevel(n) = bindingangle/2;
end

    
end

