


tic
y_min=obj.plate.p(2,end);
%y_max=obj.plate.p(2,end);
figure
plot_type=0; % 0- Snapshot at give time of all geometry
% 1- End effector position over time
%profile on
for i=0:dt:T
    obj.calculate_all_forces();
    if rem(i,t_refresh)==0 % Plot every 0.1ms
        toc
        hold off
        %y_min=min(y_min,obj.plate.p(2,end));
        if plot_type==0
%             x_max=0.1;
%             plot(obj.real_x_tp,obj.real_y_tp)
%             hold on
%             plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b-o')
%             title(['model t:',num2str(i)])
%             xlabel('x [mm]')
%             ylabel('y [mm]')
%            axis([0 0.1 y_min 0])
            plot_forces_on_link
        elseif plot_type==1
            %y_max=max(y_max,obj.plate.p(2,end));
            x_max=0.01;
            plot(i,obj.plate.p(2,end),'b.')
            hold on
            title(['model t:',num2str(i)])
            xlabel('t [s]')
            ylabel('y [mm]')   
        end
        %if y_min<0
        %    axis([0 x_max y_min 0])
        %end
        grid on
        drawnow
        tic
    end
    obj.perform_timestep(dt);
end