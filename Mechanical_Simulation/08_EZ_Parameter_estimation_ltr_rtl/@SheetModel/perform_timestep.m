function perform_timestep(obj,dt) %Timestep size is defined outside 
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
    obj.apply_force_bc(); % Apply boundaries condition to forces
    obj.a=obj.f/obj.dm;
    obj.v=obj.v+obj.a*dt;
    obj.p=obj.p+obj.v*dt;
end