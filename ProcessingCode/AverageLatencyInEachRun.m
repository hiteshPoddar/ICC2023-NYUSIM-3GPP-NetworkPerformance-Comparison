%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Function to compute the average latency value for each simulation run in ms
%
% Input Parameters: TxRxPacketTrace - contains the table of contents for each simulation run from the file
% tx-rx-trace.txt
%
% Output Parameters: AverageLatencyInEachRun - for each simulation run the average latency value in ms
%
% *****************************************************************************************************************
function [AverageLatencyInEachRun] = AverageLatencyInEachRun(TxRxPacketTrace)

% fetch all the delay values in each run
for i = 1:length(TxRxPacketTrace)
    count = 1;
    data_tmp = TxRxPacketTrace{1,i};
    for j = 1:size(data_tmp)
        if data_tmp(j,1).Var1 == "Rx"
            delay{i,count} = table2array(data_tmp(j,4));
            count = count + 1;
        end
    end
end

% average delays values for each run
for i = 1:size(delay,1)
    count = 0;
    sum = 0;
    for j = 1:length(delay)
        if ~isempty (delay{i,j})
            sum = sum + delay{i,j};
            count = count + 1;
        end
    end
    avgDelay(i) = sum/count;
    avgDelayCount(i) = count;
end

% convert delay from ns to ms
AverageLatencyInEachRun = avgDelay/1e6;

end