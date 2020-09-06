clear;clc; close all;

voltage_ins=0;
clear obj
% N=21;
N=130;


% N=130;
% M=60e-3;
M_list=[0,4,8,10,20,40,60,80,100,150,200]/1000;
max_strikes=100;
for M=M_list
    
    L=0.1; sheet_width=0.0127; thickness=100e-6; %thickness=50e-6;
    base_l=0.01;clip_l=0.01;
    ins_thickness=130e-6;
    sht_dms=[L sheet_width thickness];
    
    obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
    % obj.mechanical_model.set_damping_factor(1);
    obj.mechanical_model.set_damping_factor(0);
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
    
    %%
    ref_init_y= com_mech.real_p_tp(2,1);
    ref_final_y= com_mech.real_p_tp(2,end);
    % y_des=final_p(2)*2;
    y_des=-(ref_init_y-ref_final_y)*2;
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
    
    base_line_dt=0.5e-7;
    if N==21
        load('resting_condition_N21_COMSOL_Validated_M60.mat')
%         obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p*0;
%         obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
        
        base_line_dt=1e-6;
        obj.mechanical_model.set_damping_factor(100);
%         obj.mechanical_model.set_shear_elastic_coefficient(2.4e4); %N21
        obj.mechanical_model.set_shear_elastic_coefficient(obj2.mechanical_model.bottom_plate.k_trans); %N130
        
    elseif N==61
        load('resting_condition_N61_COMSOL_Validated_M60.mat')
%         obj.mechanical_model.top_plate.p=obj_old.mechanical_model.top_plate.p;
%         obj.mechanical_model.bottom_plate.p=obj_old.mechanical_model.bottom_plate.p;
        
        base_line_dt=1e-6;
        obj.mechanical_model.set_damping_factor(1);
        %     obj.mechanical_model.set_shear_elastic_coefficient(5.93e5); %N61
%         obj.mechanical_model.set_shear_elastic_coefficient(1.46115e5); %N61
        obj.mechanical_model.set_shear_elastic_coefficient(obj2.mechanical_model.bottom_plate.k_trans); %N130
        
    elseif N==130
        load('resting_condition_N130_COMSOL_Validated_M60.mat')
%         obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
%         obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
        base_line_dt=0.5e-7;
        obj.mechanical_model.set_damping_factor(0.1);
%         obj.mechanical_model.set_shear_elastic_coefficient(1.408022e6); %N130
        obj.mechanical_model.set_shear_elastic_coefficient(obj2.mechanical_model.bottom_plate.k_trans); %N130
        
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
    results_file=['e02_results_','M',num2str(M*1000),'_',simulation_identifier,'.mat'];
    
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

%     max_dt=5e-7;
    strikes=max_strikes;
    
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
                count=count+1;
                dispT3=T+refresh_t3;
                disp([num2str(T),':',num2str(avg_dt,'%1.2e\n'),'|',num2str(deltay,'%1.2e\n'),'|',num2str(closing_v,'%1.2e\n'),'|',num2str(ov_force,'%1.2e\n')])
            
                %         disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
                
                %
                top_obj_tracker.p=obj.mechanical_model.top_plate.p;
                top_obj_tracker.v=obj.mechanical_model.top_plate.v;
                top_obj_tracker.a=obj.mechanical_model.top_plate.a;
                top_obj_tracker.f=obj.mechanical_model.top_plate.f;
                top_obj_tracker.f_elast=obj.mechanical_model.top_plate.f_elastic;
%                 top_obj_tracker.f_electr=obj.mechanical_model.top_plate_ext_f;
                top_obj_tracker.f_damp=obj.mechanical_model.top_plate.f_damping;
                
                btm_obj_tracker.p=obj.mechanical_model.bottom_plate.p;
                btm_obj_tracker.v=obj.mechanical_model.bottom_plate.v;
                btm_obj_tracker.a=obj.mechanical_model.bottom_plate.a;
                btm_obj_tracker.f=obj.mechanical_model.bottom_plate.f;
                btm_obj_tracker.f_elast=obj.mechanical_model.bottom_plate.f_elastic;
%                 btm_obj_tracker.f_electr=obj.mechanical_model.bottom_plate_ext_f;
                btm_obj_tracker.f_damp=obj.mechanical_model.bottom_plate.f_damping;
                
                
%                 electr_obj_tracker.f_top=obj.electrostatic_model.comsol_EZ_model.Fy_dist_top;
%                 electr_obj_tracker.x_top=obj.electrostatic_model.comsol_EZ_model.xs_top;
%                 electr_obj_tracker.arclen_top=obj.electrostatic_model.comsol_EZ_model.arc_len_top;
%                 electr_obj_tracker.h_top=obj.electrostatic_model.comsol_EZ_model.hs_top;
%                 electr_obj_tracker.x_btm=obj.electrostatic_model.comsol_EZ_model.xs;
%                 electr_obj_tracker.arclen_btm=obj.electrostatic_model.comsol_EZ_model.arc_len;
%                 electr_obj_tracker.h_btm=obj.electrostatic_model.comsol_EZ_model.hs;
%                 electr_obj_tracker.f_btm=obj.electrostatic_model.comsol_EZ_model.Fy_dist;
                
%                 electr_buff{count}=electr_obj_tracker;
                btm_obj_buff{count}=btm_obj_tracker;
                top_obj_buff{count}=top_obj_tracker;
                
                t_rec_buff(count)=T;
                y_pos_buff(count)=obj.mechanical_model.bottom_plate.p(2,end);
                
                if count>buff_len
                    count=0;
                    y_pos_cells{end+1}=y_pos_buff;
                    t_cells{end+1}=t_rec_buff;
%                     electr_cells{end+1}=electr_buff;
                    btm_obj_cells{end+1}=btm_obj_buff;
                    top_obj_cells{end+1}=top_obj_buff;
                    
                    
                    y_pos_buff=zeros([buff_len,1]);
                    t_rec_buff=y_pos_buff;
%                     electr_buff=cell(1,5000);
                    btm_obj_buff=cell(1,5000);
                    top_obj_buff=cell(1,5000);
                end
                
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
                basic_geometry3_bottom_real_comparison
                drawnow()
                
            end
            
            
            if abs(ov_force)< 1e-7
                strikes=strikes-1;
                if strikes==0
                    disp('Resting condition is met simulation is complete')
                    break
                end
            else
                strikes=max_strikes;
                
            end
            
        end
        %%
        %
    catch
        disp("Simulation Failed Saving results as they are")
    end
    y_pos_cells{end+1}=y_pos_buff;
    t_cells{end+1}=t_rec_buff;
%     electr_cells{end+1}=electr_buff;
    btm_obj_cells{end+1}=btm_obj_buff;
    top_obj_cells{end+1}=top_obj_buff;
    
    rem_cells=find(t_cells{end}~=0);
    
    t_cells{end}=t_cells{end}(rem_cells);
    y_pos_cells{end}=y_pos_cells{end}(rem_cells);
    
    save(results_file,'obj','com_mech','y_pos_cells','t_cells','btm_obj_cells','top_obj_cells','rem_cells');

end
