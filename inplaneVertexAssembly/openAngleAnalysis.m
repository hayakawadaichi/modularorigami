% obtain bending modulus from angle distribution
clear all;

%% load gel data
angleDist = xlsread('opened_tubuletangledistribution.xlsx'); 
angleDist = angleDist(1:end,3);

%% plot gel data

c = videcolors(2);

avg = mean(angleDist)
stdevAngle = std(angleDist);
B = 1 / (stdevAngle*pi/180)^2
figure;
hold on;

h = histfit(angleDist);
set(h(1),'facecolor',c(1,:)); set(h(2),'color',c(2,:))
xline(avg,'LineWidth',3);

xlabel('Angle');
ylabel('Population');

savename = './output/openAngleDist';
saveFigure(savename);