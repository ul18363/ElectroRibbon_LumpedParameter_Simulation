function perform_pseudostatic_timestep(obj,dt)
% Update positions pseudostatically
    obj.bottom_plate.perform_pseudostatic_timestep(dt);
    obj.top_plate.perform_pseudostatic_timestep(dt);
end