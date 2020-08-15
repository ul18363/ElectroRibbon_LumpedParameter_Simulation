function generate_geometry(obj,model)
% generate_geometry(model,input_points,ins_thickness,thickness)
% Inputs:
% -model
% -points: Vector of size [N,2] where each row describes the x and y
% position of the curve defined by the left half interface between the 
% insulator and the electrode of the bottom sheet
% -ins_thickness: Insulator thickness in m
% -thickness: Electrode thickness in m

bottom_points=obj.bottom_points;
top_points=obj.top_points;
thickness=obj.thickness;
ins_thickness=obj.insulator_thickness;

% contact_start_x=input_points(1,1);
% contact_end_x=input_points(2,1);

model.component('comp1').geom.create('geom1', 2);



model.component('comp1').geom('geom1').create('pol1', 'Polygon');

model.component('comp1').geom('geom1').feature('pol1').label('Bottom Plate Coordinates');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table',bottom_points);
model.component('comp1').geom('geom1').create('pol2', 'Polygon');
model.component('comp1').geom('geom1').feature('pol2').label('Top Plate Coordinates');
model.component('comp1').geom('geom1').feature('pol2').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol2').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol2').set('table', top_points);

model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').set('disply', -ins_thickness);
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy5', 'Copy');
model.component('comp1').geom('geom1').feature('copy5').set('disply', -ins_thickness-thickness);
model.component('comp1').geom('geom1').feature('copy5').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy6', 'Copy');

model.component('comp1').geom('geom1').feature('copy6').set('disply', ins_thickness);
model.component('comp1').geom('geom1').feature('copy6').selection('input').set({'pol2'});
model.component('comp1').geom('geom1').create('copy7', 'Copy');
model.component('comp1').geom('geom1').feature('copy7').set('disply', ins_thickness+thickness);
model.component('comp1').geom('geom1').feature('copy7').selection('input').set({'pol2'});

model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord1', [bottom_points(1,1) bottom_points(1,2)-ins_thickness-thickness]);
model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord2', [bottom_points(1,1) bottom_points(1,2)+ins_thickness+thickness]);

model.component('comp1').geom('geom1').create('mir5', 'Mirror');
model.component('comp1').geom('geom1').feature('mir5').set('keep', true);
model.component('comp1').geom('geom1').feature('mir5').set('pos', bottom_points(end,:));
model.component('comp1').geom('geom1').feature('mir5').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir5').selection('input').set({'copy3' 'copy5' 'copy6' 'copy7' 'ls1' 'pol1' 'pol2'});
model.component('comp1').geom('geom1').create('csol5', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol5').label('bottom_metal_sheet');
model.component('comp1').geom('geom1').feature('csol5').set('keep', true);
model.component('comp1').geom('geom1').feature('csol5').selection('input').set({'copy3' 'copy5' 'ls1' 'mir5(1)' 'mir5(2)' 'mir5(5)'});
model.component('comp1').geom('geom1').create('csol4', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol4').label('bottom_insulator');
model.component('comp1').geom('geom1').feature('csol4').set('keep', true);
model.component('comp1').geom('geom1').feature('csol4').selection('input').set({'copy3' 'ls1' 'mir5(1)' 'mir5(5)' 'mir5(6)' 'pol1'});
model.component('comp1').geom('geom1').create('csol7', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol7').label('top_insulator');
model.component('comp1').geom('geom1').feature('csol7').set('keep', true);
model.component('comp1').geom('geom1').feature('csol7').selection('input').set({'copy6' 'ls1' 'mir5(3)' 'mir5(5)' 'mir5(7)' 'pol2'});
model.component('comp1').geom('geom1').create('csol6', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol6').label('top_metal_sheet');
model.component('comp1').geom('geom1').feature('csol6').set('keep', true);
model.component('comp1').geom('geom1').feature('csol6').selection('input').set({'copy6' 'copy7' 'ls1' 'mir5(3)' 'mir5(4)' 'mir5(5)'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-.1' '-.1'});
model.component('comp1').geom('geom1').feature('r4').set('size', [0.3 0.2]);
model.component('comp1').geom('geom1').create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').init;
model.component('comp1').geom('geom1').feature('del3').selection('input').set({'copy3' 'copy5' 'copy6' 'copy7' 'ls1' 'mir5' 'pol1' 'pol2'});
% 
% model.component('comp1').geom('geom1').feature('fin').label('Form Assembly');
% model.component('comp1').geom('geom1').feature('fin').set('action', 'assembly');

model.component('comp1').geom('geom1').run;
end