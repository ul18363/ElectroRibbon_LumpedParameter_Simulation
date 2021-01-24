clear;clc; close all;
%Initialize model
%voltage_values=[5,6,8,10,12]*1000;
% voltage_values=[12,10,8,6,5]*1000;
% voltage_values=[12,10,8,6,5]*1000;
% voltage_values=[6,5,4,3,2.5,2]*1000;
% voltage_values=[5,4,3,2.5,2]*1000;
voltage_values=[6,5,4,3,2.5,2,1.5,1]*1000;
% voltage_values=[10,12]*1000;
% voltage_values=[6]*1000;

for voltage_ins=voltage_values
    voltage_ins=6000;
    clear obj obj0
        N=21;
%     N=61;
    %     N=130;
    L=0.1; sheet_width=0.0127; thickness=50e-6;
    base_l=0.01;clip_l=0.01;
    ins_thickness=130e-6;
    sht_dms=[L sheet_width thickness];
    M=61e-3;
    obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
    obj.mechanical_model.set_damping_factor(0);
    
    T=0;
    
    
    obj.mechanical_model.set_internal_damping_factor(0);
    
%     clc;
    
    if N==21
        damp_factor=10;%10-0.01 s
        base_line_dt=1e-6; % N21
        load(['e04_starting_conditions/','e04_caliobration_N21_m61.mat'])
        obj.mechanical_model.top_plate.p=obj2.mechanical_model.top_plate.p;
        obj.mechanical_model.bottom_plate.p=obj2.mechanical_model.bottom_plate.p;
        shear_coeff=obj2.mechanical_model.bottom_plate.k_trans;
        obj.mechanical_model.set_damping_factor(damp_factor);
        obj.mechanical_model.set_shear_elastic_coefficient(shear_coeff); %N21
    elseif N==61
        base_line_dt=1e-6; % N61
        damp_factor=100;
        load(['e04_starting_conditions/','e04_caliobration_N61_m61.mat'])
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
        load(['e04_starting_conditions/','e04_caliobration_N130_m61.mat'])
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
    refresh_t=1e-4; %Plot refresh
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
    % Go crazy with simulation
    frame=0;
    simulation_identifier=['N',num2str(N),'_m',num2str(obj.M*1000),'_V',num2str(voltage_ins),...
        '_',datestr(now,'yyyy_mm_dd_HH_MM_SS')];
    video_dir=['videos_',simulation_identifier];
    results_file=['e04_results_scaled_HL_',simulation_identifier,'.mat'];
    
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
    
    last_contact=obj.mechanical_model.contact_ix;
    tic
    %%
%     try
        while T<10
            
            %     new_a=obj.mechanical_model.bottom_plate.a(2,end);
            %     new_v=obj.mechanical_model.bottom_plate.v(2,end);
            %     a=a*alpha+new_a*(1-alpha);
            %     v=v*alpha+new_v*(1-alpha);
            %     dt_avg=dt_avg*alpha+dt*(1-alpha);
            ov_force=ov_force*alpha+obj.overall_force('Disregard_drag')*(1-alpha);
            zip_ix=obj.mechanical_model.contact_ix+1;
            new_d=obj.mechanical_model.top_plate.p(2,zip_ix)-obj.mechanical_model.bottom_plate.p(2,zip_ix);
            d=d*alpha+new_d*(1-alpha);
            
            
            filt_v_top=filt_v_top*alpha+(1-alpha)*obj.mechanical_model.top_plate.v(2,:);
            filt_v_btm=filt_v_btm*alpha+(1-alpha)*obj.mechanical_model.bottom_plate.v(2,:);
            filt_a_top=filt_a_top*alpha+(1-alpha)*obj.mechanical_model.top_plate.a(2,:);
            filt_a_btm=filt_a_btm*alpha+(1-alpha)*obj.mechanical_model.bottom_plate.a(2,:);
            if T>=dispT2
                
                dispT2=T+refresh_t2;
                %         d=obj.mechanical_model.top_plate.p(2,zip_ix)-obj.mechanical_model.bottom_plate.p(2,zip_ix);
                %         disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
                disp([num2str(T),':',num2str(d),'|',num2str(100*d/initial_d),'%|',num2str(ov_force)])
                
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
            if loop_condition_breaking(dt)
                break
            end
            %     success_flag=perform_timestep(obj,dt)
            T=T+dt;
            %     disp(dt)
            if (refresh_t_comsol>0) &&( T>=dispTCOMSOL)
                dispTCOMSOL=T+refresh_t_comsol;
                try
                    obj.update_ES_model(source_es);
                    disp([source_es,': update succesfull.'])
                catch ME
                    disp('Try to Update ',source_es,' model but failed')
                    
                    
                end
            end
            if T>=dispT
                dispT=T+refresh_t;
                full_kinematics
                
                drawnow
                if ~exist(video_dir, 'dir')
                    mkdir(video_dir)
                end
                frame=frame+1;
                
                saveas(gcf(),[video_dir,'/',num2str(frame),'.png'],'png')
                
            end
            
            if last_contact<obj.mechanical_model.contact_ix
                last_contact=obj.mechanical_model.contact_ix;
                full_kinematics
                drawnow
                dispT3=0;
            end
            
            if T>=dispT3
                count=count+1;
                dispT3=T+refresh_t3;
                %         disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
                
                %
                top_obj_tracker.p=obj.mechanical_model.top_plate.p;
                top_obj_tracker.v=obj.mechanical_model.top_plate.v;
                top_obj_tracker.a=obj.mechanical_model.top_plate.a;
                top_obj_tracker.f=obj.mechanical_model.top_plate.f;
                top_obj_tracker.f_elast=obj.mechanical_model.top_plate.f_elastic;
                top_obj_tracker.f_electr=obj.mechanical_model.top_plate_ext_f;
                top_obj_tracker.f_damp=obj.mechanical_model.top_plate.f_damping;
                
                btm_obj_tracker.p=obj.mechanical_model.bottom_plate.p;
                btm_obj_tracker.v=obj.mechanical_model.bottom_plate.v;
                btm_obj_tracker.a=obj.mechanical_model.bottom_plate.a;
                btm_obj_tracker.f=obj.mechanical_model.bottom_plate.f;
                btm_obj_tracker.f_elast=obj.mechanical_model.bottom_plate.f_elastic;
                btm_obj_tracker.f_electr=obj.mechanical_model.bottom_plate_ext_f;
                btm_obj_tracker.f_damp=obj.mechanical_model.bottom_plate.f_damping;
                
                if isequal(source_es,'COMSOL')
                    electr_obj_tracker.f_top=obj.electrostatic_model.comsol_EZ_model.Fy_dist_top;
                    electr_obj_tracker.x_top=obj.electrostatic_model.comsol_EZ_model.xs_top;
                    electr_obj_tracker.arclen_top=obj.electrostatic_model.comsol_EZ_model.arc_len_top;
                    electr_obj_tracker.h_top=obj.electrostatic_model.comsol_EZ_model.hs_top;
                    electr_obj_tracker.x_btm=obj.electrostatic_model.comsol_EZ_model.xs;
                    electr_obj_tracker.arclen_btm=obj.electrostatic_model.comsol_EZ_model.arc_len;
                    electr_obj_tracker.h_btm=obj.electrostatic_model.comsol_EZ_model.hs;
                    electr_obj_tracker.f_btm=obj.electrostatic_model.comsol_EZ_model.Fy_dist;
                elseif isequal(source_es,'Analytical')
                    electr_obj_tracker.f_top=obj.electrostatic_model.numerical_model.Fy_dist_top;
                    electr_obj_tracker.x_top=obj.electrostatic_model.numerical_model.xs_top;
                    electr_obj_tracker.arclen_top=obj.electrostatic_model.numerical_model.arc_len_top;
                    electr_obj_tracker.h_top=obj.electrostatic_model.numerical_model.hs_top;
                    electr_obj_tracker.x_btm=obj.electrostatic_model.numerical_model.xs;
                    electr_obj_tracker.arclen_btm=obj.electrostatic_model.numerical_model.arc_len;
                    electr_obj_tracker.h_btm=obj.electrostatic_model.numerical_model.hs;
                    electr_obj_tracker.f_btm=obj.electrostatic_model.numerical_model.Fy_dist;
                    
                end
                electr_buff{count}=electr_obj_tracker;
                btm_obj_buff{count}=btm_obj_tracker;
                top_obj_buff{count}=top_obj_tracker;
                
                t_rec_buff(count)=T;
                y_pos_buff(count)=obj.mechanical_model.bottom_plate.p(2,end);
                
                if count>buff_len
                    count=0;
                    y_pos_cells{end+1}=y_pos_buff;
                    t_cells{end+1}=t_rec_buff;
                    electr_cells{end+1}=electr_buff;
                    btm_obj_cells{end+1}=btm_obj_buff;
                    top_obj_cells{end+1}=top_obj_buff;
                    
                    
                    y_pos_buff=zeros([buff_len,1]);
                    t_rec_buff=y_pos_buff;
                    electr_buff=cell(1,5000);
                    btm_obj_buff=cell(1,5000);
                    top_obj_buff=cell(1,5000);
                end
                
            end
            
            
            
            if obj.mechanical_model.contact_ix==obj.N-4
                disp('Zipping is complete')
                break
            end
            
        end
        
        %
%     catch
%         disp("Simulation Failed Saving results as they are")
%     end
    %%
    real_time_elapsed=toc;
    y_pos_cells{end+1}=y_pos_buff;
    t_cells{end+1}=t_rec_buff;
    electr_cells{end+1}=electr_buff;
    btm_obj_cells{end+1}=btm_obj_buff;
    top_obj_cells{end+1}=top_obj_buff;
    
    
    rem_cells=find(t_cells{end}~=0);
    
    t_cells{end}=t_cells{end}(rem_cells);
    y_pos_cells{end}=y_pos_cells{end}(rem_cells);
    %%
%     save(results_file,'obj','real_time_elapsed','y_pos_cells','t_cells','electr_cells','btm_obj_cells','top_obj_cells','rem_cells');
end
%%
y_pos_cells{end}=[];
t_cells{end}=[];
electr_cells{end}=[];
btm_obj_cells{end}=[];
top_obj_cells{end}=[];
save(results_file,'obj','real_time_elapsed','y_pos_cells','t_cells','electr_cells','btm_obj_cells','top_obj_cells','rem_cells');
