
clear; clc;
%profile on
obj= Param_Estimator([0.1 0.0127 100e-6],21,'Steel AISI 4340',0.01);
obj.set_damping_factor(3e4);%1e6 pretty close to critical (3e4 nice waves)
% df_c=3e6 ->N=11
dt=1e-7; %Simulation timestep [s]
%obj.dt_st=dt_st;
T=5; %Maximum simulation time [s]

tic
y_min=obj.plate.p(2,end);
y_max=obj.plate.p(2,end);
close all
plot_type=0; % 0- Snapshot at give time of all geometry
% 1- End effector position over time
for i=0:dt:T
    if rem(i,1e-5)==0 % Plot every 0.1ms
        toc
        %hold off
        %             subplot(2,1,2)
        %             plot(10^3*obj.bottom_plate.p(1,:),10^3*obj.bottom_plate.p(2,:),'r-o')
        %             %hold on
        %             grid on
        %             subplot(2,1,1)
        %             plot(10^3*obj.top_plate.p(1,:),10^3*obj.top_plate.p(2,:),'b-o')
        %         hold off
        %         plot(10^3*obj.plate.p(1,:),10^3*(obj.plate.p(2,:)),'b-o')
        %         hold on
        %         plot(10^3*obj.bottom_plate.p(1,:),10^3*obj.bottom_plate.p(2,:),'r-o')
        %hold on
        
        
        %
        y_min=min(y_min,obj.plate.p(2,end));
        if plot_type==0
            x_max=0.1;
            plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b-o')
            title(['model t:',num2str(i)])
            xlabel('x [mm]')
            ylabel('y [mm]')
%            axis([0 0.1 y_min 0])
        elseif plot_type==1
            %y_max=max(y_max,obj.plate.p(2,end));
            x_max=0.01;
            plot(i,obj.plate.p(2,end),'b.')
            hold on
            title(['model t:',num2str(i)])
            xlabel('t [s]')
            ylabel('y [mm]')
            
        end
        if y_min<0
            axis([0 x_max y_min 0])
        end
        grid on
        drawnow
        %pause(0.5)
        %break
        tic
    end
    obj.calculate_all_forces();
    obj.perform_timestep(dt);
end