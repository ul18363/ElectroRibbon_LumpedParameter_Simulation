%% Create Mass Spring Mechanical Model
% N=11;->K_Trans aprox (3.41e3) / Zipping at 2e5V (200KV)
% N=21;->K_Trans aprox (2.4e4)
% N=31;->K_Trans aprox (7.7e4)
% N=61;->K_Trans aprox (5.93e5)
% N130 ->K_Trans aprox (5.7e6)
clear;clc; close all;
N=21;

L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;clip_l=0.01;
ins_thickness=130e-6;
sht_dms=[L sheet_width thickness];
M=200e-3;
% material='steel';
obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M);
% obj.mechanical_model.set_damping_factor(1);
obj.mechanical_model.set_damping_factor(10);
% obj.mechanical_model.set_shear_elastic_coefficient(2.4e4);
obj.mechanical_model.set_shear_elastic_coefficient(2.4e4);
obj.mechanical_model.set_direct_elastic_coefficient(5.6444e+05);
%%
T=0
%%
load('N21_open.mat')
obj.voltage=6000;
obj.update_ES_model('COMSOL')

clc;
% T=0;
dt=3e-9;%20e-7;
% refresh_t=1e-5;
refresh_t=1e-3; %Plot refresh
dispT=0;
success_flag=false;

% refresh_t2=1e-4;
refresh_t2=1e-3; % Print in Screen
dispT2=0;

refresh_t3=1e-4; % Data Recording
dispT3=0;

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;
dt_avg=dt;

while~success_flag
    success_flag=obj.perform_timestep(dt);
    if success_flag
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
% obj.perform_timestep(dt)
while T<5
    
    new_a=obj.mechanical_model.bottom_plate.a(2,end);
    new_v=obj.mechanical_model.bottom_plate.v(2,end);
    a=a*alpha+new_a*(1-alpha);
    v=v*alpha+new_v*(1-alpha);
    dt_avg=dt_avg*alpha+dt*(1-alpha);
    ov_force=ov_force*alpha+obj.overall_force('Disregard_drag')*(1-alpha);
    if T>=dispT2
        dispT2=T+refresh_t2;
        disp([num2str(T),':',num2str(dt_avg),'|',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v),'|',num2str(ov_force)])
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
        success_flag=obj.perform_timestep(dt);
        if success_flag
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
        hold off
        dispT=T+refresh_t;
        plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'r-x')
        hold on
        grid on
        plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-o')
        axis('equal')
        net_f_top=sum(obj.mechanical_model.top_plate.f,2);
        net_f_btm=sum(obj.mechanical_model.bottom_plate.f,2);
        %         disp([num2str(T),': Fy_btm[',num2str(net_f_btm(2)),'] Fy_top[',num2str(net_f_top(2)),']'])
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
%%


%%

obj.mechanical_model.restore_backup()
obj.mechanical_model.perform_timestep(dt)
[contact_flag,contact_dt]=obj.mechanical_model.check_for_new_sequential_contact('Vertical overpass');
%%


last_contact_ix=obj.mechanical_model.contact_ix;
ix_to_check=last_contact_ix+1;

% obj.mechanical_model.restore_backup()
% obj.mechanical_model.perform_timestep(dt)
%%
figure();
plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'r-x')
hold on
grid on
plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-o')
axis('equal')
% plot(obj.mechanical_model.bottom_plate.p_bu(1,:),obj.mechanical_model.bottom_plate.p_bu(2,:),'m--v')
% plot(obj.mechanical_model.top_plate.p_bu(1,:),obj.mechanical_model.top_plate.p_bu(2,:),'c--v')
% contact_dt
%%
last_contact_ix=obj.mechanical_model.contact_ix;
ix_to_check=last_contact_ix+1;
% ix_to_check=last_contact_ix+1;
% vy_top=obj.mechanical_model.top_plate.v_bu(2,ix_to_check);
% vy_btm=obj.mechanical_model.bottom_plate.v_bu(2,ix_to_check);


y_btm=obj.mechanical_model.bottom_plate.p(2,ix_to_check);
y_top=obj.mechanical_model.top_plate.p(2,ix_to_check);
disp([num2str(y_btm),'|',num2str(y_top)])

y_btm_prev=obj.mechanical_model.bottom_plate.p_bu(2,ix_to_check);
y_top_prev=obj.mechanical_model.top_plate.p_bu(2,ix_to_check);

vy_btm=obj.mechanical_model.bottom_plate.v(2,ix_to_check);
vy_top=obj.mechanical_model.top_plate.v(2,ix_to_check);

vy_btm_prev=obj.mechanical_model.bottom_plate.v_bu(2,ix_to_check);
vy_top_prev=obj.mechanical_model.top_plate.v_bu(2,ix_to_check);


ay_top=obj.mechanical_model.top_plate.a(2,ix_to_check);
ay_btm=obj.mechanical_model.bottom_plate.a(2,ix_to_check);

net_d=y_top_prev-y_btm_prev;
net_v=vy_btm-vy_top;
contact_dt=net_d/net_v;
%%
obj.mechanical_model.restore_backup()

obj.mechanical_model.perform_timestep(contact_dt)
y_btm_contact=obj.mechanical_model.bottom_plate.p(2,ix_to_check);
y_top_contact=obj.mechanical_model.top_plate.p(2,ix_to_check);
contact_d=y_btm_contact-y_top_contact;

plot(obj.mechanical_model.bottom_plate.p_bu(1,:),obj.mechanical_model.bottom_plate.p_bu(2,:),'r.')
plot(obj.mechanical_model.top_plate.p_bu(1,:),obj.mechanical_model.top_plate.p_bu(2,:),'b.')
plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'r.')
plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b.')
