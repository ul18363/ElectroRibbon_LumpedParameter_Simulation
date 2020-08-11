clear;clc;
initial_points=get_initial_configuration();
thickness=100e-6;
insulator_thickness=130e-6;
sheet_width=0.0127;
clip_l=0.01;
base_l=0.01;
voltage=6000;
curve_points= [initial_points(1,:)+[-clip_l 0];...
                initial_points;...
                initial_points(end,:)+[base_l/2 0]];
obj=ES_Estimator(initial_points,thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage);
%%
n=20;
t=linspace(0,obj.comsol_model.arc_len(end),n);
t=[0 0 0 0 t];
x_test=interp1(obj.comsol_model.arc_len,obj.comsol_model.xs,t,'linear','extrap');
y_test=interp1(obj.comsol_model.arc_len,obj.comsol_model.ys,t,'linear','extrap');
fictitious_points=[x_test;y_test]';
[Fy,Fx,arc_len_sim]=obj.assign_distribute_forces_to_particles(fictitious_points,'COMSOL');
plot(Fy,'*-')
%%
% obj=COMSOL_ES_Model(curve_points,thickness,insulator_thickness,sheet_width,voltage);
%

% obj.calculate_es_force(initial_points)
%%
% clear; clc;
% eMed = 2.75; eAir = 1; eIns = 4.62; voltage=6000;
% tIns = 130e-6; EMaxMed = 20e6; EMaxAir = 3e6; dropVolume = 10;
% initial_points=get_initial_configuration(); 
% sheet_width=0.0127;
% obj=Parallel_Plates_ES_Model(initial_points,voltage,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume,sheet_width)
%%
% obj.calculate_es_force()
%% 
% obj=ES_Estimator(curve_points,thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage)

%%
figure()
plot(obj.comsol_model.arc_len,obj.comsol_model.cumFy)
grid on
hold on
plot(obj.numerical_model.arc_len,obj.numerical_model.cumFy)
title('Cumulative Vertial Electrostatic Force N over left half of the bottom sheet at 6KV')
xlabel('Arc Length [m]')
ylabel('Cumulative Force [N]')
%%
figure()
plot(obj.comsol_model.arc_len,obj.comsol_model.Fy_dist)
grid on
hold on
plot(obj.numerical_model.arc_len,obj.numerical_model.Fy_dist)
title('Distributed Vertial Electrostatic Force over left half of the bottom sheet at 6KV')
xlabel('Arc Length [m]')
ylabel('Distributed Force [N/m]')
