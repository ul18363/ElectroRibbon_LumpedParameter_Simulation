function success_flag=perform_timestep(obj,dt)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timeste


    obj.do_a_backup();

%     if true
%         obj.top_plate.f(2,:)=min(obj.bottom_plate.f(2,:),...
%             zeros(size(obj.bottom_plate.f(2,:))));
%         obj.top_plate.f(2,:)=min(obj.top_plate.f(2,:),...
%             zeros(size(obj.top_plate.f(2,:))));
%     end    
    % Perform timestep on single plates
    obj.bottom_plate.perform_timestep(dt);
    obj.top_plate.perform_timestep(dt);
    
    % Check for stability of timestep
    reco_dt=obj.analyze_divergence(dt);
    
    % If unstable go back! Otherwise carry on 
    if reco_dt~=dt 
        success_flag=false;
        obj.restore_backup();
        return
    else
        success_flag=true;
    end
    

end