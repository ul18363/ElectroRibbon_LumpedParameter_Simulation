function generate_geometry(obj,model)
% generate_geometry(model,input_points,ins_thickness,thickness)
% Inputs:
% -model
% -points: Vector of size [N,2] where each row describes the x and y
% position of the curve defined by the left half interface between the 
% insulator and the electrode of the bottom sheet
% -ins_thickness: Insulator thickness in m
% -thickness: Electrode thickness in m

points=obj.points;
thickness=obj.thickness;
ins_thickness=obj.insulator_thickness;
% mid_point_base_x=points(end,1);

% contact_start_x=input_points(1,1);
% contact_end_x=input_points(2,1);

model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', points);
model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').setIndex('disply', -thickness, 0);
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy5', 'Copy');
model.component('comp1').geom('geom1').feature('copy5').setIndex('disply', ins_thickness, 0);
model.component('comp1').geom('geom1').feature('copy5').selection('input').set({'pol1'});


model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord1', [points(1,1) points(1,2)-thickness]);
model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord2', [points(1,1) points(1,2)+ins_thickness]);

model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord1', [points(end,1) points(end,2)-thickness]);
model.component('comp1').geom('geom1').feature('ls2').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord2', [points(end,1) points(end,2)+ins_thickness]);

model.component('comp1').geom('geom1').create('r5', 'Rectangle');
model.component('comp1').geom('geom1').feature('r5').set('pos', [points(1,1) ins_thickness]);
model.component('comp1').geom('geom1').feature('r5').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r5').set('size', [points(end,1)-points(1,1) ins_thickness]);

model.component('comp1').geom('geom1').create('pt1', 'Point');
model.component('comp1').geom('geom1').feature('pt1').set('p', [points(2,1) 2*ins_thickness]);
model.component('comp1').geom('geom1').create('r6', 'Rectangle');
model.component('comp1').geom('geom1').feature('r6').set('pos', [points(1,1) 2*ins_thickness]);
model.component('comp1').geom('geom1').feature('r6').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r6').set('size', [points(end,1)-points(1,1) thickness]);

model.component('comp1').geom('geom1').create('pt2', 'Point');
model.component('comp1').geom('geom1').feature('pt2').set('p', [points(2,1) 2*ins_thickness+thickness]);

model.component('comp1').geom('geom1').create('csol5', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol5').label('bottom_metal_sheet');
model.component('comp1').geom('geom1').feature('csol5').set('keep', true);
model.component('comp1').geom('geom1').feature('csol5').selection('input').set({'copy3' 'ls1' 'ls2' 'pol1'});
model.component('comp1').geom('geom1').create('csol4', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol4').label('bottom_insulator');
model.component('comp1').geom('geom1').feature('csol4').set('keep', true);
model.component('comp1').geom('geom1').feature('csol4').selection('input').set({'copy5' 'ls1' 'ls2' 'pol1'});
model.component('comp1').geom('geom1').create('csol7', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol7').label('top_insulator');
model.component('comp1').geom('geom1').feature('csol7').set('keep', true);
model.component('comp1').geom('geom1').feature('csol7').selection('input').set({'r5'});
model.component('comp1').geom('geom1').create('csol6', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol6').label('top_metal_sheet');
model.component('comp1').geom('geom1').feature('csol6').set('keep', true);
model.component('comp1').geom('geom1').feature('csol6').selection('input').set({'r6'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-.1' '-.1'});
model.component('comp1').geom('geom1').feature('r4').set('size', [0.3 0.2]);
model.component('comp1').geom('geom1').create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').init;
model.component('comp1').geom('geom1').feature('del3').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'pol1'});
model.component('comp1').geom('geom1').run;
end