function update_model_private(obj,model)
%% GEOMETRY
% Update Points
points=obj.points;
thickness=obj.thickness;
ins_thickness=obj.insulator_thickness;
mid_point_base_x=points(end,1);

model.component('comp1').geom('geom1').feature('pol1').set('table', obj.points);

model.component('comp1').geom('geom1').feature('r5').set('size', [points(end,1)-points(1,1) ins_thickness]);
model.component('comp1').geom('geom1').feature('pt1').set('p', [0 2*ins_thickness]{'0' '2*130e-6'});
model.component('comp1').geom('geom1').feature('r6').set('pos', [points(1,1) 2*ins_thickness]);
model.component('comp1').geom('geom1').feature('r6').set('size', [points(end,1)-points(1,1) thickness]);
model.component('comp1').geom('geom1').feature('pt2').set('p', [points(1,1) 2*ins_thickness+thickness]);


model.component('comp1').geom('geom1').feature('copy3').set('disply', -obj.thickness);
model.component('comp1').geom('geom1').feature('copy5').set('disply', obj.insulator_thickness);
% Update Mirror X axis 
model.component('comp1').geom('geom1').feature('mir5').set('pos', [obj.points(end,1) 0]);
% Update Mirror Y axis 
model.component('comp1').geom('geom1').feature('mir4').set('pos', [0 obj.insulator_thickness]);
% Run Geometry
model.component('comp1').geom('geom1').run;

%% Re-Mesh
model.component('comp1').mesh('mesh1').run;
%% Redefine Physics
model.component('comp1').physics('es').prop('d').set('d', obj.sheet_width);
model.component('comp1').physics('es').feature('term3').set('V0', obj.voltage);
model.component('comp1').physics('es').feature('term4').set('V0', -obj.voltage);
%% Run Solver
model.sol('sol1').runAll;

end