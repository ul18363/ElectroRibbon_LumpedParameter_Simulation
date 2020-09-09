clear;clc; close all;
%Initialize model
%voltage_values=[5,6,8,10,12]*1000;
% voltage_values=[12,10,8,6,5]*1000;
% voltage_values=[12,10,8,6,5]*1000;
% voltage_values=[6,5,4,3,2.5,2]*1000;
% voltage_values=[5,4,3,2.5,2]*1000;
% voltage_values=[6,1.5,1]*1000;
% voltage_values=[10,12]*1000;
% voltage_values=[6]*1000;
%
% for voltage_ins=voltage_values
%     clear obj obj2
voltage_ins=6000;
    N=21;
% N=61;
%     N=130;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=8e-3;
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
obj.mechanical_model.set_damping_factor(0);

T=0;


obj.mechanical_model.set_internal_damping_factor(0);

clc;

if N==21
    damp_factor=10;%10-0.01 s
    base_line_dt=5e-7; % N21
    load(['e04_starting_conditions/','e04_caliobration_N21_m8.mat'])
    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_damping_factor(damp_factor);
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N21
elseif N==61
    base_line_dt=5e-7;; % N61
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
    base_line_dt=1e-7; % N130
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
%%%%% Mechanical Simulation
% obj.voltage=0e3;
% obj.update_ES_model('SKIP')

% Perform single timestep
%
dt=1e-10;

max_dt=base_line_dt;
% refresh_t=1e-5;

%Plot refresh
refresh_t=1e-2; %Plot refresh
dispT=T+refresh_t;




% Print in Screen
refresh_t2=1e-3; % Print in Screen
dispT2=T+refresh_t2;


% Data Recording
refresh_t3=1e-4; % Data Recording
dispT3=T+refresh_t3;

% Electrostatic Force Refresh
refresh_t_comsol=1e-2; % COMSOL Electrostatic Model Refresh (Need to run again with lower time, let's say 1e-3? May take forever though)
dispTCOMSOL=T+refresh_t_comsol;
% refresh_t_comsol=-1; % Disable COMSOL Electrostatic Model Refresh

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;


%
success_flag=false;
while~success_flag
    success_flag=obj.perform_timestep(dt,source_es);
    if success_flag && max_dt>dt
        dt=dt*drunk_scale;
    else
        dt=dt/drunk_scale;
    end
    %         disp(dt)
    if loop_condition_breaking(dt)
        break
    end
    
end
%% Go crazy with simulation
frame=0;

last_contact=obj.mechanical_model.contact_ix;
res=[];
res_ix=0;
tic
while T<5
    dt_avg=dt_avg*alpha+dt*(1-alpha);

    if T>=dispT2
        dispT2=T+refresh_t2;
        real_t=toc;
        res_ix=res_ix+1;
        res(:,res_ix)=[dt_avg,real_t]';
        disp(res_ix)
%         disp([num2str(dt_avg),'|',num2str(real_t)])
        tic
    end
    
    success_flag=false;
    while~success_flag
        success_flag=obj.perform_timestep(dt,source_es);
        if success_flag && max_dt>dt
            dt=dt*drunk_scale;
        else
            dt=dt/drunk_scale;
        end
        %         disp(dt)
        if loop_condition_breaking(dt)
            break
        end
        
    end
    
    T=T+dt;
    
    if (refresh_t_comsol>0) &&( T>=dispTCOMSOL)
        dispTCOMSOL=T+refresh_t_comsol;
        try
            obj.update_ES_model(source_es);
%             disp([source_es,': update succesfull.'])
        catch ME
%             disp('Try to Update ',source_es,' model but failed')
            
            
        end
    end
%     if T>=dispT
%         dispT=T+refresh_t;
%         full_kinematics
%     end
    
%     if last_contact<obj.mechanical_model.contact_ix
%         last_contact=obj.mechanical_model.contact_ix;
%         full_kinematics
%         drawnow
%         dispT3=0;
%     end
%     
    
    
    if obj.mechanical_model.contact_ix==obj.N-4
        disp('Zipping is complete')
        break
    end
    
end

