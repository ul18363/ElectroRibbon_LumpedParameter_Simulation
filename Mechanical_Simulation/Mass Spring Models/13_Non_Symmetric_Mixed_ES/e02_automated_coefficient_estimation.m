clear;clc; close all;
%Initialize model
% voltage_values=[3,5,6,8,10,12]*1000;
% voltage_values=[10,12]*1000;
% voltage_values=[6]*1000;
% for voltage_ins=voltage_values
voltage_ins=0;
clear obj
% N=21;
N=130;
% N=130;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=60e-3;
% material='steel';
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
% obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_damping_factor(0);
% obj.mechanical_model.set_shear_elastic_coefficient(2.4e4); %N21
%     obj.mechanical_model.set_shear_elastic_coefficient(5.93e5); %N61
%  obj.mechanical_model.set_shear_elastic_coefficient(1.462e5); %N61

obj.mechanical_model.set_shear_elastic_coefficient(5.7e6); %N130
dt=3e-9;
T=0;

%%%%
%%
sht_dms_for_comsol_mech=[(sht_dms(1)-base_l)/2 sht_dms(2) sht_dms(3)];
com_mech=COMSOL_Mechanical(sht_dms_for_comsol_mech,130);
com_mech.M=M;
com_mech.update_model();
 com_mech.run_solver_static_conditions();
com_mech.retrieve_real_final_position();
final_p=com_mech.real_p_tp(:,end);
y_des=final_p(2)*2;
old_deltay=0-y_des;
%%
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


% load('data/N21Open.mat')
% obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
% obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;

%     load('data/N61open.mat')
%     obj.mechanical_model.top_plate.p=obj_old.mechanical_model.top_plate.p;
%     obj.mechanical_model.bottom_plate.p=obj_old.mechanical_model.bottom_plate.p;
%
% load('N130_semi_open.mat')
% obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
% obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;

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
% max_dt=1e-8;
%     base_line_dt=1e-6;
base_line_dt=0.5e-7;
% max_dt=1e-5;
max_dt=base_line_dt;
% refresh_t=1e-5;

% refresh_t=1e-4; %Plot refresh
% dispT=T+refresh_t;
% refresh_t=base_line_dt*100; %Plot refresh
% refresh_t=1e-2; %Plot refresh
refresh_t=1e-3;
dispT=T+refresh_t;

success_flag=false;


% Print in Screen
% refresh_t2=1e-4;
% refresh_t2=base_line_dt*100;
refresh_t2=1e-3; % Print in Screen
dispT2=T+refresh_t2;


% Data Recording
refresh_t3=1e-4; % Data Recording
dispT3=T+refresh_t3;

% refresh_t_comsol=1e-3; % COMSOL Electrostatic Model Refresh
refresh_t_comsol=1e-2; % COMSOL Electrostatic Model Refresh
dispTCOMSOL=T+refresh_t_comsol;
refresh_t_comsol=-1; % Disable COMSOL Electrostatic Model Refresh

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;


%
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
% obj.mechanical_model.set_damping_factor(500);
obj.mechanical_model.set_damping_factor(10);
% obj.mechanical_model.set_shear_elastic_coefficient(5.7e5); %N130
% obj.mechanical_model.set_shear_elastic_coefficient(5.7e4); %N130.
obj.mechanical_model.set_shear_elastic_coefficient(5.7e6); %N130
max_dt=5e-7;
strikes=10000;

% obj.mechanical_model.set_shear_elastic_coefficient(5.7e4); %N130
% obj.mechanical_model.calculate_all_forces()
% obj.overall_force('Disregard_drag')

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
            disp([num2str(T),':',num2str(avg_dt),'|',num2str(deltay),'|',num2str(closing_v),'|',num2str(ov_force)])
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
            full_kinematics
            drawnow()
        end
        
%         if ov_force>0
%             obj.mechanical_model.halt_velocities();
%         end
        if abs(ov_force)<1e-6
            strikes=strikes-1;
            if strikes==0
            disp('Restin condition is met simulation is complete')
            break
            end
        else
            strikes=1000;
        end
        
        if sign(old_deltay)~=sign(deltay)&&false
            
            %We passed the equlibrium point!
            if sign(deltay)==0
                continue
            end
            
            disp("Updating coefficient")
            obj.mechanical_model.halt_velocities()
            
            curr_halted_force=obj.overall_force('Disregard_drag');
            
            if sign(deltay)==sign(curr_halted_force)
                % We keep going 
                if sign(deltay)>0
                    %Loosen up
                   adaptive_step=0.99999; 
                else
                    %Thighten up
                   adaptive_step=1.00001;
                end
                
            else
               continue %Dropping draw force reversed track
            end
            
            reverse_track_flag=false;
            old_shear_constatnt=obj.mechanical_model.bottom_plate.k_trans;
            new_shear_constant=old_shear_constatnt;
            %
            while ~reverse_track_flag
                new_shear_constant=new_shear_constant*adaptive_step;
                obj.mechanical_model.halt_velocities()
                obj.mechanical_model.set_shear_elastic_coefficient(new_shear_constant);
                obj.mechanical_model.calculate_all_forces()
                curr_halted_force=obj.overall_force('Disregard_drag');
                disp(curr_halted_force)
                if sign(curr_halted_force)==sign(adaptive_step-1)
                    reverse_track_flag=true;
                end
                
            end
              
            
            
        else 
            old_deltay=deltay;
        end
            
        
        
        
        
    end
    %%
    %
catch
    disp("Simulation Failed Saving results as they are")
end
%     y_pos_cells{end+1}=y_pos_buff;
%     t_cells{end+1}=t_rec_buff;
%     electr_cells{end+1}=electr_buff;
%     btm_obj_cells{end+1}=btm_obj_buff;
%     top_obj_cells{end+1}=top_obj_buff;
%
%     rem_cells=find(t_cells{end}~=0);
%
%     t_cells{end}=t_cells{end}(rem_cells);
%     y_pos_cells{end}=y_pos_cells{end}(rem_cells);
%%
obj2=obj;
save(results_file,'obj2')
% end

%%
% obj.mechanical_model.bottom_plate.k_trans
disp(obj.mechanical_model.bottom_plate.k_trans)
%%
 obj.mechanical_model.halt_velocities()
 obj.mechanical_model.set_shear_elastic_coefficient(1.410288e6); %N130
 obj.mechanical_model.calculate_all_forces()
 obj.overall_force('Disregard_drag')
 
 %% 5700000

