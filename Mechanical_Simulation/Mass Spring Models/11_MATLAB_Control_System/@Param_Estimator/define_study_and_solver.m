function define_study_and_solver(~,model)

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').set('geometricNonlinearity', true);

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.sol('sol1').attach('std1');
% model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
% model.sol('sol1').feature('v1').set('cname', {'mass_load'});
% model.sol('sol1').feature('v1').set('clist', {'0[kg] 1e-3[kg] 5e-3[kg] 10e-3[kg] 20e-3[kg] 60e-3[kg] 200e-3[kg]'});
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.10000001249999924');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.10000001249999924');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
% model.sol('sol1').feature('s1').feature('p1').set('control', 'user');
% model.sol('sol1').feature('s1').feature('p1').set('pname', {'mass_load'});
% model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'{0,1e-3, 5e-3,10e-3,20e-3,60e-3,200e-3}'});
% model.sol('sol1').feature('s1').feature('p1').set('punit', {'kg'});
% model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 1024);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'ddog');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 1024);

end