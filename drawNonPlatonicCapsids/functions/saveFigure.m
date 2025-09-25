function saveFigure(savename,addOnName)
%SAVEFIGURE Summary of this function goes here
%   Detailed explanation goes here


saveas(gcf,strcat(savename,addOnName));
set(gcf,'Color','w');
A = frame2im(getframe(gcf));
alpha = ones(size(A,[1 2]));
alpha(sum(A,3) == 765) = 0;  
imwrite(A,strcat(savename,addOnName,'.png'),'Alpha',alpha);
exportgraphics(gcf,strcat(savename,addOnName,'.pdf'),'Resolution',300)
                
end

