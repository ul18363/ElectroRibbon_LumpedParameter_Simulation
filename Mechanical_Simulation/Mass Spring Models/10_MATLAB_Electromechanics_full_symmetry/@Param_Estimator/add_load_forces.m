function add_load_forces(obj)
% Force of the load
f_free_tip=obj.plate.f(:,end);
dm=obj.plate.dm;
% Add Additionl Mass
f_loaded_tip=((f_free_tip+obj.M*obj.g)/(obj.M+dm)) * dm; %Calculate acceleration of both masses attached, divide by total mass and multiply by mass of particle to obtain net force on particle.
% Replace resulting force
obj.plate.f(:,end)=f_loaded_tip;
end