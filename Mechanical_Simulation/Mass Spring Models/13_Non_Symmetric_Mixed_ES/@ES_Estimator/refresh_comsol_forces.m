function refresh_comsol_forces(obj)
% Adds COMSOL model
% It will probably break if all points are aligned
%% Update Electrostatic Force readings
bottom_points_interface=obj.comsol_EZ_model.bottom_points(2:end-1,:);
top_points_interface=obj.comsol_EZ_model.top_points(2:end-1,:);
% bottom_points_interface=bottom_points;
% top_points_interface=top_points;

bottom_points_interface(:,2)=bottom_points_interface(:,2)-obj.insulator_thickness;
top_points_interface(:,2)=top_points_interface(:,2)+obj.insulator_thickness;

obj.comsol_EZ_model.calculate_es_force(bottom_points_interface,'bottom') 
obj.comsol_EZ_model.calculate_es_force(top_points_interface,'top')
end
