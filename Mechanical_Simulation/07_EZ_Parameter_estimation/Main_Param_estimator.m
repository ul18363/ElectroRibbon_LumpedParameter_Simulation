
clear; clc;
%profile on
N=51;
obj= Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
obj.retrieve_real_final_position()
disp('M=0')
disp(obj.real_p_tp(:,end))
%%
obj.M=0.4; 
% 0.1 -> Highly deformed
obj.update_model()
obj.retrieve_real_final_position()
disp(['M=',num2str(obj.M)])
disp(obj.real_p_tp(:,end))
obj.show_comsol_plot()
obj.obtain_static_coefficients()
%%

A=obj.matrix_sys_A;
b=obj.independent_forces_b;
coeffs=obj.real_static_coeffs;
k_axial=obj.real_static_axial_coeffs;
k_trans=obj.real_static_trans_coeffs;

eqn=obj.eqns(1);
pretty(eqn);
%% 
obj.set_elastic_coefficients();
%run_simulation
%% Analyze last element in chain
hold on
plot(obj.plate.p(1,:),obj.plate.p(2,:),'x') % See if plot works fine
%Check DP
if all(obj.plate.p(:,end)-obj.plate.p(:,end-1)==obj.plate.dp(:,end))
    disp('differential segments dp are fine') 
end
%% Local deformations
obj.plate.local_def_x_rtl(end)
obj.plate.local_def_x_ltr(end)
obj.plate.local_frame_x_ltr(:,end)
obj.plate.local_frame_x_rtl(:,end)