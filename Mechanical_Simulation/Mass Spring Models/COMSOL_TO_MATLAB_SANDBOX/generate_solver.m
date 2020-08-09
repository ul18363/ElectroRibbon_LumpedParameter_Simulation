function generate_solver(model)


model.study.create('std2');
model.study('std2').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std2');
model.sol('sol1').attach('std2');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.sol('sol1').attach('std2');
% model.sol('sol1').runAll;
end