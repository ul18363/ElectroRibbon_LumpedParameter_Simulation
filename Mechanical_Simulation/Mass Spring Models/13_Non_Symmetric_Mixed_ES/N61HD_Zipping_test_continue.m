%% Create Mass Spring Mechanical Model
% N=11;->K_Trans aprox (3.41e3) / Zipping at 2e5V (200KV)
% N=21;->K_Trans aprox (2.4e4)
% N=31;->K_Trans aprox (7.7e4)
% N=61;->K_Trans aprox (5.93e5)
% N130 ->K_Trans aprox (5.7e6)
clear;clc; close all;
N=61;

L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=200e-3;
% material='steel';
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
% obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_damping_factor(10);
obj.mechanical_model.set_computation_definitions(0,0);
% obj.mechanical_model.set_shear_elastic_coefficient(2.4e4);
obj.mechanical_model.set_shear_elastic_coefficient(5.93e5);
obj.mechanical_model.set_direct_elastic_coefficient(5.6444e+05);
dt=3e-9;
T=0;
%
 load('N61open.mat')
obj.mechanical_model.bottom_plate.p=obj_old.mechanical_model.bottom_plate.p;
obj.mechanical_model.top_plate.p=obj_old.mechanical_model.top_plate.p;
clear obj_old

dt=3e-9;
% obj.voltage=10e3;%10e4;
obj.voltage=30;%10e4;
% obj.update_ES_model('COMSOL')
obj.mechanical_model.set_damping_factor(01);
clc;
% T=0;
% d;%20e-7;
% refresh_t=1e-5;

base_line_dt=1e-7;
% max_dt=1e-5;
max_dt=base_line_dt;
% refresh_t=1e-5;

% refresh_t=1e-4; %Plot refresh
% dispT=T+refresh_t;
refresh_t=base_line_dt*1000; %Plot refresh
dispT=T+refresh_t;

success_flag=false;

% refresh_t2=1e-4;
refresh_t2=base_line_dt*1000; % Print in Screen
dispT2=T+refresh_t2;

refresh_t3=1e-4; % Data Recording
dispT3=T+refresh_t3;


a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;

while~success_flag
    success_flag=obj.perform_timestep(dt,'Manual_concentrated_zip_force');
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
p=obj.mechanical_model.bottom_plate.p(2,end);
ov_force=obj.overall_force('Disregard_drag');
% obj.perform_timestep(dt)
%
frame=0;
video_dir=['videos_N',num2str(N),'_',datestr(now,'yyyy_mm_dd_HH_MM_SS')];
%%
load('N61HD_Zipping')
while T<5
    %
    %     new_a=obj.mechanical_model.bottom_plate.a(2,end);
    %     new_v=obj.mechanical_model.bottom_plate.v(2,end);
    %     a=a*alpha+new_a*(1-alpha);
    %     v=v*alpha+new_v*(1-alpha);
    new_p=obj.mechanical_model.bottom_plate.p(2,end);
    p=p*alpha+new_p*(1-alpha);
    dt_avg=dt_avg*alpha+dt*(1-alpha);
    old_ov_force=ov_force;
    ov_force=ov_force*alpha+obj.overall_force('Disregard_drag')*(1-alpha);
    if sign(old_ov_force)~=sign(ov_force)
        obj.mechanical_model.bottom_plate.v=obj.mechanical_model.bottom_plate.v*0;
        obj.mechanical_model.top_plate.v=obj.mechanical_model.top_plate.v*0;
    end
    if T>=dispT2
        
        dispT2=T+refresh_t2;
        
        %         disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
        disp([num2str(T),':',num2str(p),'|',num2str(ov_force),'|',num2str(dt_avg)])
        
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
        success_flag=obj.perform_timestep(dt,'Manual_concentrated_zip_force');
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
        %         obj.update_ES_model('COMSOL')
        %         geometry_with_zoom
        %
        full_kinematics
        sgtitle(['Analysis at T:', num2str(T),' s'])
        drawnow
        %
        if ~exist(video_dir, 'dir')
            mkdir(video_dir)
        end
        frame=frame+1;
        
        saveas(gcf(),[video_dir,'/',num2str(frame),'.png'],'png')
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