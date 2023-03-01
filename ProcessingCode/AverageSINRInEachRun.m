%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Function to compute the average SINR value for each simulation run
%
% Input Parameters: RxPacketTrace - contains the table of contents for each simulation run from the file
% RxPacketTrace.txt
%
% Output Parameters: AverageSINRInEachRun - for each simulation run the average SINR value
%
% *****************************************************************************************************************
function [AverageSINRInEachRun] = AverageSINRInEachRun(RxPacketTrace)

% fetch all the SINR values in each run over the 9 sec period (9 sec is the simulation time)
for i = 1:length(RxPacketTrace)
    sinrInEachRun_tmp{i} = RxPacketTrace{1,i}.SINR_dB_;
end

% average all SINR values in each run over 9 sec duration
for i = 1:length(sinrInEachRun_tmp)
    avgSinrInEachRun_tmp{i} = sum(sinrInEachRun_tmp{1,i}(:,1))/length(sinrInEachRun_tmp{1,i});
end

% save the average SINR value of each run
AverageSINRInEachRun = cell2mat(avgSinrInEachRun_tmp);

end