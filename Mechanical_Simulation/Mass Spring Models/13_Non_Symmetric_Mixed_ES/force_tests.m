bottom_points=obj.electrostatic_model.comsol_EZ_model.bottom_points(2:end-1,:);

top_points=obj.electrostatic_model.comsol_EZ_model.top_points(2:end-1,:);

bottom_points(:,2)=bottom_points(:,2)-obj.electrostatic_model.insulator_thickness;
top_points(:,2)=top_points(:,2)+obj.electrostatic_model.insulator_thickness;

obj.electrostatic_model.comsol_EZ_model.calculate_es_force(top_points,'top');
obj.electrostatic_model.comsol_EZ_model.calculate_es_force(bottom_points,'bottom');
%%
contact_ix=obj.mechanical_model.contact_ix;
p_btm=obj.mechanical_model.bottom_plate.p(:,contact_ix:end);
p_top=obj.mechanical_model.top_plate.p(:,contact_ix:end);

[Fy,Fx,arc_len_sim]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_btm','COMSOL_bottom');

[Fy_top,Fx_top,arc_len_sim_top]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_top','COMSOL_top');
Fy_top=-Fy_top;