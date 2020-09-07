%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\Docker\Documents\Repo\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\filtered_data.csv
%
% Auto-generated by MATLAB on 13-Jul-2020 02:13:12

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["struct1", "inst", "L", "w", "t", "T", "dY", "V", "mass"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "inst", "TrimNonNumeric", true);
opts = setvaropts(opts, "inst", "ThousandsSeparator", ",");

% Import the data
tbl = readtable("C:\Users\Docker\Documents\Repo\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\filtered_data.csv", opts);

%% Convert to output type
struct1 = tbl.struct1;
inst = tbl.inst;
L = tbl.L;
w = tbl.w;
t = tbl.t;
T = tbl.T;
dY = tbl.dY;
V = tbl.V;
mass = tbl.mass;

%% Clear temporary variables
clear opts tbl