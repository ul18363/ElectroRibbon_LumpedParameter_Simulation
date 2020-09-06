clear;clc;
initial_points=get_initial_configuration();
thickness=100e-6;
insulator_thickness=130e-6;
sheet_width=0.0127;
clip_l=0.01;base_l=0.01;voltage=0;
obj=ES_Estimator(thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage);
if isempty(obj.comsol_model)
   disp("COMSOL Model is not initialized yet") 
end

if isempty(obj.numerical_model)
   disp("Analytical Model is not initialized yet") 
end

%% Create COMSOL Mechanical Model
clear;clc;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;
sht_dms=[(L-base_l)/2 sheet_width thickness];
N=11;
obj=COMSOL_Mechanical(sht_dms,N);

%% Create Mass Spring Mechanical Model

clear;clc;
N=11;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;
sht_dms=[(L-base_l)/2 sheet_width thickness];
material='steel';
obj=Mechanical_Model(sht_dms,N,material);
obj.M=20e-2;
obj.plate.damp_factor=200;
obj.plate.k_trans=3410;
obj.plate.k_axial=5.6444e+05;
% obj.plate.define_force_bc('l_fix');% Left edge is fix
% obj.plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation

T=0;
dt=5e-7;
refresh_t=1e-3;
dispT=0;
% obj.perform_timestep(dt)
while T<5
    disp(T)
  	obj.calculate_all_forces()
    obj.perform_timestep(dt)
    T=T+dt;
    if T>=dispT
        dispT=T+refresh_t;
        plot(obj.plate.p(1,:),obj.plate.p(2,:),'r-x')
        drawnow
    end
end