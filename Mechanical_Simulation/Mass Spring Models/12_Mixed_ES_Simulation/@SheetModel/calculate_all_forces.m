
function calculate_all_forces(obj)
obj.calculate_elastic_forces()
obj.f_gravity=[0;-9.81]*obj.dm_vec;
obj.f_damping=obj.scale_up(-obj.v,sqrt(sum(obj.v.^2)))*obj.damp_factor;
obj.f=obj.f_elastic+obj.f_damping+obj.f_gravity;
end