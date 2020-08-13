
%% Create Mass Spring Mechanical Model
% N=11;->K_Trans aprox (3.41e3) / Zipping at 2e5V (200KV)
% N=21;->K_Trans aprox (2.4e4)
% N=31;->K_Trans aprox (7.7e4)
% N=61;->K_Trans aprox (5.93e5)
% N130 ->K_Trans aprox (5.7e6)
clear;clc;
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

%% Find equilibrium position

T=0;
dt=20e-7;
refresh_t=1e-3;
dispT=0;
% obj.perform_timestep(dt)
while T<5
    
%     disp(T)
  	obj.calculate_all_forces()
    obj.perform_pse(dt)
    T=T+dt;
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
        disp([num2str(T),': Fy_btm[',num2str(net_f_btm(2)),'] Fy_top[',num2str(net_f_top(2)),']'])
        drawnow
    end
end
%%
obj.set_damping_factor(01);
obj.set_shear_elastic_coefficient(2.4e4);
obj.set_direct_elastic_coefficient(5.6444e+05);
%%
error_fun(obj)
function e=error_fun(obj)
%         obj.top_plate.v=obj.top_plate.v*0; %No damping
%         obj.top_plate.v=obj.bottom_plate.v*0; %No damping
        obj.calculate_all_forces()
        relevant_top_f=(obj.top_plate.f-obj.top_plate.f_damping).*obj.top_plate.f_mask;
        relevant_btm_f=(obj.bottom_plate.f-obj.bottom_plate.f_damping).*obj.bottom_plate.f_mask;
        
        net_f_top=sum( relevant_top_f,2);
        
        net_f_btm=sum(relevant_btm_f,2);
        net_f=net_f_top(2)+net_f_btm(2);
        e=sum(net_f.^2);
        %%
end
