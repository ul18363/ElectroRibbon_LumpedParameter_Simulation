%%
close all;
axial_size=11;
trans_size=11;

obj.obtain_static_polynomial_coefficients(axial_size,trans_size)

var_axial=obj.plate.dp_def;
%var_trans=abs(obj.plate.angles);
var_trans=obj.plate.angles;
%var_trans=abs(obj.plate.dp_mag);
axial_coeffs=obj.approx_static_axial_coeffs;
trans_coeffs=obj.approx_static_trans_coeffs;
points=100;
range_axial=linspace(min(var_axial),max(var_axial),points);
range_trans=linspace(min(var_trans),max(var_trans),points);
figure
subplot(3,2,1)
plot(range_axial,polyval(flip(axial_coeffs),range_axial))
xlabel('Deformation [m]')
ylabel('Axial coefficient')
title('Axial coefficient')
grid on
subplot(3,2,2)
plot(range_trans,polyval(flip(trans_coeffs),range_trans))
xlabel('Curvature [deg/m]')
ylabel('Shear elastic coefficient')
title('Shear coefficient')
grid on

%%
% figure
est_forces=obj.matrix_sys_A*obj.approx_coeffs;
real_fx=obj.independent_forces_b(1:2:end-1);
real_fy=obj.independent_forces_b(2:2:end);
est_fx=est_forces(1:2:end-1);
est_fy=est_forces(2:2:end);
% 
% bar(obj.independent_forces_b,0.5,'c')
% hold on
% plot(obj.matrix_sys_A*obj.approx_coeffs,'rx')
% title("External Forces calculation")
% xlabel("Target elastic Force over particle (blue). Estimated Force over particle(red crosses)")
%%
% figure 
subplot(3,2,3)
bar(real_fx,1,'c')
hold on
plot(est_fx)
title("Fx")
grid on
subplot(3,2,4)
bar(real_fy,1,'c')
hold on
plot(est_fy)
title("Fy")
grid on

%%
subplot(3,2,5)
plot(var_axial)
grid on
title("Axial Deformation")
subplot(3,2,6)
plot(var_trans)
title("Curvature Magnitude")
grid on