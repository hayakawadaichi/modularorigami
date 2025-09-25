% plots vertex distributions

clear all;

addpath('./functions');
%% read data
dataname = 'delE=-17_cTot=1e-08_equilibrium';
load(strcat(dataname,'.mat'));

savefig = false;

%% plot yield for different angles

%choose bending modulus
targetBendingModulus = 23; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = videcolors(Nmax);

%yield for different bevel angle
for targetBevel = 0:2:180
    j = find(bendAngle==targetBevel);
    
    bar(j,vertex_yield{i,j},'stacked','LineWidth',0.001,'BarWidth',2);
    colororder(flip(c));

end
ylim([0 1]);
xlabel('Bend Angle');
ylabel('Yield');

if savefig == true
    savename = './output/vertex_yield_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% plot yield for different angles

%choose bending modulus
targetBendingModulus = 10; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = videcolors(size(bendAngle,2));

%yield for different Bend angle
for j = 1:5:size(bendAngle,2)
    plot(1:Nmax,vertex_yield{i,j},'Color',c(j,:),'LineWidth',5,'DisplayName',strcat('tBevel=',string(bendAngle(j))));
    ylim([0 1]);
    xlabel('Vertex size');
    ylabel('Yield');
    grid on;
    box on;
    legend('Location','northwest');
end

if savefig == true
    savename = './output/vertex_yield2_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% yield for (bending angle vs modulus)

c = flip(videcolors(Nmax));

figure
hold on;

%line through correct Bend angles for vertices
closureBendAngle = [0, 0, (180*(3:Nmax)-360)./(3:Nmax)];
for i = 1 : size(closureBendAngle,2)
    %xline(closureBendAngle(i));
end


for i = 1 : 4 : size(B,2)
    for j = 1 : 4 : size(bendAngle,2)
        [markerSize,frequentVertex]=max(vertex_yield{i,j}); 
        markerSize = (markerSize)*10;
        if markerSize == 0
        else
            plot(bendAngle(j),B(i),'o','Color',c(frequentVertex,:),'MarkerSize',markerSize,'MarkerFaceColor',c(frequentVertex,:));
        end
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',7.5,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);


xticks(0:10:180);
xlabel('Bend angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/yield_';
    addOnName=strcat('delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end    

%% selectivity for (bending angle vs modulus)

c = flip(videcolors(Nmax));

figure
hold on;

%line through correct  angles for vertices
closureBendAngle = [0, 180, 120, 90, 72, 60];
for i = 1 : size(closureBendAngle,2)
    %xline(closureBendAngle(i));
end

for i = 1 : 4 : size(B,2)
    for j = 1 : 4 : size(bendAngle,2)
        [markerSize,frequentVertex]=max(vertex_selectivity{i,j}); 
        markerSize = (markerSize)*10;
        if markerSize == 0
        elseif isnan(markerSize)
            plot(bendAngle(j),B(i),'kx','MarkerSize',1);
        else
            plot(bendAngle(j),B(i),'o','Color',c(frequentVertex,:),'MarkerSize',markerSize,'MarkerFaceColor',c(frequentVertex,:));
        end
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',7.5,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);


xticks(0:10:180);
xlabel('Bend angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/selectivity_';
    addOnName=strcat('delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end
