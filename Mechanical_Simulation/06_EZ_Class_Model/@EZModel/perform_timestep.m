function perform_timestep(obj,dt)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
    obj.bottom_plate.perform_timestep(dt);
    obj.top_plate.perform_timestep(dt);
end