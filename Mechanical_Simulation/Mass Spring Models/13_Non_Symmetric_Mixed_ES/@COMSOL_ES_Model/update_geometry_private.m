function update_geometry_private(obj,model)
%% GEOMETRY


bottom_points=obj.bottom_points;
top_points=obj.top_points;
thickness=obj.thickness;
ins_thickness=obj.insulator_thickness;


% Update Points
model.component('comp1').geom('geom1').feature('pol1').set('table',bottom_points);
model.component('comp1').geom('geom1').feature('pol2').set('table', top_points);

model.component('comp1').geom('geom1').feature('copy3').set('disply', -ins_thickness);
model.component('comp1').geom('geom1').feature('copy5').set('disply', -ins_thickness-thickness);
model.component('comp1').geom('geom1').feature('copy6').set('disply', ins_thickness);
model.component('comp1').geom('geom1').feature('copy7').set('disply', ins_thickness+thickness);


model.component('comp1').geom('geom1').feature('ls1').set('coord1', [bottom_points(1,1) bottom_points(1,2)-ins_thickness-thickness]);
model.component('comp1').geom('geom1').feature('ls1').set('coord2', [bottom_points(1,1) bottom_points(1,2)+ins_thickness+thickness]);

% Update Mirror X axis 
model.component('comp1').geom('geom1').feature('mir5').set('pos', bottom_points(end,:));
% Run Geometry
model.component('comp1').geom('geom1').run;


end