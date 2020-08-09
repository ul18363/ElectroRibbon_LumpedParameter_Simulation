clear;clc;
% Get Configuration
initial_points=get_initial_configuration();

% b_points=obj.bezier_points;
x_start=initial_points(1,1);%x_start=b_points(1,1);
thickness=100e-6;% thickness=obj.thickness;
ins_thickness=130e-6;
sheet_width=0.0127;%sheet_width=obj.sheet_width;
clip_l=0.01;%clip_l=obj.clip_l;
base_l=0.01;%base_l=obj.base_l;
% gap=0;% gap=obj.gap;
voltage=6000;% voltage=obj.voltage;
x_end=initial_points(end,1);%x_end=b_points(1,end);
y_end=initial_points(end,2);%y_end=b_points(2,end);
curve_points= [initial_points(1,:)+[-clip_l 0];...
                initial_points;...
                initial_points(end,:)+[base_l/2 0]];
% Begin COMSOL & create Model
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');
model.component.create('comp1', true);
%% Generate Geometry (Done)
generate_geometry(model,curve_points,ins_thickness,thickness)
%% Generate Selections (Done)
generate_selections(model)
%% Generate Mesh (Done)
generate_mesh(model)

%% Add materials
add_material(model,'comp1','mat2','Steel AISI 4340')
add_material(model,'comp1','mat3','Transformer oil')
add_material(model,'comp1','mat4', 'PVC - Polyvinyl chloride')
%% Assign Materials
model.component('comp1').material('mat2').selection.named('electrodes');
model.component('comp1').material('mat3').selection.named('all_but_electrodes');
model.component('comp1').material('mat4').selection.named('insulator');
%%
% Add physics & View
generate_phyisics(model,6000,0.0127)
%%
model.component('comp1').view('view1').axis.set('xmin', 0.058561697602272034);
model.component('comp1').view('view1').axis.set('xmax', 0.0896071121096611);
model.component('comp1').view('view1').axis.set('ymin', -0.020082393661141396);
model.component('comp1').view('view1').axis.set('ymax', 0.01298041082918644);

%% Add Solver
generate_solver(model)
%%
mphlaunch(model)