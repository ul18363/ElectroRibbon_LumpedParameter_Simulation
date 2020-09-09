function model=generate_model(obj)
% Begin COMSOL & create Model
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');
model.component.create('comp1', true);


obj.generate_geometry(model)  % Generate Geometry (Done)
obj.generate_selections(model)% Generate Selections (Done)
obj.generate_mesh(model)      % Generate Mesh (Done)
% Add materials
obj.add_material(model,'comp1','mat2','Steel AISI 4340')
obj.add_material(model,'comp1','mat3','Transformer oil')
obj.add_material(model,'comp1','mat4', 'PVC - Polyvinyl chloride')
% Assign Materials
model.component('comp1').material('mat2').selection.named('electrodes');
model.component('comp1').material('mat3').selection.named('all_but_electrodes');
model.component('comp1').material('mat4').selection.named('insulator');
obj.generate_phyisics(model)% Add physics
%View
model.component('comp1').view('view1').axis.set('xmin', 0.058561697602272034);
model.component('comp1').view('view1').axis.set('xmax', 0.0896071121096611);
model.component('comp1').view('view1').axis.set('ymin', -0.020082393661141396);
model.component('comp1').view('view1').axis.set('ymax', 0.01298041082918644);
obj.generate_solver(model) % Add Solver
end
