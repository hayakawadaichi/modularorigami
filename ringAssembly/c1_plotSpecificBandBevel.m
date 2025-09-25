% for a given binding angle and bevel angle, plot the yield of open and
% closed rings
clear all;

%% read data
dataname = 'delE=-17_cTot=1e-08_equilibrium';
load(strcat(dataname,'.mat'));

%% parameter to plot

specificB = 10;
specificBevel = 20;

%% plot yield
figure;

hold on;
c = videcolors(2);

Bindex = find(B==specificB);
bevelIndex = find(bevel==specificBevel);

bar(2:2:NmaxEff(Bindex,bevelIndex),ring_yield{Bindex,bevelIndex}(2:2:NmaxEff(Bindex,bevelIndex)),'FaceColor',c(1,:),'BarWidth',0.5);
bar(1:NmaxEff(Bindex,bevelIndex),openRing_yield{Bindex,bevelIndex},'FaceColor',c(2,:),'BarWidth',1);
xticks(0:2:NmaxEff(Bindex,bevelIndex));

ylim([0 1]);
xlabel('Ring size');
ylabel('Yield');


