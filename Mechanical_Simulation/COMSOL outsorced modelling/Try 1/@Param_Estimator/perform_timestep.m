function perform_timestep(obj,dt)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
    obj.plate.perform_timestep(dt);
end