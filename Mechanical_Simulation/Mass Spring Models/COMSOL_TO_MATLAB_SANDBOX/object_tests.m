clear;clc;
initial_points=get_initial_configuration();
thickness=100e-6;
insulator_thickness=130e-6;
sheet_width=0.0127;
clip_l=0.01;
base_l=0.01;
voltage=6000;
curve_points= [initial_points(1,:)+[-clip_l 0];...
                initial_points;...
                initial_points(end,:)+[base_l/2 0]];
            
obj=COMSOL_ES_Model(curve_points,thickness,insulator_thickness,sheet_width,voltage);
%%

obj.calculate_es_force(initial_points)
