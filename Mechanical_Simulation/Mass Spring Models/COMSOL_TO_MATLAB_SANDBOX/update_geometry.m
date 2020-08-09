function update_geometry(model,points)
% Define new points
model.component('comp1').geom('geom1').feature('pol1').set('table', points);
% Mirror X axis 
model.component('comp1').geom('geom1').feature('mir2').set('pos', [0.049430887 0]);
% Mirror Y axis 
model.component('comp1').geom('geom1').feature('mir3').set('pos', [0 130e-6]);
% Run Geometry
model.component('comp1').geom('geom1').run;
% Run Mesh
model.component('comp1').mesh('mesh1').run;
% Edit width of model (not used)
%model.component('comp1').physics('es').prop('d').set('d', width);
end