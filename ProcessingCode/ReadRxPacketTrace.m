%
% Author: Hitesh Poddar <hiteshp@nyu.edu> Date: 02/28/2023
% This code is free to and modify, users are encouraged to cite the work: https://arxiv.org/abs/2302.12385
% ****************************************************************************************************************
% Description: Function to read the RxPacketTrace.txt file contents.
%
% Input Parameters: mainFolder - Path to the folder where all simulation runs are stored
%
% Output Parameters: LosRxPacketTrace, NlosRxPacketTrace - cell containing the contents of each simulation 
% run for LOS and NLOS respectively for a specific scenario and channel model
%
% *****************************************************************************************************************
function [LosRxPacketTrace,NlosRxPacketTrace] = ReadRxPacketTrace(mainFolder)
    % Reads both folders LOS/NLOS for a particular channel model and scenario 
    for i = 1:length(mainFolder)
        fileList   = dir(fullfile(mainFolder(i), '**', 'RxPacketTrace.txt'));
        Result{i}    = cell(1, numel(fileList));
        % Reads all RxPacketTrace.txt contents from each simulation run
        for iFile = 1:numel(fileList)
            File = fullfile(fileList(iFile).folder, fileList(iFile).name);
            Result{i}{iFile} = readtable(File);
        end
        if i == 1
            LosRxPacketTrace = Result{i};
        else
            NlosRxPacketTrace = Result{i};
        end
    end
end