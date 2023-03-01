%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Function to compute the average packet drops value for each simulation run in %
%
% Input Parameters: TxRxPacketTrace - contains the table of contents for each simulation run from the file
% tx-rx-trace.txt
%
% Output Parameters: AveragePacketDropInEachRun - for each simulation run the average packet drop value in %
%
% *****************************************************************************************************************
function [AveragePacketDropInEachRun] = AveragePacketDropsInEachRun(TxRxPacketTrace)
for i = 1:length(TxRxPacketTrace)
    countTxPackets = 0;
    countRxPackets = 0;
    data_tmp = TxRxPacketTrace{1,i};
    for j = 1:size(data_tmp)
        if data_tmp(j,1).Var1 == "Rx"
            countRxPackets = countRxPackets + 1;
        elseif data_tmp(j,1).Var1 == "Tx"
            countTxPackets = countTxPackets + 1;
        end
    end
    packetLost{i} = ((countTxPackets - countRxPackets)/countTxPackets)*100; 
end
AveragePacketDropInEachRun = cell2mat(packetLost);
end