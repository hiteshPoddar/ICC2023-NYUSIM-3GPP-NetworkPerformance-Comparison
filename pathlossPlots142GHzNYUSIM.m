% path loss plots - 142 GHz nyu (umi, uma, rma, inh, inf)

clc;
clear;

UmiData = readtable('pathlossNYUSIM142GHz.xlsx',Sheet='Umi');
UmaData = readtable('pathlossNYUSIM142GHz.xlsx',Sheet='Uma');
RmaData = readtable('pathlossNYUSIM142GHz.xlsx',Sheet='Rma');
InHData = readtable('pathlossNYUSIM142GHz.xlsx',Sheet='InH');
InFData = readtable('pathlossNYUSIM142GHz.xlsx',Sheet='InF');

figure;
sgt = sgtitle('Path Loss(dB) vs. Distance(m)');
sgt = sgtitle('Path Loss(dB) vs. Distance(m)');
sgt.FontSize = 16;
sgt.FontWeight = "bold";


subplot(1,5,1);
plot(UmiData.Var1,UmiData.UmiLos,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(UmiData.Var1,UmiData.UmiNlos,'LineWidth',2,LineStyle='--',Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('UMi');
grid on;
xlim([1 5000]);
set(gca,"FontSize",12,"FontWeight","bold");
lgd = legend({'LOS','NLOS'},...
    'Location','northwest','NumColumns',1);
lgd.FontWeight = "bold";
lgd.FontSize = 12;

subplot(1,5,2);
plot(UmaData.Var1,UmaData.UmaLos,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(UmaData.Var1,UmaData.UmaNlos,'LineWidth',2,LineStyle='--',Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('UMa');
grid on;
xlim([1 5000]);
set(gca,"FontSize",12,"FontWeight","bold");
lgd = legend({'LOS','NLOS'},...
    'Location','northwest','NumColumns',1);
lgd.FontWeight = "bold";
lgd.FontSize = 12;

subplot(1,5,3);
plot(RmaData.Var1,RmaData.RmaLos,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(RmaData.Var1,RmaData.RmaNlos,'LineWidth',2,LineStyle='--',Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('RMa');
grid on;
xlim([1 10000]);
set(gca,"FontSize",12,"FontWeight","bold");
lgd = legend({'LOS','NLOS'},...
    'Location','northwest','NumColumns',1);
lgd.FontWeight = "bold";
lgd.FontSize = 12;

subplot(1,5,4);
plot(InHData.Var1,InHData.InHLos,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(InHData.Var1,InHData.InHNlos,'LineWidth',2,LineStyle='--',Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('InH');
grid on;
xlim([1 150]);
set(gca,"FontSize",12,"FontWeight","bold");
lgd = legend({'LOS','NLOS'},...
    'Location','northwest','NumColumns',1);
lgd.FontWeight = "bold";
lgd.FontSize = 12;

subplot(1,5,5);
plot(InFData.Var1,InFData.InFLos,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(InFData.Var1,InFData.InFNlos,'LineWidth',2,LineStyle='--',Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('InF');
grid on;
xlim([1 600]);
set(gca,"FontSize",12,"FontWeight","bold");
lgd = legend({'LOS','NLOS'},...
    'Location','northwest','NumColumns',1);
lgd.FontWeight = "bold";
lgd.FontSize = 12;
