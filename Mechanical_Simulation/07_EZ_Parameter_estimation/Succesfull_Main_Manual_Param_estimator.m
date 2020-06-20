
clear; clc;
%profile on
N=11;
obj= Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
og_GA=obj.plate.GA;
og_k_axial=obj.plate.k_axial;
obj.retrieve_real_final_position()
%%
close all
%figure
obj.set_damping_factor(3e4);%1e6 pretty close to critical (3e4 nice waves)
obj.plate.reset_state();
scale=1.55e-4;
scale_axial=scale;
scale_trans=scale;
obj.plate.k_axial=og_k_axial*scale_axial;
obj.plate.GA=og_GA*scale_trans;
%obj.set_elastic_coefficients();
dt=4e-6; %Simulation timestep [s]
T=5; %Maximum simulation time [s]
t_refresh=1e-2;
run_simulation
%% Compare results
% obj.show_comsol_plot()
figure
obj.retrieve_real_final_position()
plot(obj.real_x_tp,obj.real_y_tp)
hold on
plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b-o')