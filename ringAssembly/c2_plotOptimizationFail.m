% plot where optimization failed
clear all;

%% read data
dataname = 'delE=-17_cTot=1e-08_equilibrium';
load(strcat(dataname,'.mat'));


%% plot failed locations
figure;

[failBending,failBevel] = find(optFail);

plot(failBevel,failBending,'xr','LineWidth',2);
xlim([0 size(B,2)]);
ylim([0 size(bevel,2)]);
xlabel('Bevel angle');
ylabel('Bending modulus');
grid on;
box on;

%% plot how far off from target cTot the total concentration is
%likely caused by failed optimization of concentrations

figure;
hold on;
devConc = abs(totConc-cTot);


for i = 1 : size(B,2)
    for j = 1 : size(bevel,2)
        markerSize = devConc(i,j); 
        
        if isalmost(markerSize,0,cTot*1e-3)
        else
            markerSize = log10(markerSize)+11;
            plot(bevel(j),B(i),'o','Color','r','MarkerSize',markerSize,'MarkerFaceColor','r');
        end
        
    end
end

xlim([0 size(B,2)]);
ylim([0 size(bevel,2)]);
xlabel('Bevel angle');
ylabel('Bending modulus');
grid on;
box on;

