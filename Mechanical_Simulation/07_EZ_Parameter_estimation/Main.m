
clear; clc;
%profile on
try
    %obj=EZModel(sht_dms,N,material,base_width,gap)
    gap=50e-6;
    obj= EZModel([0.1 0.0127 100e-6],11,'steel',0.01,gap);
    obj.M=20e-3;%20 grams of load
    obj.set_damping_factor(3e4);%3e4 pretty close to critical
    dt=1e-7; %Simulation timestep [s]
    %obj.dt_st=dt_st;
    T=5; %Maximum simulation time [s]
    %% Simulation Loop
    profile on
    tic
    for i=0:dt:T   
        if rem(i,1e-4)==0 % Plot every 0.1ms
            toc
            %hold off
%             subplot(2,1,2)
%             plot(10^3*obj.bottom_plate.p(1,:),10^3*obj.bottom_plate.p(2,:),'r-o')
%             %hold on
%             grid on
%             subplot(2,1,1)
%             plot(10^3*obj.top_plate.p(1,:),10^3*obj.top_plate.p(2,:),'b-o')
            hold off
            plot(10^3*obj.top_plate.p(1,:),10^3*(obj.top_plate.p(2,:)-gap),'b-o')
            hold on
            plot(10^3*obj.bottom_plate.p(1,:),10^3*obj.bottom_plate.p(2,:),'r-o')
            %hold on
            title(['model t:',num2str(i)])
            xlabel('x [mm]')
            ylabel('y [mm]')
            axis([0 50 -8e-3 0])
            grid on
            drawnow
            %pause(0.5)
            %break
            tic
        end
        obj.calculate_all_forces();
        obj.perform_timestep(dt);
    end
catch
    
profile viewer
profile off
end