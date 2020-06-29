
clear; clc;
%profile on
N=21;
obj= Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
obj.M=0.06;% M=0 deformation in scale of 10^-5m -> 0.03mm
% M=0 deformation in scale of 10^-5m -> 0.03mm
% M=0.06 deformation in scale of 10^-2m -> 17mm
obj.update_model();
og_GA=obj.plate.GA;
og_k_axial=obj.plate.k_axial;
obj.retrieve_real_final_position()
old_p=obj.plate.p;
%%
close all
figure
%obj.set_damping_factor(9e2);%1e6 pretty close to critical (3e4 nice waves)
obj.set_damping_factor(1e2);%1e6 pretty close to critical (3e4 nice waves)
obj.plate.reset_state();
obj.plate.p=old_p;
%scale=1.55e-4;ratio=1;% Succesful for N=11;M=0
%scale=1.55e-4;ratio=1;% Succesful for N=11;M=0.01
%scale=1.55e-4;ratio=1;% Succesful for N=11;M=0.01

scale=5.45e-4;ratio=1;% Succesful for N=21;M=0
%scale=3.13e-3;ratio=1;% Succesful for N=51;M=0
%scale=scale*sqrt(N/11);
%scale=2.97e-3; ratio=0.95;% Succesful for N=51;M=0

%scale=1.55e-4;ratio=1;% Succesful for N=;M=

scale_axial=1;%scale*ratio;
scale_trans=5.7e-4;%scale/ratio;
obj.plate.k_axial=og_k_axial*scale_axial;
obj.plate.GA=og_GA*scale_trans;
%obj.set_elastic_coefficients();
%dt=4e-6; %Simulation timestep [s]
%dt=1e-6; %Simulation timestep [s]
%dt=1e-4;
dt=1e-5;
T=5; %Maximum simulation time [s]
t_refresh=1e-2;
run_simulation
%failure_analysis
%% Compare results
old_p=obj.plate.p;
% % obj.show_comsol_plot()
% figure
% obj.retrieve_real_final_position()
% plot(obj.real_x_tp,obj.real_y_tp)
% hold on
% plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b-o')