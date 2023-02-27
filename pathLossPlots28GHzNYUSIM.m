% path loss plots - 28 GHz nyu vs 3gpp (umi, uma, rma, inh)
clc;
clear;

umiData = readtable('pathlossNYUSIM28GHz.xlsx',Sheet='UMi');
umaData = readtable('pathlossNYUSIM28GHz.xlsx',Sheet='UMa');
rmaData = readtable('pathlossNYUSIM28GHz.xlsx',Sheet='RMa');
InHData = readtable('pathlossNYUSIM28GHz.xlsx',Sheet='InH');

figure;
sgt = sgtitle('Path Loss(dB) vs. Distance(m)');
sgt.FontSize = 16;
sgt.FontWeight = "bold";


subplot(2,2,1);
plot(umiData.Var1,umiData.LoS3GPP,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(umiData.Var1,umiData.NLoS3GPP,'LineWidth',2,Color="red");
plot(umiData.Var1,umiData.LoSNYU,'LineWidth',2,LineStyle='--',Color="blue");
plot(umiData.Var1,umiData.NLoSNYU,'LineWidth',2,Color="blue");
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('UMi');
grid on;
xlim([50 1000]);
set(gca,"FontSize",12,"FontWeight","bold");

%Uma
subplot(2,2,2);
plot(umaData.Var1,umaData.LoS3GPP,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(umaData.Var1,umaData.NLoS3GPP,'LineWidth',2,Color="red");
plot(umaData.Var1,umaData.LoSNYU,'LineWidth',2,LineStyle='--',Color="blue");
plot(umaData.Var1,umaData.NLoSNYU,'LineWidth',2,Color="blue");
xlim([50 1000]);
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('UMa');
grid on;
set(gca,"FontSize",12,"FontWeight","bold");

% RMa
subplot(2,2,3);
plot(rmaData.Var1,rmaData.LoS3GPP,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(rmaData.Var1,rmaData.NLoS3GPP,'LineWidth',2,Color="red");
plot(rmaData.Var1,rmaData.LoSNYU,'LineWidth',2,LineStyle='--',Color="blue");
plot(rmaData.Var1,rmaData.NLoSNYU,'LineWidth',2,Color="blue");
xlim([50 1000]);
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('RMa');
grid on;
set(gca,"FontSize",12,"FontWeight","bold");

% InH
subplot(2,2,4);
plot(InHData.Var1,InHData.LoS3GPP,'LineWidth',2,LineStyle='--',Color="red");
hold on;
plot(InHData.Var1,InHData.NLoS3GPP,'LineWidth',2,Color="red");
plot(InHData.Var1,InHData.LoSNYU,'LineWidth',2,LineStyle='--',Color="blue");
plot(InHData.Var1,InHData.NLoSNYU,'LineWidth',2,Color="blue");
hold off;
xlim([1 140]);
ylabel('Mean path Loss (dB)');
xlabel('Distance (m)');
title('InH');
grid on;
set(gca,"FontSize",12,"FontWeight","bold");

lgd = legend({'3GPP LOS','3GPP NLOS','NYU LOS','NYU NLOS'},...
    'Location','northwest','NumColumns',4);
lgd.FontWeight = "bold";
lgd.FontSize = 12;
