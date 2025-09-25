function saveFigure(savename)
%SAVEFIGURE 

saveas(gcf,savename);
set(gcf,'Color','w');
A = frame2im(getframe(gcf));
alpha = ones(size(A,[1 2]));
alpha(sum(A,3) == 765) = 0;  
imwrite(A,strcat(savename,'.png'),'Alpha',alpha);
exportgraphics(gcf,strcat(savename,'.pdf'),'Resolution',300);
end

