
clear; clc; close all;
%profile on
N=51;
obj= Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
obj.retrieve_real_final_position()
disp('M=0')
disp(obj.real_p_tp(:,end))
%%
obj.M=0.0; 
% 0.1 -> Highly deformed
obj.update_model()
obj.retrieve_real_final_position()
disp(['M=',num2str(obj.M)])
disp(obj.real_p_tp(:,end))
figure
obj.show_comsol_plot()
obj.obtain_static_coefficients()
%%
figure()
subplot(2,1,1)
plot(obj.real_static_axial_coeffs)
title('Direct Elastic Coefficient')
grid on
xlabel('Edge number')
ylabel('Elastic Coefficient')
hold on
subplot(2,1,2)
plot(obj.real_static_trans_coeffs)
title('Shear Elastic Coefficient')
hold on
grid on
xlabel('Edge number')
ylabel('Elastic Coefficient')