function drawNonPlatonicCapsid(vFace,tri,cT,drawOrientation)
%DRAWCAPSID 

% if drawOrientation ==true, then a line points to vertex 1

%% draw
figure
axis off;
hold on;


for i = 1 : size(tri,1)

    vCoor = vFace(tri(i,:),:);
    patch(vCoor(:,1),vCoor(:,2),vCoor(:,3), cT,'FaceAlpha',1);
    
    if drawOrientation == true
        center = mean(vCoor,1);
        line([center(1),vCoor(1,1)],[center(2),vCoor(1,2)],[center(3),vCoor(1,3)],'Color','k','LineWidth',1);
    end
    
end

set(gcf, 'Units', 'centimeters');
start = 3;
x_width=25;
y_width=25;
daspect([1 1 1]);
set(gcf, 'WindowStyle','normal','Position', [start start x_width y_width]); %
set(gcf,'Renderer','Painters');
view([120 20]);

end

