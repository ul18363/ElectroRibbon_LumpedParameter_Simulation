function out = model
%
% Untitled.m
%
% Model exported on Jul 13 2020, 21:28 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Docker\Documents\Repo\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\Mechanical_Good');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', [0 2.0E-5; 0.05 2.0E-5; 0.05 0; 0 0]);
model.component('comp1').geom('geom1').run;

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel1').set([1]);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('gr1', 'Gravity', 2);
model.component('comp1').physics('solid').feature('gr1').selection.set([1]);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([1]);
model.component('comp1').physics('solid').create('rig1', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature('rig1').selection.set([4]);
model.component('comp1').physics('solid').create('adm1', 'AddedMass1', 1);
model.component('comp1').physics('solid').feature('adm1').selection.set([4]);

model.component('comp1').mesh('mesh1').autoMeshSize(1);

model.component('comp1').view('view1').axis.set('xmin', -0.0025000013411045074);
model.component('comp1').view('view1').axis.set('xmax', 0.05250000208616257);
model.component('comp1').view('view1').axis.set('ymin', -0.017093267291784286);
model.component('comp1').view('view1').axis.set('ymax', 0.01711326837539673);

model.component('comp1').material('mat1').label('Steel AISI 4340');
model.component('comp1').material('mat1').set('family', 'steel');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').descr('relpermeability_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').descr('electricconductivity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
model.component('comp1').material('mat1').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('density', '7850[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', '205e9[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', '0.28');
model.component('comp1').material('mat1').propertyGroup('Enu').descr('poissonsratio_symmetry', '');

model.component('comp1').physics('solid').prop('d').set('d', 0.0127);
model.component('comp1').physics('solid').feature('rig1').set('RotationType', 'PrescribedRotationGroup');
model.component('comp1').physics('solid').feature('adm1').set('MassType', 'mTot');
model.component('comp1').physics('solid').feature('adm1').set('mTot', [0.001875; 0; 0; 0; 0.001875; 0; 0; 0; 0.001875]);

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.numerical.create('displacements', 'Eval');
model.result.numerical('displacements').selection.named('sel1');
model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').create('line1', 'Line');
model.result('pg1').feature('line1').create('def1', 'Deform');

model.study('std1').feature('stat').set('geometricNonlinearity', true);

model.sol('sol1').attach('std1');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.10000001249999924');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.10000001249999924');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').feature('p1').active(false);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'ddog');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 1024);
model.sol('sol1').runAll;

model.result.numerical('displacements').set('expr', {'u' 'v' 'x' 'y'});
model.result.numerical('displacements').set('unit', {'m' 'm' 'm' 'm'});
model.result.numerical('displacements').set('descr', {'Displacement field, X component' 'Displacement field, Y component' 'x-coordinate' 'y-coordinate'});
model.result.numerical('displacements').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('line1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('line1').set('resolution', 'normal');
model.result('pg1').feature('line1').feature('def1').set('scaleactive', true);

out = model;
