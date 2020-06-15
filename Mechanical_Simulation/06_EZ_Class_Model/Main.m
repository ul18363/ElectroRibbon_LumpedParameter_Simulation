
clear; clc;
%profile on
try
    obj= SheetModel([0.1 0.0127 100e-6],11,0,0,'steel');
    dt_st=1e-6; %Simulation timestep [s]
    obj.dt_st=dt_st;
    T=5; %Maximum simulation time [s]
    obj.define_edges_orientation_bc([1;0],[]); %Left edge has horizontal orientation
    obj.define_force_bc('l_fix');%Left edge position is fix
    %% Simulation Loop
    profile on
    for i=0:dt_st:T   
        obj.calculate_all_forces();
        obj.perform_timestep();
        if rem(i,1e-3)==0 % Plot every 0.1ms
            toc
            plot(10^3*obj.p(1,:),10^3*obj.p(2,:),'ro')
            title(['model t:',num2str(i)])
            %axis([0 0.1 -1e-8 0])
            grid on
            drawnow
            %pause(0.5)
            %break
            tic
        end
    end
catch
    
profile viewer
profile off
end