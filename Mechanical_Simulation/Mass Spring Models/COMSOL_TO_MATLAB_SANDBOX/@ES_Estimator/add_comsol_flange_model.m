function add_comsol_flange_model(obj,initial_points)
% Adds COMSOL model
% It will probably break if all points are aligned

curve_points= [initial_points(1,:)+[-obj.clip_l 0];...
    initial_points;...
    initial_points(end,:)+[obj.base_l/2 0]];

obj.comsol_flange_model=COMSOL_ES_Model_Flange(curve_points,...
    obj.thickness,obj.insulator_thickness,obj.sheet_width,obj.voltage);

obj.comsol_flange_model.calculate_es_force(initial_points)
end