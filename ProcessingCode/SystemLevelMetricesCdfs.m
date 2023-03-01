%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Main entry point to compute the SINR, average end-to-end latency, throughput and packet 
% drop values.
%
% Output: SINR ECDF, latency, throughput and packet drop
%
% *****************************************************************************************************************
clc;
clear;
close all;

% 3GPP SCM and NYUSIM folder locations. Modify to input your paths - make sure to use the same scenario
% for both 3GPP SCM and NYUSIM and LOS and NLOS.
mainFolderThreeGpp = ["G:\ICC23_Code&Results\3GPPRmaLos","G:\ICC23_Code&Results\3GPPRmaNlos"];
mainFolderNyu = ["G:\ICC23_Code&Results\nyuRmaLos","G:\ICC23_Code&Results\nyuRmaNlos"];

% Read RxPacketTrace.txt file for 3GPP SCM generated from ns-3 for LOS/NLOS.
[threeGppLosRxPacketTrace,threeGppNlosRxPacketTrace] = ReadRxPacketTrace(mainFolderThreeGpp);

% Read RxPacketTrace.txt file for NYUSIM generated from ns-3 for LOS/NLOS.
[nyuLosRxPacketTrace,nyuNlosRxPacketTrace] = ReadRxPacketTrace(mainFolderNyu);

% Read tx-rx-packet-trace.txt for 3GPP SCM generated from ns-3 for LOS/NLOS.
[threeGppLosTxRxPacketTrace,threeGppNlosTxRxPacketTrace] = ReadTxRxPacketTrace(mainFolderThreeGpp);

% Read tx-rx-packet-trace.txt for NYUSIM generated from ns-3 for LOS/NLOS.
[nyuLosTxRxPacketTrace,nyuNlosTxRxPacketTrace] = ReadTxRxPacketTrace(mainFolderNyu);

%% SINR 3GPP SCM and NYUSIM for LOS/NLOS
% Average SINR in each Run with 3GPP SCM for LOS/NLOS
threeGppLosAverageSINRInEachRun = AverageSINRInEachRun(threeGppLosRxPacketTrace);
threeGppNlosAverageSINRInEachRun = AverageSINRInEachRun(threeGppNlosRxPacketTrace);

% Average SINR in each Run with NYUSIM for LOS/NLOS
nyuLosAverageSINRInEachRun = AverageSINRInEachRun(nyuLosRxPacketTrace);
nyuNlosAverageSINRInEachRun = AverageSINRInEachRun(nyuNlosRxPacketTrace);

fprintf("Sinr completed");

%% Average end-to-end latency 3GPP SCM and NYUSIM for LOS/NLOS
% Average end-to-end latency in each run with 3GPP SCM for LOS/NLOS
threeGppLosAverageLatencyInEachRun = AverageLatencyInEachRun(threeGppLosTxRxPacketTrace);
threeGppNlosAverageLatencyInEachRun = AverageLatencyInEachRun(threeGppNlosTxRxPacketTrace);

% Average end-to-end latency in each run with NYUSIM for LOS/NLOS
nyuLosAverageLatencyInEachRun = AverageLatencyInEachRun(nyuLosTxRxPacketTrace);
nyuNlosAverageLatencyInEachRun = AverageLatencyInEachRun(nyuNlosTxRxPacketTrace);

% Remove NaN - occurs in cases when no Rx packet is received (case where SINR is very low < -5 dB)
threeGppLosAverageLatencyInEachRunRefined = threeGppLosAverageLatencyInEachRun(~isnan(threeGppLosAverageLatencyInEachRun));
threeGppNlosAverageLatencyInEachRunRefined = threeGppNlosAverageLatencyInEachRun(~isnan(threeGppNlosAverageLatencyInEachRun));
nyusimLosAverageLatencyInEachRunRefined = nyuLosAverageLatencyInEachRun(~isnan(nyuLosAverageLatencyInEachRun));
nyusimNlosAverageLatencyInEachRunRefined = nyuNlosAverageLatencyInEachRun(~isnan(nyuNlosAverageLatencyInEachRun));

% Average end-to-end latency 3GPP SCM and NYUSIM for LOS/NLOS
threeGppLosLatency = round(mean(threeGppLosAverageLatencyInEachRunRefined),2);
threeGppNlosLatency = round(mean(threeGppNlosAverageLatencyInEachRunRefined),2);
nyusimLosLatency = round(mean(nyusimLosAverageLatencyInEachRunRefined),2);
nyusimNlosLatency = round(mean(nyusimNlosAverageLatencyInEachRunRefined),2);

fprintf("latency calculations completed");

%% Average end-to-end throughput 3GPP and NYU for LOS/NLOS

% Average end-to-end throughput in each Run with 3GPP channel model for LOS/NLOS
threeGppLosAverageThroughputInEachRun = AverageThroughputInEachRun(threeGppLosTxRxPacketTrace);
threeGppNlosAverageThroughputInEachRun = AverageThroughputInEachRun(threeGppNlosTxRxPacketTrace);

% Average end-to-end throughput in each Run with NYU channel model for LOS/NLOS
nyuLosAverageThroughputInEachRun = AverageThroughputInEachRun(nyuLosTxRxPacketTrace);
nyuNlosAverageThroughputInEachRun = AverageThroughputInEachRun(nyuNlosTxRxPacketTrace);

% Remove NaN - occurs in cases when no Rx packet is received (case where SINR is very low < -5 dB)
threeGppLosAverageThroughputInEachRunRefined = threeGppLosAverageThroughputInEachRun(~isnan(threeGppLosAverageThroughputInEachRun));
threeGppNlosAverageThroughputInEachRunRefined = threeGppNlosAverageThroughputInEachRun(~isnan(threeGppNlosAverageThroughputInEachRun));
nyusimLosAverageThroughputInEachRunRefined = nyuLosAverageThroughputInEachRun(~isnan(nyuLosAverageThroughputInEachRun));
nyusimNlosAverageThroughputInEachRunRefined = nyuNlosAverageThroughputInEachRun(~isnan(nyuNlosAverageThroughputInEachRun));

% Average end-to-end throughput with 3GPP channel model for LOS/NLOS
threeGppLosThroughput = round(mean(threeGppLosAverageThroughputInEachRunRefined),2);
threeGppNlosThroughput = round(mean(threeGppNlosAverageThroughputInEachRunRefined),2);
nyusimLosThroughput = round(mean(nyusimLosAverageThroughputInEachRunRefined),2);
nyusimNlosThroughput = round(mean(nyusimNlosAverageThroughputInEachRunRefined),2);

fprintf("throughput calculation completed");

%% Average end-to-end packetDrops 3GPP and NYU for LOS/NLOS

% Average end-to-end packet drops in each Run with 3GPP SCM for LOS/NLOS
threeGppLosAveragePacketDropsInEachRun = AveragePacketDropsInEachRun(threeGppLosTxRxPacketTrace);
threeGppNlosAveragePacketDropsInEachRun = AveragePacketDropsInEachRun(threeGppNlosTxRxPacketTrace);

% Average end-to-end packet drops in each Run with NYUSIM for LOS/NLOS
nyuLosAveragePacketDropsInEachRun = AveragePacketDropsInEachRun(nyuLosTxRxPacketTrace);
nyuNlosAveragePacketDropsInEachRun = AveragePacketDropsInEachRun(nyuNlosTxRxPacketTrace);

% Remove NaN - occurs in cases when no Rx packet is received (case where SINR is very low < -5 dB)
threeGppLosAveragePacketDropsInEachRunRefined = threeGppLosAveragePacketDropsInEachRun(~isnan(threeGppLosAveragePacketDropsInEachRun));
threeGppNlosAveragePacketDropsInEachRunRefined = threeGppNlosAveragePacketDropsInEachRun(~isnan(threeGppNlosAveragePacketDropsInEachRun));
nyusimLosAveragePacketDropsInEachRunRefined = nyuLosAveragePacketDropsInEachRun(~isnan(nyuLosAveragePacketDropsInEachRun));
nyusimNlosAveragePacketDropsInEachRunRefined = nyuNlosAveragePacketDropsInEachRun(~isnan(nyuNlosAveragePacketDropsInEachRun));

% Average end-to-end packet drop with 3GPP SCM for LOS/NLOS
threeGppLosPacketDrops = round(mean(threeGppLosAveragePacketDropsInEachRunRefined),2);
threeGppNlosPacketDrops = round(mean(threeGppNlosAveragePacketDropsInEachRunRefined),2);
nyusimLosPacketDrops = round(mean(nyusimLosAveragePacketDropsInEachRunRefined),2);
nyusimNlosPacketDrops = round(mean(nyusimNlosAveragePacketDropsInEachRunRefined),2);

fprintf("packet drops completed");

%% The scenario depends on what folders you are fetching the values from. Ex: 3GPPInHLos implies you are 
% fetching values for indoor hotspot scenario in LOS channel condition using 3GPP SCM.
fprintf("\n 3GPP SCM LOS Avg.Latency: %d ms, 3GPP SCM NLOS Avg.Latency: %d ms",threeGppLosLatency,threeGppNlosLatency);
fprintf("\n NYUSIM LOS Avg.Latency: %d ms, NYUSIM NLOS Avg.Latency: %d ms",nyusimLosLatency,nyusimNlosLatency);
fprintf("\n 3GPP SCM LOS Avg.Throughput: %d Mbps, 3GPP SCM NLOS Avg.Throughput: %d Mbps",threeGppLosThroughput,threeGppNlosThroughput);
fprintf("\n NYUSIM LOS Avg.Throughput: %d Mbps, NYUSIM NLOS Avg.Throughput: %d Mbps",nyusimLosThroughput,nyusimNlosThroughput);
fprintf("\n 3GPP SCM LOS Avg.Packet Drop: %d, 3GPP SCM NLOS Avg.Packet Drop: %d",threeGppLosPacketDrops,threeGppNlosPacketDrops);
fprintf("\n NYUSIM LOS Avg.Packet Drop: %d, NYUSIM NLOS Avg.Packet Drop: %d",nyusimLosPacketDrops,nyusimNlosPacketDrops);

%% ECDF SINR plots
figure;
subplot(1,3,1);
p1 = cdfplot(threeGppLosAverageSINRInEachRun);
hold on;
p2 = cdfplot(nyuLosAverageSINRInEachRun);
title('InH - SINR');
xlabel('SINR (dB)');
ylabel('ECDF');
set(p1,'LineStyle', '--','LineWidth',3,'color',[0.93 0.69 0.13]);
set(p2,'LineStyle', '-', 'LineWidth',3,'color',[0.07 0.62 1.00]);
legend('3GPP SCM','NYUSIM','FontSize',15);
ax = gca;
grid on;
set(ax,'xminorgrid','on','yminorgrid','on');
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
ax.GridColor = 'k';
ax.GridAlpha = 0.3;

% NLOS
subplot(1,3,2);
p1 = cdfplot(threeGppNlosAverageSINRInEachRun);
hold on;
p2 = cdfplot(nyuNlosAverageSINRInEachRun);
title('InH - SINR');
xlabel('SINR (dB)');
ylabel('ECDF');
set(p1,'LineStyle', '--','LineWidth',3,'color',[0.93 0.69 0.13]);
set(p2,'LineStyle', '-', 'LineWidth',3,'color',[0.07 0.62 1.00]);
legend('3GPP SCM','NYUSIM','FontSize',15);
ax = gca;
grid on;
set(ax,'xminorgrid','on','yminorgrid','on');
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
ax.GridColor = 'k';
ax.GridAlpha = 0.3;
