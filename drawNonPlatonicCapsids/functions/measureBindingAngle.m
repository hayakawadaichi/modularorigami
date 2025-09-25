function bindingAngle = measureBindingAngle(vertices,neighborVertex,vFace)
%MEASUREBINDINGANGLE 

%find the 2 shared vertex, not shared, and  new vertex
sharedVertex = vertices(ismember(vertices,neighborVertex));
notSharedVertex = vertices(~ismember(vertices,neighborVertex));
newVertex = neighborVertex(~ismember(neighborVertex,vertices));

%obtain the mid point of shared vertex
midPoint = mean(vFace(sharedVertex,:));

%two vectors
v1 = midPoint - vFace(notSharedVertex,:);
v2 = vFace(newVertex,:) - midPoint;

bindingAngle = atan2(norm(cross(v1,v2)), dot(v1,v2))*180/pi;
%0 when bound flat, 90 degrees for vertical
%this is always positive number

%always make it positive
bindingAngle = abs(bindingAngle);      
end

