
N=11;%scale=1.55e-4; dt=10^-6;% Succesful for N=11;M=0
M=0.02;
sht_dms=[0.45 0.0127 100e-6];
base_l=1e-2;
h.obj=Param_Estimator(sht_dms,N,'Steel AISI 4340',base_l);
obj=h.obj
obj.og_p
edges_coords=obj.og_p
width=obj.width
mass_load=obj.M
obj.M=M
mass_load=obj.M

%%
import com.comsol.model.*
import com.comsol.model.util.*
model = ModelUtil.create('MSModel');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', edges_coords);
model.component('comp1').geom('geom1').run;

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel1').set([1]);

add_material(model,'comp1','mat1','Steel AISI 4340')

% model.component('comp1').material.create('mat1', 'Common');
% model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

%% Add solid physics
model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').prop('d').set('d', width); %Add Sheet width

%% Add gravity constraint
model.component('comp1').physics('solid').create('gr1', 'Gravity', 2);
model.component('comp1').physics('solid').feature('gr1').selection.set([1]);

% Fix left end
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([1]);

% No rotation constraint
model.component('comp1').physics('solid').create('rig1', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature('rig1').selection.set(2*N);
model.component('comp1').physics('solid').feature('rig1').set('RotationType', 'PrescribedRotationGroup');

% Add Additional Mass constraint
model.component('comp1').physics('solid').create('adm1', 'AddedMass1', 1);
model.component('comp1').physics('solid').feature('adm1').selection.set(N*2);
model.component('comp1').physics('solid').feature('adm1').set('MassType', 'mTot');
model.component('comp1').physics('solid').feature('adm1').set('mTot', mass_load);

%AutoMesh
model.component('comp1').mesh('mesh1').autoMeshSize(1);

obj.define_study_and_solver(model)

obj.define_measurements(model);

obj.create_comsol_plot(model);
