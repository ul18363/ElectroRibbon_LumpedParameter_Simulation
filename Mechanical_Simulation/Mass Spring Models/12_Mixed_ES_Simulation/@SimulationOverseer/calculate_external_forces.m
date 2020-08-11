function calculate_external_forces(obj)
% Force of the load
obj.f_free_tip=obj.bottom_plate.f(:,end);
dm=obj.bottom_plate.dm;
f_loaded_tip=(obj.f_free_tip+obj.M*obj.g)*dm/(obj.M+dm);
obj.bottom_plate.f(:,end)=f_loaded_tip;
% ES forces
obj.estimate_electrical_force();
obj.top_plate.f=obj.top_plate.f+obj.f_el_top;
obj.bottom_plate.f=obj.bottom_plate.f+obj.f_el_btm;
end