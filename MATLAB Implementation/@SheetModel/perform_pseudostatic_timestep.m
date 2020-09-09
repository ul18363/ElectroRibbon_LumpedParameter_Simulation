function perform_pseudostatic_timestep(obj,dt) %Timestep size is defined outside
% Update position pseudostatically
obj.calculate_acceleration();
obj.p=obj.p+obj.a*(dt^2)/2;
end