function [mag_output,phase_output]=mag_and_phase_mats_from_cell(input_cell)
%   [mag_output,phase_output]=mag_and_phase_mats_from_cell(input_cell)
%   Takes a cell composed of identical cells with [x;y] values
%   And returns 2 matrices with the magnitude and phase of them
%   Each row corresponds to a corresponding matrix of the input cell
mag_output{length(input_cell)}=[];
phase_output{length(input_cell)}=[];

for i=1:length(input_cell)
mag_output{i}=sqrt(sum(input_cell{i}.^2));
phase_output{i}=atan2d(input_cell{i}(2,:),input_cell{i}(1,:));% Assume Y is in 2nd row, and X is in first row
end

mag_output=reshape(cell2mat(mag_output),[size(input_cell{1},2),length(input_cell)])';
phase_output=reshape(cell2mat(phase_output),[size(input_cell{1},2),length(input_cell)])';
end