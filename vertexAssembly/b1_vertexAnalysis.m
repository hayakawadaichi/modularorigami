% plots vertex distributions

clear all;

addpath('./functions');
%% read data
dataname = 'delE=-17_cTot=1e-08_equilibrium';
load(strcat(dataname,'.mat'));

savefig = false;
%% plot open and closed structure yield

%choose bending modulus
targetBendingModulus = 25; %kT
i = find(B==targetBendingModulus);

%choose bevel angle
targetBevel = 80; %degrees
j = find(bevel==targetBevel);

figure;
hold on;
c = videcolors(2);

bar(1:6,capsid_yield{i,j},'FaceColor',c(1,:),'BarWidth',0.5);
bar(1:6,openStruct_yield{i,j},'FaceColor',c(2,:),'BarWidth',0.5);

xticks([1:6]);
ylim([0 1]);
xlabel('Vertex size');
ylabel('Yield');

if savefig == true
    savename = './output/yield_';
    addOnName=strcat(string(targetBendingModulus),'kT_',string(targetBevel),'deg');
    saveFigure(strcat(savename,addOnName));
end
%% plot yield for different angles

%choose bending modulus
targetBendingModulus = 25; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = [videcolors(4);0,0,0;0,0,0];

%yield for different bevel angle
for targetBevel = 0:1:90
    j = find(bevel==targetBevel);
    
    bar(j*2,capsid_yield{i,j},'stacked','LineWidth',0.001,'BarWidth',2);
    colororder(flip(c));

end
ylim([0 1]);
xlabel('Binding Angle');
ylabel('Yield');

if savefig == true
    savename = './output/vertex_yield_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end
%% plot selectivity for different angles

%choose bending modulus
targetBendingModulus = 25; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = [videcolors(4);0,0,0;0,0,0];

%yield for different bevel angle
for targetBevel = 0:1:90
    j = find(bevel==targetBevel);
    
    bar(j*2,capsid_selectivity{i,j},'stacked','LineWidth',0.001,'BarWidth',2);
    colororder(flip(c));

end
ylim([0 1]);
xlabel('Binding Angle');
ylabel('Selectivity');

if savefig == true
    savename = './output/vertex_selectivity_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end    
    
%% plot yield for different angles

%choose bending modulus
targetBendingModulus = 10; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = videcolors(size(bevel,2));

%yield for different bevel angle
for targetBevel = 0:5:90
    j = find(bevel==targetBevel);
    
    plot(1:6,capsid_yield{i,j},'Color',c(j,:),'LineWidth',5,'DisplayName',strcat('tBevel=',string(bevel(j))));
    xticks([1:6]);
    ylim([0 1]);
    xlabel('Vertex size');
    ylabel('Yield');
    grid on;
    box on;
    legend('Location','northwest');
end

if savefig == true
    savename = './output/ring_yield2_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% yield for (binding angle vs modulus)

c = videcolors(6);

figure
hold on;

%line through correct bevel angles for vertices
vertexBevel = [0, 90, (180-70.528779)/2, (180-109.47122)/2, (180-138.19)/2,0];
for i = 1 : size(vertexBevel,2)
    %xline(vertexBevel(i));
end


for targetBendingModulus = 1 : 4 : 100
    
    i = find(B==targetBendingModulus);
    
    for targetBevel = 1 : 4 : 90
        j = find(bevel==targetBevel);
        [markerSize,frequentVertex]=max(capsid_yield{i,j}); 
        markerSize = (markerSize)^2*10;
        plot(bevel(j)*2,B(i),'o','Color',c(6-frequentVertex+1,:),'MarkerSize',markerSize,'MarkerFaceColor',c(6-frequentVertex+1,:));
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',2.5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',5.625,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);


%xticks(0:20:180);
xlabel('Binding angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/yieldDiagram_';
    addOnName=strcat('delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end
    

%% selectivity for (binding angle vs modulus)

c = videcolors(6);

figure
hold on;

%line through correct bevel angles for vertices
vertexBevel = [0, 90, (180-70.528779)/2, (180-109.47122)/2, (180-138.19)/2,0];
for i = 1 : size(vertexBevel,2)
    %xline(vertexBevel(i));
end


for targetBendingModulus = 1 : 4 : 100
    
    i = find(B==targetBendingModulus);
    
    for targetBevel = 1 : 4 : 90
        j = find(bevel==targetBevel);
        [markerSize,frequentVertex]=max(capsid_selectivity{i,j}); 
        markerSize = (markerSize)^2*10;
        plot(bevel(j)*2,B(i),'o','Color',c(6-frequentVertex+1,:),'MarkerSize',markerSize,'MarkerFaceColor',c(6-frequentVertex+1,:));
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',2.5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',5.625,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);


%xticks(0:10:90);
xlabel('Binding angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/selectivityDiagram_';
    addOnName=strcat('delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end
    