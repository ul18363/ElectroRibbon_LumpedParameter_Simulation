clear;clc; close all;
%% Geometrical Data
% Input For Comsol model & Parallel Sheet Model
pos=get_initial_configuration();
x=pos(:,1);
y=pos(:,2);
h = 100e-6; d = 0.0127;L = 0.1;

%% COMSOL Model
file_path="C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\";
% filename=[filepath,"Ey_insulator.csv"];
% filename=file_path+'Ey_insulator_V2.csv';
filename=file_path+'Fy_interface_V3.csv';
% [x_comsol,force_comsol,Ey,ey_filt]=get_comsol_insulator_surface_force(d,filename);
[x_comsol,~,force_comsol,ey_filt]=get_comsol_insulator_surface_force(d,filename);
%% Parallel Sheet Model
% Electrical properties
eMed = 2.75; eAir = 1; eIns = 4.62; 
tIns = 130e-6; EMaxMed = 20e6; EMaxAir = 3e6;
dropVolume = 10;%1e-4;%100*1e-6;
V = 10000;
[x_ps,Fy_ps1]=parallel_sheet_model_ES(x,y,dropVolume,V,d,L,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir);
% [~,Fy_ps2]=parallel_sheet_model_ES(x(28:end),y(28:end),dropVolume,V,d,L,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir);
[~,Fy_ps2]=parallel_sheet_model_ES(x,y-tIns,dropVolume,V,d,L,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir);


%% Figures
semilogy(x_comsol,force_comsol)
% semilogy(x_comsol,force_comsol)
hold on
semilogy(x_ps,Fy_ps1)
semilogy(x_ps,Fy_ps2)
grid on
legend({'COMSOL','PS: Insulator Distance','PS: Electrode Distance'})
ylabel('W_{es} /Nm^{-1}');
xlabel('X [m]');
title('Electrostatic force applied')
%% Summary
total_force_ps=trapz(x_ps,Fy_ps1);
total_force_comsol=trapz(x_comsol,force_comsol);

%%
figure()

plot(x_comsol,force_comsol)
hold on
plot(x_ps,Fy_ps1)
plot(x_ps,Fy_ps2)
legend({'COMSOL','PS: Insulator Distance','PS: Electrode Distance'})
ylabel('W_{es} /Nm^{-1}');
xlabel('X [m]');
title('Electrostatic force applied')