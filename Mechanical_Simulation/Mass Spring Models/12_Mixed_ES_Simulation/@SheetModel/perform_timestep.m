function perform_timestep(obj,dt) %Timestep size is defined outside
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
obj.apply_force_bc(); % Apply boundaries condition to forces
obj.a=obj.f./obj.dm_vec;

obj.v=obj.v+obj.a*dt;
obj.p=obj.p+obj.v*dt;
% capped_simulation_flag=false;
% if capped_simulation_flag
%     max_vel= 0.1; %m/s- T refresh ->10^-2 s
%     new_vel=obj.v+obj.a*dt;
%     % Calculte new velocity with the following effects:
%         % 1- If current velocity opposes acceleration and velocity changes
%         % sign set to 0. -> If drag force is too powerful and generates
%         % ever increasing oscillations. (Force depends on velocity.
%         % Acceleration depende on force, acceleration determines new
%         % velocity) So what can happen is that a big velocity turns into a
%         % big force, wich turns into a big acceleration (against the
%         % direction of velocity) if this velocity is bigger than the
%         % original one, the force will be bigger, thus the acceleration
%         % will be bigger and so on. A way to solve this is by stopping the
%         % particle, set the velocity to 0 and let it resume journey.
%
%         % 2- If the velocity gets too big can cause the elastic forces to
%         % get out of hand, causing a similar problem to the one before,
%         % however stopping the particle here is of no use. The force will
%         % remain big so a way to solve this is by capping the velocity
% else
%     obj.v=obj.v+obj.a*dt;
%     obj.p=obj.p+obj.v*dt;
% end

end