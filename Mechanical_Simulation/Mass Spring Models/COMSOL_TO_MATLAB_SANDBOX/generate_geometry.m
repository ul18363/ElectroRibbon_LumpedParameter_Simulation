function generate_geometry(model,input_points,ins_thickness,thickness)
% generate_geometry(model,input_points,ins_thickness,thickness)
% Inputs:
% -model
% -input_points: Vector of size [N,2] where each row describes the x and y
% position of the curve defined by the left half interface between the 
% insulator and the electrode of the bottom sheet
% -ins_thickness: Insulator thickness in m
% -thickness: Electrode thickness in m


mid_point_base_x=input_points(end,1);

% contact_start_x=input_points(1,1);
% contact_end_x=input_points(2,1);

model.component('comp1').geom.create('geom1', 2);


model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', input_points);
model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').set('disply', -thickness);
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy5', 'Copy');
model.component('comp1').geom('geom1').feature('copy5').set('disply', ins_thickness);
model.component('comp1').geom('geom1').feature('copy5').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').selection('vertex1').set('copy3(1)', 1);
model.component('comp1').geom('geom1').feature('ls1').selection('vertex2').set('pol1(1)', 1);
model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').selection('vertex1').set('ls1(1)', 2);
model.component('comp1').geom('geom1').feature('ls2').selection('vertex2').set('copy5(1)', 1);
model.component('comp1').geom('geom1').create('mir4', 'Mirror');
model.component('comp1').geom('geom1').feature('mir4').set('keep', true);
model.component('comp1').geom('geom1').feature('mir4').set('pos', [0 ins_thickness]);
model.component('comp1').geom('geom1').feature('mir4').set('axis', [0 1]);
model.component('comp1').geom('geom1').feature('mir4').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'pol1'});
model.component('comp1').geom('geom1').create('mir5', 'Mirror');
model.component('comp1').geom('geom1').feature('mir5').set('keep', true);
model.component('comp1').geom('geom1').feature('mir5').set('pos', [mid_point_base_x 0]);
model.component('comp1').geom('geom1').feature('mir5').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir5').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'mir4' 'pol1'});
model.component('comp1').geom('geom1').create('csol5', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol5').label('bottom_metal_sheet');
model.component('comp1').geom('geom1').feature('csol5').set('keep', true);
model.component('comp1').geom('geom1').feature('csol5').selection('input').set({'copy3' 'ls1' 'mir5(1)' 'mir5(10)' 'mir5(3)' 'pol1'});
model.component('comp1').geom('geom1').create('csol4', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol4').label('bottom_insulator');
model.component('comp1').geom('geom1').feature('csol4').set('keep', true);
model.component('comp1').geom('geom1').feature('csol4').selection('input').set({'copy5' 'ls2' 'mir4(2)' 'mir5(10)' 'mir5(2)' 'mir5(4)' 'pol1'});
model.component('comp1').geom('geom1').create('csol7', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol7').label('top_insulator');
model.component('comp1').geom('geom1').feature('csol7').set('keep', true);
model.component('comp1').geom('geom1').feature('csol7').selection('input').set({'copy5' 'mir4(2)' 'mir4(4)' 'mir4(5)' 'mir5(6)' 'mir5(8)' 'mir5(9)'});
model.component('comp1').geom('geom1').create('csol6', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol6').label('top_metal_sheet');
model.component('comp1').geom('geom1').feature('csol6').set('keep', true);
model.component('comp1').geom('geom1').feature('csol6').selection('input').set({'mir4(1)' 'mir4(3)' 'mir4(5)' 'mir5(5)' 'mir5(7)' 'mir5(9)'});
model.component('comp1').geom('geom1').create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').init;
model.component('comp1').geom('geom1').feature('del3').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'mir4' 'mir5' 'pol1'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-.1' '-.1'});
model.component('comp1').geom('geom1').feature('r4').set('size', [0.3 0.2]);
model.component('comp1').geom('geom1').run;
end