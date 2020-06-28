


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
while T_Sim<T
    obj.calculate_all_forces();
    %dt_timestep=safety_factor*obj.plate.analyze_divergence(dt);
    %countdown=countdown-1;
    %     if dt_timestep~=dt
    %      disp(dt_timestep)
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
    obj.perform_timestep(dt_timestep);
end