%% Create an ElectroStatic Estimator Object
clear;clc;
initial_points=get_initial_configuration();
thickness=100e-6;
insulator_thickness=130e-6;
sheet_width=0.0127;
clip_l=0.01;base_l=0.01;voltage=0;
obj=ES_Estimator(thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage);
if isempty(obj.comsol_model)
    disp("COMSOL Model is not initialized yet")
end

if isempty(obj.numerical_model)
    disp("Analytical Model is not initialized yet")
end

%% Create COMSOL Mechanical Model
clear;clc;
L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;
sht_dms=[(L-base_l)/2 sheet_width thickness];
N=11;
obj=COMSOL_Mechanical(sht_dms,N);

%% Create Mass Spring Mechanical Model
% N=11;->K_Trans aprox (3.41e3) / Zipping at 2e5V (200KV)
% N=21;->K_Trans aprox (2.4e4)
% N=31;->K_Trans aprox (7.7e4)
% N=61;->K_Trans aprox (5.93e5)
% N130 ->K_Trans aprox (5.7e6)
clear;clc; close all;
N=21;

L=0.1; sheet_width=0.0127; thickness=100e-6;
base_l=0.01;
sht_dms=[(L-base_l)/2 sheet_width thickness];
% material='steel';
obj=Mechanical_Model_EZ(sht_dms,N);
obj.M=20e-2;
obj.set_damping_factor(200);
obj.set_shear_elastic_coefficient(3410);
obj.set_direct_elastic_coefficient(5.6444e+05);
% obj.plate.define_force_bc('l_fix');% Left edge is fix
% obj.plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
obj.set_damping_factor(1);
obj.set_shear_elastic_coefficient(2.4e4);
obj.set_direct_elastic_coefficient(5.6444e+05);
%%
T=0;
dt=3e-9;%20e-7;
refresh_t=1e-3;
dispT=0;


refresh_t2=1e-4;
dispT2=0;

a=0;
v=0;
alpha=0.999;
drunk_scale=1.01;

% obj.perform_timestep(dt)
while T<5
    new_a=obj.bottom_plate.a(2,end);
    new_v=obj.bottom_plate.v(2,end);
    a=a*alpha+new_a*(1-alpha);
    v=v*alpha+new_v*(1-alpha);
    
    if T>=dispT2
        dispT2=T+refresh_t2;
        disp([num2str(T),':',num2str(a),'|',num2str(new_a),'|',num2str(v),'|',num2str(new_v)])
    end
    %       disp(T)
    obj.calculate_all_forces()
    %     obj.perform_pseudostatic_timestep(dt)
    success_flag=false;
    while~success_flag
        success_flag=obj.perform_timestep(dt);
        if success_flag
            dt=dt*drunk_scale;
        else
            dt=dt/drunk_scale;
        end
%         disp(dt)
        if dt==0
            break
        end
        
    end
    if dt==0
        break
    end
    %     success_flag=perform_timestep(obj,dt)
    T=T+dt;
    disp(dt)
    if T>=dispT
        hold off
        dispT=T+refresh_t;
        plot(obj.bottom_plate.p(1,:),obj.bottom_plate.p(2,:),'r-x')
        hold on
        grid on
        plot(obj.top_plate.p(1,:),obj.top_plate.p(2,:),'b-o')
        axis('equal')
        net_f_top=sum(obj.top_plate.f,2);
        net_f_btm=sum(obj.bottom_plate.f,2);
        %         disp([num2str(T),': Fy_btm[',num2str(net_f_btm(2)),'] Fy_top[',num2str(net_f_top(2)),']'])
        drawnow
    end
end
%%
obj.set_damping_factor(01);
obj.set_shear_elastic_coefficient(2.4e4);
obj.set_direct_elastic_coefficient(5.6444e+05);

%%


% 1.1.0 Do a backup
p_bu=h.obj.plate.p;
v_bu=h.obj.plate.v;
dt_timestep_reco=0;
tries=0;
% 1.1.1 Electrical Force estimation
%                     if Voltage>0 && ~isempty(h.obj_es.y)
%                        h.f_el=estimate_electrical_forces();
%                     else
%                        h.f_el=zeros(size(h.obj.plate.p));
%                     end

% 1.1.2 TimeStep Resizing + Step with valid timestep
while dt_timestep_reco~=dt_timestep %Check for stability
    h.obj.calculate_all_forces(h.f_el);
    h.obj.perform_timestep(dt_timestep);
    dt_timestep_reco=h.obj.plate.analyze_divergence(dt_timestep);
    if dt_timestep_reco~=dt_timestep %If divergence is detected
        tries=tries+1;
        dt_timestep=dt_timestep/drunk_scale; % Reduce timestep
        h.obj.plate.p=p_bu; %Reset position of particles
        h.obj.plate.v=v_bu; %Reset velocities of particles
        %disp(dt_timestep)
    elseif tries==0 %If in the first go was stable
        dt_timestep=dt_timestep*drunk_scale; % Increase timestep
        break
    end
    %dt_timestep_reco=obj.plate.analyze_divergence(dt_timestep);
end