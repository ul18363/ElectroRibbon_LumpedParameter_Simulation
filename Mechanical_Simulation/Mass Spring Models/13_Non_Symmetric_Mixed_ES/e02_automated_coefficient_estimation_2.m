clear;clc; close all;

voltage_ins=0;
clear obj
N=21;
% N=61;
% N=130;
L=0.1; sheet_width=0.0127; thickness=100e-6; %thickness=50e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=0e-3;

obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
% obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_damping_factor(0);
dt=3e-9;
T=0;

sht_dms_for_comsol_mech=[(sht_dms(1)-base_l)/2 sht_dms(2) sht_dms(3)];
com_mech=COMSOL_Mechanical(sht_dms_for_comsol_mech,130);
com_mech.M=M;
com_mech.update_model();
com_mech.run_solver_static_conditions();
com_mech.retrieve_real_final_position();
final_p=com_mech.real_p_tp(:,end);

ref_init_y= com_mech.real_p_tp(2,1);
ref_final_y= com_mech.real_p_tp(2,end);
% y_des=final_p(2)*2;
y_des=-(ref_init_y-ref_final_y)*2;
old_deltay=0-y_des;
% load('N61_zip2.mat')
% obj.voltage=15e3;%10e4;
obj.mechanical_model.halt_velocities();
% obj.update_ES_model('COMSOL')
% obj.mechanical_model.set_damping_factor(0.5);
obj.mechanical_model.set_damping_factor(10);
% obj.mechanical_model.set_damping_factor(0);
obj.mechanical_model.set_internal_damping_factor(0);
clc;
% T=0;
% dt=1e-10;%20e-7;
% Load saved open position

base_line_dt=0.5e-7;
if N==21
%     load('data/N21Open.mat')
     load('resting_condition_N21_COMSOL_Validated_M60.mat')

    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    
    base_line_dt=1e-6;
    obj.mechanical_model.set_damping_factor(10);
    %     obj.mechanical_model.set_shear_elastic_coefficient(2.4e4); %N21
    
    obj.mechanical_model.set_shear_elastic_coefficient( 0.6030856e4); %N21
elseif N==61
    load('resting_condition_N61_COMSOL_Validated_M60.mat')
    obj.mechanical_model.top_plate.p=obj_old.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj_old.mechanical_model.bottom_plate.p;
    
    base_line_dt=1e-6;
    obj.mechanical_model.set_damping_factor(1);
    %     obj.mechanical_model.set_shear_elastic_coefficient(5.93e5); %N61
    obj.mechanical_model.set_shear_elastic_coefficient(1.46115e5); %N61
    
elseif N==130
%     load('resting_condition_N130_COMSOL_Validated_M60.mat','obj2')
    load('resting_position_N130_2020_09_01_00_48_43.mat','obj2')
    
    obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
    obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
    base_line_dt=0.5e-7;
    obj.mechanical_model.set_damping_factor(0.1);
    obj.mechanical_model.set_shear_elastic_coefficient(1.410288e6); %N130
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

try
    while T<5
        
        ov_force=ov_force*alpha+obj.overall_force('Disregard_drag')*(1-alpha);
        avg_dt=avg_dt*alpha+dt*(1-alpha);
        y_cur=obj.mechanical_model.bottom_plate.p(2,end);
        deltay=y_cur-y_des;
        if deltay~=0
            closing_v=obj.mechanical_model.bottom_plate.v(2,end)/deltay;
        else
            closing_v=-1;
        end
        if T>=dispT3
            dispT3=T+refresh_t3;
            
            disp([num2str(T),':',num2str(avg_dt,'%1.2e\n'),'|',num2str(deltay,'%1.2e\n'),'|',num2str(closing_v,'%1.2e\n'),'|',num2str(ov_force,'%1.2e\n')])
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
        
        if T>=dispT
            dispT=T+refresh_t;
            %             full_kinematics
            basic_geometry
            drawnow()
            
        end
        if abs(ov_force)< 1e-7
        obj.mechanical_model.halt_velocities()
        end
        if abs(ov_force)< 1e-8 && abs(deltay)<1e-6%%
            
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
catch
    disp("Simulation Failed Saving results as they are")
end
%%
%  obj.mechanical_model.halt_velocities()
% %  obj.mechanical_model.set_shear_elastic_coefficient(1.46115e5); %N61 -M60
%  obj.mechanical_model.set_shear_elastic_coefficient( 1.170e4); %N21-M60
%
% %  obj.mechanical_model.set_shear_elastic_coefficient( 0.6109e4); %N21-M60
%  obj.mechanical_model.set_shear_elastic_coefficient( 0.6030856e4); %N21-M60
obj.mechanical_model.halt_velocities()
% obj.mechanical_model.set_shear_elastic_coefficient(1410288);%N130-M60
% obj.mechanical_model.set_shear_elastic_coefficient(1.408022e6);%N130-M60
 obj.mechanical_model.calculate_all_forces()
 obj.overall_force('Disregard_drag')
%%

format='%03.f';
calibration_file=['resting_condition_N',num2str(N,format),'_COMSOL_Validated_M',num2str(M,format),'.mat'];
 obj2=obj;
 save(calibration_file,'obj2')
%  if N==21
%      obj2=obj;
%      save(['resting_condition_N21_COMSOL_Validated_M60.mat'],'obj2')
%  elseif N==61
%      obj2=obj;
%      save('resting_condition_N61_COMSOL_Validated_M60.mat','obj2')
%  elseif N==130
%      obj2=obj;
%      save('resting_condition_N130_COMSOL_Validated_M60.mat','obj2')
%  end