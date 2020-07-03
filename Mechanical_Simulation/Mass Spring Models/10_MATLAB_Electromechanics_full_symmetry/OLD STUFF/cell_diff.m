function output_cell=cell_diff(input_cell)
%   output_cell=cell_diff(input_cell)
%   Takes a cell composed of identical cells with [x;y] values
%   And returns a cell with the difference between consecutive matrices
output_cell{length(input_cell)-1}=[];
for i=2:length(input_cell)
    output_cell{i-1}=input_cell{i}-input_cell{i-1};
end
end