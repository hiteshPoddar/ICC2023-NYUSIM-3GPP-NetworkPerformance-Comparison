%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Function to compute the average throughput value for each simulation run in Mbps
%
% Input Parameters: TxRxPacketTrace - contains the table of contents for each simulation run from the file
% tx-rx-trace.txt
%
% Output Parameters: AverageThroughputInEachRun - for each simulation run the average throughput value in Mbps
%
% *****************************************************************************************************************
function [AverageThroughputInEachRun] = AverageThroughputInEachRun(TxRxPacketTrace)

totalSimulationTime = 9; % 10 sec is the total simulation time, effective simulation time is 9 sec.

% fetch the packet bytes values
for i = 1:length(TxRxPacketTrace)
    count = 1;
    data_tmp = TxRxPacketTrace{1,i};
    for j = 1:size(data_tmp)
        if data_tmp(j,1).Var1 == "Rx"
            bytes{i,count} = table2array(data_tmp(j,3));
            count = count + 1;
        end
    end
end

% Add the recieved bytes.
for i = 1:size(bytes,1)
    sum = 0;
    count = 0;
    for j = 1:length(bytes)
        if ~isempty (bytes{i,j})
            sum = sum + bytes{i,j};
            count = count + 1;
        end
    end
    totalBytesRcvd(i) = sum;
    totalRxPacketsRcvd(i) = count;
end

% bytes to bits conversion
totalBitsRcvd = totalBytesRcvd * 8;
% throughput = total bits received per second
throughput = totalBitsRcvd / totalSimulationTime;

% throughput in Mbps
AverageThroughputInEachRun = throughput / 1e6; % in Mbps
end
