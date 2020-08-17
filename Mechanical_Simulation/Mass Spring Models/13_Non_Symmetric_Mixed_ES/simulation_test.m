clear;clc; close all;
N=21;

L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=60e-3;
% material='steel';
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
% obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_damping_factor(0);
obj.mechanical_model.set_shear_elastic_coefficient(2.4e4);
% obj.mechanical_model.set_shear_elastic_coefficient(5.93e5);
% obj.mechanical_model.set_direct_elastic_coefficient(5.6444e+05);
dt=3e-9;
T=0;


% load('N61_zip2.mat')
% obj.voltage=15e3;%10e4;
obj.mechanical_model.halt_velocities();
% obj.update_ES_model('COMSOL')
obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_internal_damping_factor(0.01*0);
clc;
% T=0;
dt=1e-10;%20e-7;
%%
% max_dt=1e-8;
base_line_dt=1e-7;
% max_dt=1e-5;
max_dt=base_line_dt;
% refresh_t=1e-5;

% refresh_t=1e-4; %Plot refresh
% dispT=T+refresh_t;
refresh_t=base_line_dt*10; %Plot refresh
dispT=T+refresh_t;

success_flag=false;

% refresh_t2=1e-4;
refresh_t2=base_line_dt*10; % Print in Screen
dispT2=T+refresh_t2;

refresh_t3=1e-4; % Data Recording
dispT3=T+refresh_t3;

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;


%
while~success_flag
    success_flag=obj.perform_timestep(dt,'COMSOL');
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
buff_len=5000;
y_pos_cells={};
t_cells={};
y_pos_buff=zeros([buff_len,1]);
t_rec_buff=y_pos_buff;


count=0;
ov_force=obj.overall_force('Disregard_drag');
zip_ix=obj.mechanical_model.contact_ix+1;
initial_d=obj.mechanical_model.top_plate.p(2,zip_ix)-obj.mechanical_model.bottom_plate.p(2,zip_ix);
d=initial_d;



filt_v_top=obj.mechanical_model.top_plate.v(2,:);
filt_v_btm=obj.mechanical_model.bottom_plate.v(2,:);
filt_a_top=obj.mechanical_model.top_plate.a(2,:);
filt_a_btm=obj.mechanical_model.bottom_plate.a(2,:);


% obj.perform_timestep(dt)
while T<5
    
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
    
    if T>=dispT3
        count=count+1;
        dispT3=T+refresh_t3;
        %         disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
        t_rec_buff(count)=T;
        y_pos_buff(count)=obj.mechanical_model.bottom_plate.p(2,end);
        
        if count>5000
            count=0;
            y_pos_cells{end+1}=y_pos_buff;
            t_cells{end+1}=t_rec_buff;
            y_pos_buff=zeros([buff_len,1]);
            t_rec_buff=y_pos_buff;
        end
        
    end
    
    
    success_flag=false;
    while~success_flag
        success_flag=obj.perform_timestep(dt,'COMSOL');
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
    if T>=dispT
        dispT=T+refresh_t;
        try
            %         obj.update_ES_model('COMSOL')
            %         disp("COMSOL update succesfull")
        catch ME
            disp("Try to Update COMSOL model but failed")
            
            
        end
        subplot(2,2,1)
        hold off
        plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r')
        hold on
        plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'b')
        xlabel('Position')
        %         plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'r-x')
        %         hold on
        %         grid on
        %         plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-o')
        %         axis('equal')
        %         net_f_top=sum(obj.mechanical_model.top_plate.f,2);
        %         net_f_btm=sum(obj.mechanical_model.bottom_plate.f,2);
        %         %         disp([num2str(T),': Fy_btm[',num2str(net_f_btm(2)),'] Fy_top[',num2str(net_f_top(2)),']'])
        subplot(2,2,2)
        hold off
        %         plot(obj.mechanical_model.top_plate.f(2,:),'r')
        plot(obj.mechanical_model.top_plate.f(2,:),'r')
        hold on
        %         plot(obj.mechanical_model.bottom_plate.f(2,:),'b')
        plot(obj.mechanical_model.bottom_plate.f(2,:),'b')
        if true
            plot(obj.mechanical_model.top_plate.f_internal_damping(2,:),'r-x')
            plot(obj.mechanical_model.bottom_plate.f_internal_damping(2,:),'b-x')
        end
        
        if true
            plot(obj.mechanical_model.top_plate.f_elastic(2,:),'r-v')
            plot(obj.mechanical_model.bottom_plate.f_elastic(2,:),'b-v')
        end
        if false && ~isempty(obj.mechanical_model.top_plate_ext_f)
            plot(obj.mechanical_model.top_plate_ext_f(2,:),'r-x')
            plot(obj.mechanical_model.bottom_plate_ext_f(2,:),'b-x')
        end
        xlabel('Forces')
        
        subplot(2,2,3)
        hold off
%         plot(obj.mechanical_model.top_plate.a(2,:),'r--x')
%         hold on
%         plot(obj.mechanical_model.bottom_plate.a(2,:),'b--x')
        plot(filt_a_top,'r--o')
        hold on
        plot(filt_a_btm,'b--o')
        xlabel('Acceleration')
        
        subplot(2,2,4)
        hold off
        plot(obj.mechanical_model.top_plate.v(2,:),'r--x')
        hold on
        plot(obj.mechanical_model.bottom_plate.v(2,:),'b--x')
        plot(filt_v_top,'r--o')
        plot(filt_v_btm,'b--o')
        
        xlabel('Velocity')
        
        drawnow
        
    end
    
    if obj.mechanical_model.contact_ix==obj.N-1
        disp('Zipping is complete')
        break
    end
    
end

%%
y_pos_cells{end+1}=y_pos_buff;
t_cells{end+1}=t_rec_buff;
rem_cells=find(t_cells{end}~=0);

t_cells{end}=t_cells{end}(rem_cells);
y_pos_cells{end}=y_pos_cells{end}(rem_cells);
%%
t_rec=cat(1,t_cells{:});
y_rec=cat(1,y_pos_cells{:});
figure();
plot(t_rec,y_rec)
grid on