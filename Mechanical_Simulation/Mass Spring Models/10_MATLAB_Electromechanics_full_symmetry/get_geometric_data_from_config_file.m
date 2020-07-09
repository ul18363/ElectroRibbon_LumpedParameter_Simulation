function [p,bezier_points]=get_geometric_data_from_config_file(file_name)
%clear;clc;
%file_name='config_N11_2020_07_06_10_19_51.mat';
obj=load(file_name).obj;
%%
p=obj.plate.p;
%x=p(1,:);
%y=p(2,:);
%%
bezier_points=BezierEstimator.obtain_qubic_bezier_points(p');
p=p';
end