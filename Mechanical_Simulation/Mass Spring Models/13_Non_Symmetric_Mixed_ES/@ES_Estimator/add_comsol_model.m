function add_comsol_model(obj,bottom_points,top_points)
% Adds COMSOL model
% It will probably break if all points are aligned
top_points_in_model= [top_points(1,:)+[-obj.clip_l 0];...
    top_points;...
    top_points(end,:)+[obj.base_l/2 0]];

bottom_points_in_model= [bottom_points(1,:)+[-obj.clip_l 0];...
    bottom_points;...
    bottom_points(end,:)+[obj.base_l/2 0]];

obj.comsol_EZ_model=COMSOL_ES_Model(bottom_points_in_model,top_points_in_model,...
    obj.thickness,obj.insulator_thickness,obj.sheet_width,obj.voltage);
%Make sure everything runs smoothly by calculating the force at the
%interfaces
bottom_points_interface=bottom_points;
top_points_interface=top_points;

bottom_points_interface(:,2)=bottom_points_interface(:,2)-obj.insulator_thickness;
top_points_interface(:,2)=top_points_interface(:,2)+obj.insulator_thickness;

obj.comsol_EZ_model.calculate_es_force(bottom_points_interface,top_points_interface)
% obj.comsol_EZ_model.calculate_es_force(bottom_points_interface,'bottom')
% obj.comsol_EZ_model.calculate_es_force(top_points_interface,'top')
obj.comsol_EZ_model.do_a_backup();
end