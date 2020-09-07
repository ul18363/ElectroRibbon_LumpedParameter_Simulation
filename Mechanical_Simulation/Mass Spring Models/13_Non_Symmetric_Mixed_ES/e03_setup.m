clear;clc; close all;

voltage_ins=0;
clear obj
M=20e-3;
% N=21;
N=61;
% N=130;
L=0.1; sheet_width=0.0127; thickness=100e-6; %thickness=50e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];

obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);

T=0;

sht_dms_for_comsol_mech=[(sht_dms(1)-base_l)/2 sht_dms(2) sht_dms(3)];
obj.mechanical_model.set_internal_damping_factor(0);

% Load saved open position
base_line_dt=0.5e-7;
if N==21
    load('e02_calibration/resting_condition_N021_COMSOL_Validated_M008.mat')
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N130
    
    base_line_dt=1e-6;
    obj.mechanical_model.set_damping_factor(10);
elseif N==61
    load('e02_calibration/resting_condition_N061_COMSOL_Validated_M008.mat')
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N130
    
    base_line_dt=1e-6;
    obj.mechanical_model.set_damping_factor(1);
elseif N==130
    load('e02_calibration/resting_condition_N021_COMSOL_Validated_M008.mat')
    shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
    obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N130
    
    base_line_dt=0.5e-7;
    obj.mechanical_model.set_damping_factor(0.1);
end


%%%%% Electrostatic Simulation
% obj.voltage=3e3;
obj.voltage=voltage_ins;
%     obj.update_ES_model('COMSOL')
%%%%% Mechanical Simulation
% obj.voltage=0e3;
obj.update_ES_model('SKIP')

% Perform single timestep
%
dt=1e-10;

max_dt=base_line_dt;

% Plot Refresh rate
refresh_t=1e-3;
dispT=T+refresh_t;

success_flag=false;

% Print in Screen
refresh_t2=1e-3; % Print in Screen
dispT2=T+refresh_t2;

% Data Recording
refresh_t3=1e-4; % Data Recording
dispT3=T+refresh_t3;

refresh_t_comsol=1e-2; % COMSOL Electrostatic Model Refresh
dispTCOMSOL=T+refresh_t_comsol;
refresh_t_comsol=-1; % Disable COMSOL Electrostatic Model Refresh

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;


% Size timestep adequately
while~success_flag
    %         success_flag=obj.perform_timestep(dt,'COMSOL');
    success_flag=obj.perform_timestep(dt,'SKIP');
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
simulation_identifier=['N',num2str(N),'_',datestr(now,'yyyy_mm_dd_HH_MM_SS')];
video_dir=['videos_',simulation_identifier];
results_file=['resting_position_',simulation_identifier,'.mat'];

buff_len=5000;
y_pos_cells={};
t_cells={};
electr_cells={};
btm_obj_cells={};
top_obj_cells={};
y_pos_buff=zeros([buff_len,1]);
t_rec_buff=y_pos_buff;

electr_buff=cell(1,5000);
btm_obj_buff=cell(1,5000);
top_obj_buff=cell(1,5000);

count=0;
ov_force=obj.overall_force('Disregard_drag');
zip_ix=obj.mechanical_model.contact_ix+1;
initial_d=obj.mechanical_model.top_plate.p(2,zip_ix)-obj.mechanical_model.bottom_plate.p(2,zip_ix);
d=initial_d;



filt_v_top=obj.mechanical_model.top_plate.v(2,:);
filt_v_btm=obj.mechanical_model.bottom_plate.v(2,:);
filt_a_top=obj.mechanical_model.top_plate.a(2,:);
filt_a_btm=obj.mechanical_model.bottom_plate.a(2,:);

avg_dt=dt;
% obj.perform_timestep(dt)

%%
obj.mechanical_model.halt_velocities();

strikes=10000;

reach_ix=1;
mm_to_sample=[1,2,4];

try
    while T<5
        
        ov_force=ov_force*alpha+obj.overall_force('Disregard_drag')*(1-alpha);
        avg_dt=avg_dt*alpha+dt*(1-alpha);
        y_cur=obj.mechanical_model.bottom_plate.p(2,end);
        
%         deltay=y_cur-y_des;
%         if deltay~=0
%             closing_v=obj.mechanical_model.bottom_plate.v(2,end)/deltay;
%         else
%             closing_v=-1;
%         end
        if T>=dispT3
            dispT3=T+refresh_t3;
            
            disp([num2str(T),':',num2str(avg_dt,'%1.2e\n'),'|',num2str(ov_force,'%1.2e\n')])
        end
        
        
        success_flag=false;
        while~success_flag
            success_flag=obj.perform_timestep(dt,'SKIP');
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
        
        if y_cur<=-mm_to_sample(reach_ix)/1000
            obj2=obj;
            mm=mm_to_sample(reach_ix);
            
            format='%03.f';
            calibration_file=['e03_start_configu_N',num2str(N,format),'_',num2str(mm,format),'.mat'];

            save(calibration_file,'obj2','mm')
            reach_ix=reach_ix+1;
            if reach_ix==length(mm_to_sample)+1
               disp('All samples are collected!') 
                break
            end
        end
        
        
        if T>=dispT
            dispT=T+refresh_t;
            %             full_kinematics
            %             basic_geometry
            hold off
            basic_geometry4
            drawnow()
            
        end
        if abs(ov_force)< 1e-7
            obj.mechanical_model.halt_velocities()
        end
        if abs(ov_force)< 1e-8%% && abs(deltay)<1e-6%%
            
            strikes=strikes-1;
            if strikes==0
                disp('Resting condition is met simulation is complete')
                break
            end
        else
            strikes=1000;
        end
        
    end
    %%
    %
catch me
   
    disp("Simulation Failed Saving results as they are")
end

