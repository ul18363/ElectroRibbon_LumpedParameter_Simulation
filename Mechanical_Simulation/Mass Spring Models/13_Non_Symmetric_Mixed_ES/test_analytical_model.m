clear obj
%     N=21;
N=61;
%     N=130;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=8e-3;
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
obj.mechanical_model.set_damping_factor(0);
voltage_ins=6*1000;
T=0;


obj.mechanical_model.set_internal_damping_factor(0);

clc;

if N==21
    damp_factor=10;%10-0.01 s
    base_line_dt=1e-6; % N21
    load(['e04_starting_conditions/','e04_caliobration_N21_m8.mat'])
    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_damping_factor(damp_factor);
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N21
elseif N==61
    base_line_dt=1e-6; % N61
    damp_factor=100;
    load(['e04_starting_conditions/','e04_caliobration_N61_m8.mat'])
    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    %         obj.mechanical_model.set_damping_factor(1);
    obj.mechanical_model.set_damping_factor(damp_factor);
    obj.mechanical_model.halt_velocities();
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N61
elseif N==130
    damp_factor=0.1;%0.1-0.01s
    base_line_dt=5e-7; % N130
    load(['e04_starting_conditions/','e04_caliobration_N130_m8.mat'])
    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_damping_factor(damp_factor);
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N130
end
%%%%% Electrostatic Simulation
% obj.voltage=3e3;
obj.voltage=voltage_ins;
source_es='Analytical';
obj.update_ES_model(source_es)