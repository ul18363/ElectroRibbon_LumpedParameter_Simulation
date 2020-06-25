
clear; clc; close all;
%profile on
N=11;
obj= Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
obj.retrieve_real_final_position()
disp('M=0')
disp(obj.real_p_tp(:,end))
%%
 obj.M=0.001; 
% % 0.1 -> Highly deformed
 obj.update_model()
 obj.retrieve_real_final_position()
% disp(['M=',num2str(obj.M)])
% disp(obj.real_p_tp(:,end))
% obj.show_comsol_plot()
%obj.obtain_static_coefficients()
%axial_size=5;
%trans_size=7;

%obj.obtain_static_polynomial_coefficients(axial_size,trans_size)
analyze_coefficient