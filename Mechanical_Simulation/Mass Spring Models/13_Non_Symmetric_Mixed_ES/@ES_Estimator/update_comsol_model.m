function update_comsol_model(obj,bottom_points,top_points)
% Adds COMSOL model
% It will probably break if all points are aligned
top_points= [top_points(1,:)+[-obj.clip_l 0];...
    top_points;...
    top_points(end,:)+[obj.base_l/2 0]];

bottom_points= [bottom_points(1,:)+[-obj.clip_l 0];...
    bottom_points;...
    bottom_points(end,:)+[obj.base_l/2 0]];

obj.comsol_EZ_model.thickness=obj.thickness;
obj.comsol_EZ_model.insulator_thickness=obj.thickness;
obj.comsol_EZ_model.voltage=obj.voltage;
obj.comsol_EZ_model.sheet_width=obj.sheet_width;
obj.comsol_EZ_model.voltage=obj.voltage;

obj.comsol_EZ_model.bottom_points=bottom_points;
obj.comsol_EZ_model.top_points=top_points;

obj.comsol_EZ_model.update_model();
end
