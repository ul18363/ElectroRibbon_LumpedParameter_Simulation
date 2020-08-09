function update_X_Symmetry_model(obj)%,model,b_points,thickness,sheet_width,clip_l,base_l,gap,voltage
model=obj.model;
b_points=obj.bezier_points;
thickness=obj.thickness;
sheet_width=obj.sheet_width;
clip_l=obj.clip_l;
base_l=obj.base_l;
gap=obj.gap;
voltage=obj.voltage;
x_start=b_points(1,1);
x_end=b_points(1,end);
y_end=b_points(2,end);
%% Update Geometry
model.component('comp1').geom('geom1').feature('cb1').set('p', b_points);
model.component('comp1').geom('geom1').feature('cb2').set('p', [b_points(1,:) ;b_points(2,:)-thickness]);
model.component('comp1').geom('geom1').feature('r2').set('pos', [-clip_l -thickness]);
model.component('comp1').geom('geom1').feature('r2').set('size', [clip_l+x_start thickness]);
model.component('comp1').geom('geom1').feature('r3').set('pos', [x_end  y_end-thickness]);
model.component('comp1').geom('geom1').feature('r3').set('size', [base_l/2 thickness]);
model.component('comp1').geom('geom1').feature('mir2').set('pos', [x_end+base_l/2 0]);
model.component('comp1').geom('geom1').run;
%% Update Physics
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2plane', gap/2);
model.component('comp1').physics('esbe').prop('d').set('d', sheet_width);
model.component('comp1').physics('esbe').feature('term1').set('V0', voltage);

%% Run model
model.sol('sol1').runAll;
end