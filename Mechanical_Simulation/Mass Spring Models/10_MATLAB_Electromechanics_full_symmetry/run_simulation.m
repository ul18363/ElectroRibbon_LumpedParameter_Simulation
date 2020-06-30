


tic
y_min=obj.plate.p(2,end);
%y_max=obj.plate.p(2,end);
%figure
plot_type=0; % 0- Snapshot at give time of all geometry
% 1- End effector position over time
%profile on
% fs={};
% accs={};
% vs={};
% ps={};
% f_els={};
% f_damps={};
% local_y_def_rtl_s={};
% local_y_def_ltr_s={};
T_Sim=0;
last_refresh=0;
safety_factor=1e-2;
countdown_th=1e4;
countdown=1e4;
dt_timestep=dt;
plot_results=false;
drunk_scale=1.01;
drunk_scale2=1.01;
while T_Sim<T
    % First do a backup
    p_bu=obj.plate.p;
    v_bu=obj.plate.v;
    dt_timestep_reco=0;
    tries=0;
    while dt_timestep_reco~=dt_timestep
    obj.calculate_all_forces();
    
    obj.perform_timestep(dt_timestep);
    %obj.calculate_all_forces();
    dt_timestep_reco=obj.plate.analyze_divergence(dt_timestep);
    %dt_timestep
    %dt_timestep_reco
        if dt_timestep_reco~=dt_timestep %If divergence is detected 
            tries=tries+1;
            dt_timestep=dt_timestep/drunk_scale; % Reduce timestep
            obj.plate.p=p_bu; %Reset position of particles
            obj.plate.v=v_bu; %Reset velocities of particles
            %disp(dt_timestep)
        elseif tries==0 %If in the first go was stable 
            dt_timestep=dt_timestep*drunk_scale; % Increase timestep
            break
        end
    %dt_timestep_reco=obj.plate.analyze_divergence(dt_timestep);
        
    end
    %obj.perform_timestep(dt_timestep); Perform Timestep
    %dt_timestep=dt_timestep_reco;
    %countdown=countdown-1;
%     if dt_timestep_reco~=dt
%        disp(dt_timestep_reco)
%     end
    %disp(obj.plate.f)
    if any(isnan(obj.plate.f),'all')
        break
        %     else
        %         local_y_def_ltr_s{end+1}=obj.plate.local_def_y_ltr;
        %         local_y_def_rtl_s{end+1}=obj.plate.local_def_y_rtl;
        %         f_damps{end+1}=obj.plate.f_damping;
        %         f_els{end+1}=obj.plate.f_elastic;
        %         fs{end+1}=obj.plate.f;
        %         accs{end+1}=obj.plate.a;
        %         vs{end+1}=obj.plate.v;
        %         ps{end+1}=obj.plate.p;
    end
    if T_Sim>(last_refresh+t_refresh)% || countdown<=0 % Plot every t_refresh simulated seconds
        last_refresh=T_Sim;
        %         countdown=countdown_th;
        toc
        if toc<0.5
            obj.set_damping_factor(obj.plate.damp_factor*drunk_scale2); %Increase damping factor if simulation is fast
        else
            obj.set_damping_factor(obj.plate.damp_factor/drunk_scale2); %Decrease damping factor if simulation is slow
        end
        
        disp(['Velocity magnitude :',num2str(sqrt(sum(v_bu.^2,'all')))])
        hold off
        %y_min=min(y_min,obj.plate.p(2,end));
        if plot_type==0
            %%
            x_max=0.1;
            plot(obj.real_x_tp,obj.real_y_tp,'r-x')
            hold on
            plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b-o')
            %             title(['model t:',num2str(i) ])
            title(['Profile deflection| Scale:',num2str(scale),...
                '| M:',num2str(obj.M),'| t:',num2str(last_refresh)])
            xlabel('x [m]')
            ylabel('y [m]')
            legend({'Real', 'Simulation'})
            %            axis([0 0.1 y_min 0])
            %             plot_forces_on_link
            grid on
            drawnow
            %%
        elseif plot_type==1
            %y_max=max(y_max,obj.plate.p(2,end));
            x_max=0.01;
            plot(i,obj.plate.p(2,end),'b.')
            hold on
            title(['model t:',num2str(i)])
            xlabel('t [s]')
            ylabel('y [mm]')
            grid on
            drawnow
        end
        %if y_min<0
        %    axis([0 x_max y_min 0])
        %end
        tic
    end
    T_Sim=T_Sim+dt_timestep;
    %dt_timestep
    %obj.perform_timestep(dt_timestep);
end