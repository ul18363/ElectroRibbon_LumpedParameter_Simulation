
function calculate_acceleration(obj)
obj.apply_force_bc(); % Apply boundaries condition to forces
obj.a=obj.f./obj.dm_vec;
end