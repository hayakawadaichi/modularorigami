% plots ring distributions
clear all;

addpath('./functions');
%% read data
dataname = 'delE=-17_cTot=1e-08_equilibrium';
load(strcat(dataname,'.mat'));

savefig = false;
%%
ringBevel =  genRingBevel(Nmax);
iRing = 7; %ring size up to which you want colored is iRing*2+2


%% plot optFail (failed to optimize for given parameter set)

figure
hold on;

for i = 1 : 1 : size(B,2)
    for j = 1 : 1 : size(bevel,2)
        if optFail(i,j)==true %if optimization failed
            plot(bevel(j),B(i),'kx','MarkerSize',5);
        end
    end
end

%% plot yield for different angles

%choose bending modulus
targetBendingModulus = 25; %kT
i = find(B==targetBendingModulus);

figure;
hold on;
c = repelem(videcolors(iRing),2,1);
c = [zeros(3,3);flip(c);zeros(Nmax-3-iRing*2,3)];

%yield for different bevel angle
for targetBevel = 0:1:90
    j = find(bevel==targetBevel);
    
    bar(j*2,ring_yield{i,j},'stacked','LineWidth',0.001,'BarWidth',2);
    colororder(c);

end
ylim([0 1]);
xlabel('Binding Angle');
ylabel('Yield');

if savefig == true
    savename = './output/ring_yield_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% plot selectivity for different angles

%choose bending modulus
targetBendingModulus = 25; %kT
i = find(B==targetBendingModulus);

figure
hold on;
c = repelem(videcolors(iRing),2,1);
c = [zeros(3,3);flip(c);zeros(Nmax-3-iRing*2,3)];   

%yield for different bevel angle
for targetBevel = 0:1:90
    j = find(bevel==targetBevel);
    
    bar(j*2,ring_selectivity{i,j},'stacked','LineWidth',0.001,'BarWidth',2);
    colororder(c);

end
%xticks([1:6]);
ylim([0 1]);
xlabel('Binding Angle');
ylabel('Selectivity');

if savefig == true
    savename = './output/ring_selectivity_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% plot yield of closed rings for given bending modulus

%choose index for bending modulus
Btarget = 30; %kT/rad^2
i = find(B==Btarget);

figure
hold on;
c = videcolors(size(bevel,2));

%yield for different bevel angle
for j = 1:5:size(bevel,2)
    plot(2:2:NmaxEff(i,j),ring_yield{i,j}(2:2:NmaxEff(i,j)),'Color',c(j,:),'LineWidth',5,'DisplayName',strcat('tBevel=',string(bevel(j))));
    xticks(1:NmaxEff(i,j));
    ylim([0 1]);
    xlabel('Ring size');
    ylabel('Yield');
    grid on;
    box on;
    legend('Location','northeast');
end

if savefig == true
    savename = './output/ring_yield2_';
    addOnName=strcat('B',string(Btarget),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% yield for (binding angle vs modulus)

c = flip(videcolors(iRing));

figure
hold on;

%line through correct bevel angles for vertices
for i = 1 : iRing
    %xline(ringBevel(i*2+2),'Color',c(i,:));
end

for i = 1 : 4 : size(B,2)
    for j = 1 : 4 : size(bevel,2)
        [markerSize,frequentVertex]=max(ring_yield{i,j}); 
        if optFail(i,j)==true %if optimization failed
            plot(bevel(j),B(i),'ko','MarkerSize',5);
        else
            markerSize = (markerSize)*10;
            %above size iRing, color with black circle
            if ((frequentVertex-2)/2) <= iRing
                plot(bevel(j)*2,B(i),'o','Color',c((frequentVertex-2)/2,:),'MarkerSize',markerSize,'MarkerFaceColor',c((frequentVertex-2)/2,:));
            else
                plot(bevel(j)*2,B(i),'kx','MarkerSize',markerSize);
            end
        end
        
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',7.5,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);

% marker color for 4,6,8,10,...iRing*2+2 mer rings
ylocation = linspace(50,90,iRing);
for i = 1 : iRing
    plot(185,ylocation(i),'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',c(i,:));
end


%xticks(0:10:90);
xlabel('Binding angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/yieldDiagram_';
    addOnName=strcat('B',string(targetBendingModulus),'kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end

%% selectivity for (binding angle vs modulus)

c = flip(videcolors(iRing));

figure
hold on;

%line through correct bevel angles for vertices

for i = 1 : iRing
    %xline(ringBevel(i*2+2),'Color',c(i,:));
end


for i = 1 : 3 : size(B,2)
    for j = 1 : 3 : size(bevel,2)
        [markerSize,frequentVertex]=max(ring_selectivity{i,j}); 
        markerSize = (markerSize)*10;
        if optFail(i,j)==true %if optimization failed
            plot(bevel(j)*2,B(i),'ko','MarkerSize',5);
        else
            if ((frequentVertex-2)/2) <= iRing
                plot(bevel(j)*2,B(i),'o','Color',c((frequentVertex-2)/2,:),'MarkerSize',markerSize,'MarkerFaceColor',c((frequentVertex-2)/2,:));
            else
                plot(bevel(j)*2,B(i),'ko','MarkerSize',markerSize,'MarkerFaceColor','k');
            end
        end
    end
end

% marker size for 100, 75, 50% yield
plot(185,25,'o','Color',[0 0 0],'MarkerSize',5,'MarkerFaceColor',[0 0 0]);
plot(185,30,'o','Color',[0 0 0],'MarkerSize',7.5,'MarkerFaceColor',[0 0 0]);
plot(185,35,'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',[0 0 0]);

% marker color for 4,6,8,10,...iRing*2+2 mer rings
ylocation = linspace(50,90,iRing);
for i = 1 : iRing
    plot(185,ylocation(i),'o','Color',[0 0 0],'MarkerSize',10,'MarkerFaceColor',c(i,:));
end


%xticks(0:10:90);
xlabel('Binding angle');
ylabel('Bending modulus');
grid on;
box on;

if savefig == true
    savename = './output/selectivityDiagram_';
    addOnName=strcat('kT_delE_',string(delE),'kT');
    saveFigure(strcat(savename,addOnName));
end