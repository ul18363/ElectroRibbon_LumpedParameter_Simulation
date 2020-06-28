function out = model
%
% ez_actuator_no_results_updated_2.m
%
% Model exported on Jun 25 2020, 11:37 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/COMSOL outsorced modelling/Try 1/comsol files');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').activate('solid', true);

model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' '1e-3'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' '50e-6'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' '50e-6'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'0.2' '25e-6'});
model.component('comp1').geom('geom1').run('r2');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat1').label('Nylon');
model.component('comp1').material('mat1').set('family', 'custom');
model.component('comp1').material('mat1').set('specular', 'custom');
model.component('comp1').material('mat1').set('customspecular', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('diffuse', 'custom');
model.component('comp1').material('mat1').set('customdiffuse', [0.39215686274509803 0.39215686274509803 0.9803921568627451]);
model.component('comp1').material('mat1').set('ambient', 'custom');
model.component('comp1').material('mat1').set('customambient', [0.39215686274509803 0.39215686274509803 0.7843137254901961]);
model.component('comp1').material('mat1').set('noise', true);
model.component('comp1').material('mat1').set('noisefreq', 1);
model.component('comp1').material('mat1').set('lighting', 'phong');
model.component('comp1').material('mat1').set('shininess', 500);
model.component('comp1').material('mat1').set('groups', {'polymers' 'Polymers'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'280e-6[1/K]' '0' '0' '0' '280e-6[1/K]' '0' '0' '0' '280e-6[1/K]'});
model.component('comp1').material('mat1').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '1700[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'4' '0' '0' '0' '4' '0' '0' '0' '4'});
model.component('comp1').material('mat1').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('density', '1150[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'0.26[W/(m*K)]' '0' '0' '0' '0.26[W/(m*K)]' '0' '0' '0' '0.26[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', '2e9[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat1').propertyGroup('Enu').descr('poissonsratio_symmetry', '');
model.component('comp1').material('mat1').set('groups', {});
model.component('comp1').material('mat1').set('family', 'custom');
model.component('comp1').material('mat1').set('lighting', 'phong');
model.component('comp1').material('mat1').set('shininess', 500);
model.component('comp1').material('mat1').set('ambient', 'custom');
model.component('comp1').material('mat1').set('customambient', [0.39215686274509803 0.39215686274509803 0.7843137254901961]);
model.component('comp1').material('mat1').set('diffuse', 'custom');
model.component('comp1').material('mat1').set('customdiffuse', [0.39215686274509803 0.39215686274509803 0.9803921568627451]);
model.component('comp1').material('mat1').set('specular', 'custom');
model.component('comp1').material('mat1').set('customspecular', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('noisescale', 0);
model.component('comp1').material('mat1').set('noise', 'on');
model.component('comp1').material('mat1').set('noisefreq', 1);
model.component('comp1').material('mat1').set('noise', 'on');
model.component('comp1').material('mat1').set('alpha', 1);

model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').label('Steel AISI 4340');
model.component('comp1').material('mat2').set('family', 'steel');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').descr('relpermeability_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('electricconductivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('density', '7850[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('Enu').set('youngsmodulus', '205e9[Pa]');
model.component('comp1').material('mat2').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat2').propertyGroup('Enu').set('poissonsratio', '0.28');
model.component('comp1').material('mat2').propertyGroup('Enu').descr('poissonsratio_symmetry', '');
model.component('comp1').material('mat2').set('groups', {});
model.component('comp1').material('mat2').set('family', 'steel');
model.component('comp1').material('mat2').selection.set([1]);
model.component('comp1').material.move('mat2', 0);
model.component('comp1').material('mat1').selection.set([1]);
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', {'0.23'});

model.component('comp1').pair.create('p1', 'Identity');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').label('metal_sheet');
model.component('comp1').selection('sel1').set([1]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').label('nylon_sheet');
model.component('comp1').selection('sel2').set([2]);

model.component('comp1').pair('p1').source.set([4]);
model.component('comp1').pair('p1').destination.set([4]);

model.component('comp1').physics('solid').create('roll1', 'Roller', 1);
model.component('comp1').physics('solid').feature.remove('roll1');
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([1]);
model.component('comp1').physics('solid').feature('fix1').active(false);
model.component('comp1').physics('solid').create('roll1', 'Roller', 1);
model.component('comp1').physics('solid').feature('roll1').selection.set([1]);
model.component('comp1').physics('solid').feature('roll1').set('NormalChoice', 'AnalyticalPlane');
model.component('comp1').physics('solid').feature('roll1').selection.set([1 6]);
model.component('comp1').physics('solid').feature('roll1').set('NormalAxis', 'yAxis');
model.component('comp1').physics('solid').create('gr1', 'Gravity', 2);
model.component('comp1').physics('solid').feature('gr1').selection.set([1 2]);

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup.create('dset1solidlgrp', 'Results');
model.nodeGroup('dset1solidlgrp').label('Applied Loads (solid)');
model.nodeGroup('dset1solidlgrp').set('type', 'plotgroup');
model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 0);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 0);
model.result.remove('pg2');
model.result.remove('pg1');

model.component('comp1').material.move('mat2', 1);
model.component('comp1').material('mat1').selection.set([1 2]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 0);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 0);
model.result.remove('pg2');
model.result.remove('pg1');

model.component('comp1').physics('solid').feature('roll1').set('NormalAxis', 'xAxis');

model.component('comp1').mesh('mesh1').create('map1', 'Map');
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 3);
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('map1').selection.set([1 2]);
model.component('comp1').mesh('mesh1').feature('map1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hauto', 2);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hauto', 1);
model.component('comp1').mesh('mesh1').run('map1');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 0);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 0);
model.result.remove('pg2');
model.result.remove('pg1');

model.component('comp1').mesh('mesh1').feature('map1').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').selection.set([1]);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').selection.set([1 3]);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').create('dis2', 'Distribution');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').selection.set([4]);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('type', 'predefined');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('elemcount', 500);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('elemcount', 1000);
model.component('comp1').mesh('mesh1').run('map1');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 0);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 0);
model.result.remove('pg2');
model.result.remove('pg1');

model.component('comp1').mesh('mesh1').run;

model.sol('sol1').updateSolution;

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').run;
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').create('def1', 'Deform');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').physics('solid').feature('roll1').set('NormalAxis', 'yAxis');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('solid').feature('roll1').active(false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('solid').feature('fix1').active(true);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').geom('geom1').feature('r1').active(false);
model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').mesh('mesh1').feature('map1').active(false);

model.component('comp1').geom('geom1').feature('r1').active(true);
model.component('comp1').geom('geom1').feature('r2').active(false);
model.component('comp1').geom('geom1').run;

model.component('comp1').material.move('mat2', 0);
model.component('comp1').material('mat1').selection.set([]);
model.component('comp1').material('mat2').selection.set([1]);
model.component('comp1').material('mat1').active(false);

model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').automatic(true);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').physics('solid').feature('fix1').selection.set([1]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('geometricNonlinearity', true);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').feature('def1').set('scaleactive', true);
model.result('pg1').feature('surf1').feature('def1').set('scale', 1);
model.result('pg1').run;
model.result('pg1').run;
model.result.create('pg2', 'PlotGroup1D');
model.result('pg2').run;
model.result('pg2').create('lngr1', 'LineGraph');
model.result('pg2').feature('lngr1').selection.set([3]);
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').create('lngr2', 'LineGraph');
model.result('pg2').feature('lngr2').set('expr', 'v');
model.result('pg2').feature('lngr2').set('descr', 'Displacement field, Y component');
model.result('pg2').feature('lngr2').set('xdata', 'expr');
model.result('pg2').feature('lngr2').set('xdataexpr', 'u');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').create('line1', 'Line');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').active(false);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').create('def1', 'Deform');
model.result('pg1').run;
model.result('pg1').feature('line1').feature('def1').set('scaleactive', true);
model.result('pg1').feature('line1').feature('def1').set('scale', 1);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('lngr2').set('xdata', 'arc');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('lngr2').selection.set([3]);
model.result('pg2').run;
model.result('pg2').feature('lngr2').set('linewidth', 1);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').set('inheritrange', true);
model.result('pg1').feature('line1').set('resolution', 'finer');
model.result('pg1').run;
model.result('pg1').feature('line1').set('linetype', 'tube');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').set('radiusexpr', '2');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').set('linetype', 'line');
model.result('pg1').feature('line1').set('data', 'parent');
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').physics('solid').feature('roll1').active(true);
model.component('comp1').physics('solid').feature('roll1').selection.set([4]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('solid').feature('roll1').set('NormalAxis', 'xAxis');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').physics('solid').feature('gr1').set('g', {'0' 'g_const' '0'});

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('gr1').set('g', {'0' '-g_const' '0'});
model.component('comp1').physics('solid').feature('roll1').set('NormalChoice', 'AlongNormal');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('lngr1').active(false);
model.result('pg2').run;
model.result('pg1').run;

model.component('comp1').physics('solid').feature('roll1').active(false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;

model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' '1e-3'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' '0.5e-3'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' '0.1e-3'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').pair('p1').active(false);

model.component('comp1').selection('sel2').remove([1]);
model.component('comp1').selection('sel1').set([1]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').mesh('mesh1').autoMeshSize(2);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.param.set('thickness', '30e-6[m]');
model.param.descr('thickness', 'thickness of metal sheet');

model.component('comp1').geom('geom1').feature('r1').set('size', {'0.2' 'thickness'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run;

model.study('std1').feature('stat').set('useparam', true);
model.study('std1').feature('stat').setIndex('pname', 'thickness', 0);
model.study('std1').feature('stat').setIndex('plistarr', '', 0);
model.study('std1').feature('stat').setIndex('punit', 'm', 0);
model.study('std1').feature('stat').setIndex('pname', 'thickness', 0);
model.study('std1').feature('stat').setIndex('plistarr', '', 0);
model.study('std1').feature('stat').setIndex('punit', 'm', 0);
model.study('std1').feature('stat').setIndex('plistarr', '10^{range(log10(1),-(1/5),log10(1.0e-4))}', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('control', 'stat');
model.sol('sol1').feature('s1').set('control', 'stat');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').run;

model.study('std1').feature('stat').setIndex('plistarr', '10^{range(log10(0.001),-(1/5),log10(1.0e-5))}', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('control', 'stat');
model.sol('sol1').feature('s1').set('control', 'stat');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result('pg1').run;
model.result('pg1').run;

model.param.set('thickness', '300e-6[m]');

model.study('std1').feature('stat').set('useparam', false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').material.remove('mat1');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('useadvanceddisable', false);

model.component('comp1').physics('solid').feature('lemm1').set('MixedFormulation', 'eFormulation');
model.component('comp1').physics('solid').feature('lemm1').set('AdditiveStrainDecomposition', true);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').create('cr1', 'CornerRefinement');
model.component('comp1').mesh('mesh1').feature('cr1').selection('boundary').set([3]);
model.component('comp1').mesh('mesh1').run('cr1');
model.component('comp1').mesh('mesh1').feature.remove('cr1');
model.component('comp1').mesh('mesh1').automatic(true);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.param.set('thickness', '3000e-6[m]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('thickness', '1000e-6[m]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('thickness', '500e-6[m]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('thickness', '400e-6[m]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('thickness', '350e-6[m]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('useinitsol', true);
model.study('std1').feature('stat').set('initstudy', 'std1');
model.study('std1').feature('stat').set('usesol', false);
model.study('std1').feature('stat').set('initmethod', 'sol');
model.study('std1').feature('stat').set('plot', true);
model.study('std1').feature('stat').set('useinitsol', false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').pair.remove('p1');

model.component('comp1').selection.remove('sel2');

model.component('comp1').physics('solid').feature.remove('roll1');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('geometricNonlinearity', false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('thickness', '200e-6[m]');

model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.param.set('thickness', '70e-6[m]');
model.param.set('length', '100e-3[m]');
model.param.descr('length', 'length of');
model.param.descr('length', 'length of metal sheet');

model.component('comp1').geom('geom1').feature('r2').set('size', {'length' '25e-6'});
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('r1').set('size', {'length' 'thickness'});
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('geometricNonlinearity', true);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 500);
model.sol('sol1').run('s1');

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').physics('solid').create('roll1', 'Roller', 1);
model.component('comp1').physics('solid').feature('roll1').selection.set([4]);
model.component('comp1').physics('solid').feature('roll1').set('NormalChoice', 'AnalyticalPlane');

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('roll1').set('NormalAxis', 'yAxis');

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').create('bndl1', 'BoundaryLoad', 1);
model.component('comp1').physics('solid').feature('bndl1').selection.set([2]);

model.param.set('load', '6e-3*g_const [N]');
model.param.set('weight_mas', '6e-3 [kg]');
model.param.set('load', 'weight_mas*g_const');
model.param.descr('load', 'load');
model.param.set('base_widt', '1e-2[m]');
model.param.descr('base_widt', 'platform where load is placed');
model.param.descr('weight_mas', 'mass of the hanging weight');
model.param.descr('weight_mas', 'flat');

model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').create('pt1', 'Point');

model.param.rename('base_widt', 'base_width');

model.component('comp1').geom('geom1').feature('pt1').setIndex('p', 'length/2+', 0);
model.component('comp1').geom('geom1').feature('pt1').setIndex('p', 'length/2-base_width/2', 0);
model.component('comp1').geom('geom1').run('pt1');
model.component('comp1').geom('geom1').feature.duplicate('pt2', 'pt1');
model.component('comp1').geom('geom1').feature('pt2').setIndex('p', 'length/2+base_width/2', 0);
model.component('comp1').geom('geom1').run('pt2');
model.component('comp1').geom('geom1').run;

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('bndl1').selection.set([4]);
model.component('comp1').physics('solid').feature('bndl1').set('FperArea', {'0' '-load' '0'});
model.component('comp1').physics('solid').create('fix2', 'PairFixed', 1);
model.component('comp1').physics('solid').feature.remove('fix2');
model.component('comp1').physics('solid').create('rig1', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature('rig1').selection.set([4]);
model.component('comp1').physics('solid').feature('rig1').set('RotationType', 'FreeGroup');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('lngr1').active(true);
model.result('pg2').run;
model.result('pg2').feature('lngr1').active(false);
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result.create('pg3', 'PlotGroup1D');
model.result('pg3').run;
model.result('pg3').create('lngr1', 'LineGraph');
model.result('pg3').feature('lngr1').selection.set([4]);
model.result('pg3').feature('lngr1').set('expr', 'v');
model.result('pg3').feature('lngr1').set('descr', 'Displacement field, Y component');
model.result('pg3').run;

model.component('comp1').physics('solid').feature('rig1').set('RotationType', 'PrescribedRotationGroup');

model.result('pg3').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg1').run;

model.sol('sol1').feature('s1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', false);
model.sol('sol1').run('s1');

model.result('pg1').run;

model.sol('sol1').feature('s1').feature('fc1').set('termonres', true);
model.sol('sol1').run('s1');

model.result('pg1').run;

model.component('comp1').view('view1').set('showgrid', true);

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').active(true);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').set('rangedataactive', true);
model.result('pg1').feature('surf1').set('rangedatamin', 0);
model.result('pg1').feature('surf1').set('rangedataactive', false);
model.result('pg1').feature('surf1').set('rangecoloractive', true);
model.result('pg1').feature('surf1').set('rangedataactive', true);
model.result('pg1').feature('surf1').set('rangecoloractive', false);
model.result('pg1').feature('surf1').set('rangedatamin', 3.09E-4);
model.result('pg1').run;

model.param.set('weight_mas', '20e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('weight_mas', '100e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').set('expr', 'solid.misesGp');
model.result('pg1').feature('line1').set('descr', 'von Mises stress, Gauss point evaluation');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').set('rangedataactive', false);
model.result('pg1').run;

model.param.set('weight_mas', '1000e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;

model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').run('s1');

model.result('pg1').run;

model.param.set('thickness', '35e-6[m]');

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').label('Polyethylene');
model.component('comp1').material('mat3').set('groups', {'polymers' 'Polymers'});
model.component('comp1').material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', {'150e-6[1/K]' '0' '0' '0' '150e-6[1/K]' '0' '0' '0' '150e-6[1/K]'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', '1900[J/(kg*K)]');
model.component('comp1').material('mat3').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'2.3' '0' '0' '0' '2.3' '0' '0' '0' '2.3'});
model.component('comp1').material('mat3').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('density', '930[kg/m^3]');
model.component('comp1').material('mat3').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'0.38[W/(m*K)]' '0' '0' '0' '0.38[W/(m*K)]' '0' '0' '0' '0.38[W/(m*K)]'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('Enu').set('youngsmodulus', '1e9[Pa]');
model.component('comp1').material('mat3').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('Enu').descr('poissonsratio_symmetry', '');
model.component('comp1').material('mat3').set('groups', {});
model.component('comp1').material('mat3').set('family', 'plastic');
model.component('comp1').material('mat2').active(false);
model.component('comp1').material('mat3').selection.set([1]);

model.component('comp1').physics('solid').feature('lemm1').set('SolidModel', 'Isotropic');
model.component('comp1').physics('solid').feature('lemm1').set('MixedFormulation', 'none');
model.component('comp1').physics('solid').feature('lemm1').set('IsotropicOption', 'Enu');

model.component('comp1').material('mat3').propertyGroup('Enu').set('poissonsratio', {'0.46'});

model.param.set('weight_mas', '6e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;

model.label('flange_metallic.mph');

model.result('pg1').run;

model.component('comp1').material('mat3').active(false);
model.component('comp1').material('mat2').active(true);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').set('expr', 'v');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').active(false);
model.result('pg1').run;
model.result('pg1').feature('line1').active(true);
model.result('pg1').run;
model.result('pg1').feature('line1').set('expr', 'v');
model.result('pg1').run;

model.param.set('thickness', '70e-6[m]');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg2').run;

model.component('comp1').physics('solid').create('fix2', 'Fixed', 1);
model.component('comp1').physics('solid').create('rig2', 'PairRigidConnector', 1);
model.component('comp1').physics('solid').feature('rig2').set('RotationType', 'ConstrainedRotationGroup');
model.component('comp1').physics('solid').feature('rig2').setIndex('Direction', true, 1);
model.component('comp1').physics('solid').feature('roll1').active(false);
model.component('comp1').physics('solid').feature('fix2').active(false);

model.component('comp1').pair.create('p1', 'Contact');

model.component('comp1').physics('solid').feature.move('rig2', 7);
model.component('comp1').physics('solid').feature('rig2').active(false);
model.component('comp1').physics('solid').create('fix3', 'Fixed', 1);
model.component('comp1').physics('solid').feature.remove('fix3');
model.component('comp1').physics('solid').feature.remove('fix2');
model.component('comp1').physics('solid').feature.remove('rig2');
model.component('comp1').physics('solid').feature('rig1').selection.set([4 6]);
model.component('comp1').physics('solid').feature('roll1').active(true);
model.component('comp1').physics('solid').feature.duplicate('rig2', 'rig1');
model.component('comp1').physics('solid').feature('rig2').selection.remove([4]);
model.component('comp1').physics('solid').feature('rig1').selection.remove([6]);
model.component('comp1').physics('solid').feature('rig2').active(false);

model.component('comp1').pair.remove('p1');

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('rig2').active(true);

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('rig2').setIndex('Direction', true, 1);

model.result('pg1').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg2').run;

model.param.set('weight_mas', '20e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('linewidth', 1);
model.result('pg3').run;
model.result.dataset.create('cln1', 'CutLine2D');
model.result.dataset('cln1').set('data', 'dset1');
model.result('pg3').feature('lngr1').set('cutline', 'cln1');
model.result('pg3').feature('lngr1').set('linefirst', [0.05000000074505806 0 0]);
model.result('pg3').feature('lngr1').set('linesecond', [0.05000000074505806 7.000000186963007E-5 0]);
model.result('pg3').feature('lngr1').set('lineisinit', true);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [0.05000000000000001 0; 0.05000000000000001 6.99999E-5]);
model.result('pg3').feature('lngr1').set('cutmode', true);
model.result('pg3').feature('lngr1').set('listen', false);
model.result('pg3').feature('lngr1').set('data', 'cln1');
model.result('pg3').feature('lngr1').set('listen', true);
model.result('pg3').feature('lngr1').set('cutmode', 'off');
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('data', 'dset1');
model.result('pg3').feature('lngr1').selection.set([4]);
model.result('pg3').run;
model.result('pg3').feature('lngr1').set('autodescr', false);
model.result('pg3').feature('lngr1').set('autounit', true);
model.result('pg3').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').set('axislimits', true);
model.result('pg3').set('ymin', 0);
model.result('pg3').set('ymax', 1);
model.result('pg3').run;
model.result('pg3').set('ymax', -1);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('ymin', -1);
model.result('pg3').set('ymax', 0);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.1);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.001);
model.result('pg3').run;
model.result('pg3').set('ymax', -0.001);
model.result('pg3').set('ymin', -0.002);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.01);
model.result('pg3').run;
model.result('pg3').set('ymax', -0.02);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.018);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.015);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.018);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.01);
model.result('pg3').run;
model.result('pg3').set('ymin', -0.02);
model.result('pg3').set('ymax', -0.01);
model.result('pg3').run;
model.result('pg3').set('ymax', '-0.00');
model.result('pg3').run;
model.result('pg3').set('ymin', -0.002);
model.result('pg3').run;
model.result('pg3').set('ymin', '-0.0002');
model.result('pg3').run;
model.result('pg3').set('ymax', '-0.00016');
model.result('pg3').run;
model.result('pg3').set('ymin', '-0.00018');
model.result('pg3').set('ymax', '-0.000175');
model.result('pg3').run;
model.result('pg3').set('ymax', '-0.000178');
model.result('pg3').set('ymin', '-0.0001785');
model.result('pg3').run;
model.result('pg3').set('ymin', '-1.7825e-4');
model.result('pg3').set('ymax', '-1.783e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.7825e-4');
model.result('pg3').set('ymin', '-1.783e-4');
model.result('pg3').run;
model.result('pg3').set('ymin', '-1.783e-5');
model.result('pg3').set('ymax', '-1.7825e-5');
model.result('pg3').run;
model.result('pg3').set('ymax', 0);
model.result('pg3').run;
model.result('pg3').set('ymin', '-1.783e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.782e-4');
model.result('pg3').run;
model.result('pg3').set('ymin', '-1.7825e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.7824e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.7823e-4');
model.result('pg3').run;
model.result('pg3').set('manualgrid', true);
model.result('pg3').set('yspacing', '1e-5');
model.result('pg3').run;
model.result('pg3').set('yspacing', '1e-6');
model.result('pg3').run;
model.result('pg3').set('showgrid', true);
model.result('pg3').set('yspacing', 1);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('showgrid', true);
model.result('pg3').set('manualgrid', false);
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.7824e-4');
model.result('pg3').run;
model.result('pg3').set('manualgrid', true);
model.result('pg3').run;
model.result('pg3').run;
model.result('pg3').set('xspacing', '0.0001');
model.result('pg3').run;
model.result('pg3').set('yspacing', '0.00001');
model.result('pg3').run;
model.result('pg3').set('yspacing', '0.000001');
model.result('pg3').run;
model.result('pg3').set('yspacing', '0.0000001');
model.result('pg3').run;
model.result('pg3').set('yspacing', '');
model.result('pg3').set('ymin', '-1.7826e-4');
model.result('pg3').set('manualgrid', false);
model.result('pg3').run;
model.result('pg3').set('ymin', '-1.7825e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.78245e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.78247e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.78248e-4');
model.result('pg3').run;
model.result('pg3').set('ymax', '-1.7823e-4');
model.result('pg3').run;
model.result('pg3').label('Central plate deformation');
model.result('pg2').run;
model.result('pg2').label('overall sheet deformation');

model.study('std1').feature('stat').set('useparam', true);
model.study('std1').feature('stat').setIndex('pname', 'load', 0);
model.study('std1').feature('stat').setIndex('plistarr', '0,6,10,20,50,100,200,500,750,1000', 0);

model.sol('sol1').runAll;

model.result('pg1').run;

model.study('std1').feature('stat').setIndex('plistarr', '0,6,10,20,50,100,200,500,750,1000,1500,2000,3000', 0);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').feature('lngr2').set('legend', true);
model.result('pg2').feature('lngr2').set('legendmethod', 'automatic');
model.result('pg2').feature('lngr2').set('unit', 'cm');
model.result('pg2').run;
model.result('pg2').feature('lngr2').set('legendmethod', 'manual');
model.result('pg1').run;
model.result('pg3').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').set('window', 'new');
model.result('pg1').set('windowtitle', 'Graphics');
model.result('pg3').set('windowtitle', 'Graphics');
model.result('pg2').set('window', 'window1');
model.result('pg2').set('windowtitle', 'Plot 1');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.label('flange_metallic2.mph');

model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').physics('solid').prop('d').set('d', '27e-3');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').run;

model.label('flange_metallic2.mph');

model.result('pg1').run;

model.component('comp1').physics('solid').prop('d').set('d', '12.7e-3');

model.param.set('weight_mas', '45e-3 [kg]');
model.param.set('thickness', '100e-6[m]');

model.study('std1').feature('stat').set('useparam', false);

model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('width', '12.7e-3[m]');
model.param.descr('width', 'width of metal sheet');

model.component('comp1').physics('solid').feature.duplicate('rig3', 'rig2');
model.component('comp1').physics('solid').feature('rig3').selection.set([1]);
model.component('comp1').physics('solid').feature('rig3').set('RotationType', 'FreeGroup');
model.component('comp1').physics('solid').feature('rig2').set('RotationType', 'FreeGroup');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg3').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.study('std1').feature('stat').set('geometricNonlinearity', false);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.study('std1').feature('stat').set('geometricNonlinearity', true);

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature('bndl1').set('LoadType', 'TotalForce');
model.component('comp1').physics('solid').feature('bndl1').set('Ftot', {'0' '-load' '0'});

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature.duplicate('rig4', 'rig2');
model.component('comp1').physics('solid').feature('rig3').setIndex('Direction', true, 0);
model.component('comp1').physics('solid').feature('rig3').label('Free_rotation_left_end_condition');
model.component('comp1').physics('solid').feature('rig3').active(false);
model.component('comp1').physics('solid').feature('rig4').label('Free_rotation_sliding_right');
model.component('comp1').physics('solid').feature('rig4').active(false);
model.component('comp1').physics('solid').feature('rig2').label('Not rotation sliding right');
model.component('comp1').physics('solid').feature('rig2').set('RotationType', 'PrescribedRotationGroup');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').physics('solid').feature('rig3').active(true);
model.component('comp1').physics('solid').feature('rig4').active(true);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.label('flange_metallic3.mph');

model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').geom('geom1').run('pt2');
model.component('comp1').geom('geom1').create('mir1', 'Mirror');
model.component('comp1').geom('geom1').feature('mir1').selection('input').set({'r1'});
model.component('comp1').geom('geom1').feature('mir1').set('pos', {'0' 'thickness'});
model.component('comp1').geom('geom1').run('mir1');
model.component('comp1').geom('geom1').feature('mir1').set('keep', true);
model.component('comp1').geom('geom1').run('mir1');
model.component('comp1').geom('geom1').feature('mir1').set('axis', [0 1]);
model.component('comp1').geom('geom1').run('mir1');
model.component('comp1').geom('geom1').feature.duplicate('pt3', 'pt1');
model.component('comp1').geom('geom1').feature.duplicate('pt4', 'pt2');
model.component('comp1').geom('geom1').feature('pt4').setIndex('p', '2*thickness', 1);
model.component('comp1').geom('geom1').feature('pt3').setIndex('p', '2*thickness', 1);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').physics('solid').feature('fix1').label('fixed_left_edge');
model.component('comp1').physics('solid').feature.move('fix1', 4);

model.param.set('over_hang', '5e-3[m]');
model.param.descr('over_hang', 'length of sheet after contact point');

model.component('comp1').selection('sel1').label('metal_sheets');

model.component('comp1').geom('geom1').feature('pt1').label('Bottom_platform_left');
model.component('comp1').geom('geom1').feature('pt2').label('Bottom_platform_right');
model.component('comp1').geom('geom1').feature('pt4').label('Top_platform_right');
model.component('comp1').geom('geom1').feature('pt3').label('Top_platform_left');
model.component('comp1').geom('geom1').feature.duplicate('pt5', 'pt4');
model.component('comp1').geom('geom1').feature('pt5').label('Left_clip');
model.component('comp1').geom('geom1').feature('pt5').setIndex('p', 0, 0);
model.component('comp1').geom('geom1').feature('pt5').setIndex('p', 'thickness', 1);
model.component('comp1').geom('geom1').feature('pt5').setIndex('p', 'over_hang', 0);
model.component('comp1').geom('geom1').run('pt5');
model.component('comp1').geom('geom1').feature.duplicate('pt6', 'pt5');
model.component('comp1').geom('geom1').feature('pt6').setIndex('p', 'length-over_hang', 0);
model.component('comp1').geom('geom1').run('pt6');
model.component('comp1').geom('geom1').feature('pt6').label('Right_clip');

model.component('comp1').pair.create('p1', 'Identity');

model.component('comp1').geom('geom1').run;

model.component('comp1').pair('p1').source.set([4]);
model.component('comp1').pair('p1').label('Left Clip');
model.component('comp1').pair.duplicate('p2', 'p1');
model.component('comp1').pair('p2').label('Right Clip');
model.component('comp1').pair('p2').source.set([11]);

model.param.set('length', '100e-3[m]+2*over_hang');

model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').physics('solid').feature('fix1').active(false);
model.component('comp1').physics('solid').feature('roll1').active(false);
model.component('comp1').physics('solid').feature('bndl1').active(false);
model.component('comp1').physics('solid').feature('rig1').active(false);
model.component('comp1').physics('solid').feature('rig2').active(false);
model.component('comp1').physics('solid').feature('rig3').active(false);
model.component('comp1').physics('solid').feature('rig4').active(false);
model.component('comp1').physics('solid').create('fix2', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix2').selection.set([8]);
model.component('comp1').physics('solid').feature('fix2').label('Top_base');

model.component('comp1').common.create('pres1', 'PrescribedDeformation');
model.component('comp1').common.remove('pres1');

model.component('comp1').pair('p1').destination.set([4]);
model.component('comp1').pair('p2').destination.set([11]);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg3').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').physics('solid').feature('bndl1').label('Load');
model.component('comp1').physics('solid').feature('bndl1').active(true);
model.component('comp1').physics('solid').feature.move('fix2', 4);

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').create('rig5', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature('rig5').selection.set([4 11]);
model.component('comp1').physics('solid').feature.remove('rig5');

model.component('comp1').view('view1').hideObjects.create('hide1');
model.component('comp1').view('view1').hideObjects('hide1').init;
model.component('comp1').view('view1').hideObjects('hide1').add({'mir1'});

model.component('comp1').pair('p1').destination.remove([4]);

model.component('comp1').view('view1').set('hidestatus', 'showonlyhidden');

model.component('comp1').pair('p1').destination.set([]);

model.component('comp1').view('view1').set('hidestatus', 'ignore');
model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideEntities.clear;
model.component('comp1').view('view1').hideMesh.clear;

model.component('comp1').pair('p1').type('Contact');
model.component('comp1').pair('p1').type('Identity');
model.component('comp1').pair('p2').destination.remove([11]);
model.component('comp1').pair('p2').type('Contact');
model.component('comp1').pair('p2').type('Identity');

model.label('ez_actuator.mph');

model.component('comp1').pair('p1').active(false);
model.component('comp1').pair('p2').active(false);

model.component('comp1').physics('solid').create('free2', 'Free', 1);
model.component('comp1').physics('solid').feature('free2').selection.set([6]);
model.component('comp1').physics('solid').feature('free2').label('Middle_Free');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature.duplicate('lngr3', 'lngr2');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr3').selection.set([2 4 6 11]);
model.result('pg3').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').feature('lngr3').label('Bottom layer');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr2').label('Upper Layer');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr3').selection.set([2 7 9]);
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr2').selection.set([]);
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr2').selection.set([5 8 10]);
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr2').set('legend', false);
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr3').set('legend', false);
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('legendpos', 'manual');
model.result('pg2').set('showlegends', false);

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').geom('geom1').feature('r2').active(true);
model.component('comp1').geom('geom1').feature('r2').active(false);
model.component('comp1').geom('geom1').feature('r2').set('size', {'length' 'thickness'});
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 'thickness'});
model.component('comp1').geom('geom1').feature('mir1').active(false);
model.component('comp1').geom('geom1').feature('r2').active(true);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('pt1');
model.component('comp1').geom('geom1').run('pt2');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('weight_mas', '1000e-3 [kg]');

model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').geom('geom1').feature('fin').set('action', 'assembly');
model.component('comp1').geom('geom1').run('fin');

model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').geom('geom1').feature.move('pt3', 1);
model.component('comp1').geom('geom1').feature.move('pt4', 2);
model.component('comp1').geom('geom1').run('pt6');
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature.move('uni1', 3);
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'r1'});
model.component('comp1').geom('geom1').feature('uni1').label('Top_plate');
model.component('comp1').geom('geom1').feature.move('uni1', 9);
model.component('comp1').geom('geom1').feature.duplicate('uni2', 'uni1');
model.component('comp1').geom('geom1').feature.move('uni2', 10);
model.component('comp1').geom('geom1').feature('uni2').label('Bottom_plate');
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').feature('uni2').selection('input').init;
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'r2'});
model.component('comp1').geom('geom1').feature('uni2').selection('input').init;
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'uni1'});
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'r2'});
model.component('comp1').geom('geom1').feature('uni1').set('selresult', true);
model.component('comp1').geom('geom1').feature('uni1').set('selresultshow', 'all');
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').feature('uni2').selection('input').init;
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'r1'});
model.component('comp1').geom('geom1').feature('uni2').set('keep', false);
model.component('comp1').geom('geom1').run('pt5');
model.component('comp1').geom('geom1').run('pt5');
model.component('comp1').geom('geom1').run('pt6');
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('pt5');
model.component('comp1').geom('geom1').run('uni2');
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'pt1' 'pt2' 'pt5' 'pt6' 'r1'});
model.component('comp1').geom('geom1').run('uni2');
model.component('comp1').geom('geom1').feature.duplicate('pt7', 'pt5');
model.component('comp1').geom('geom1').feature.duplicate('pt8', 'pt6');
model.component('comp1').geom('geom1').feature.move('pt7', 3);
model.component('comp1').geom('geom1').feature.move('pt8', 4);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature.move('uni1', 5);
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'pt7' 'pt8' 'r1'});
model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').run('uni2');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'pt7' 'pt8'});
model.component('comp1').geom('geom1').feature.move('uni2', 5);
model.component('comp1').geom('geom1').feature.move('uni1', 12);
model.component('comp1').geom('geom1').feature.move('pt1', 1);
model.component('comp1').geom('geom1').feature.move('pt2', 2);
model.component('comp1').geom('geom1').feature.move('pt4', 11);
model.component('comp1').geom('geom1').feature.move('pt3', 10);
model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'pt7' 'pt8' 'r2'});
model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'pt1' 'pt2' 'pt7' 'pt8' 'r1'});
model.component('comp1').geom('geom1').run('uni2');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'pt5' 'pt6' 'r2'});
model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').physics('solid').feature('fix2').selection.set([13]);
model.component('comp1').physics('solid').feature('bndl1').selection.set([5]);
model.component('comp1').physics('solid').feature('free2').active(false);

model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').pair('ap3').manualSelection(true);
model.component('comp1').pair('ap3').source.set([3 4 7]);
model.component('comp1').pair('ap3').destination.set([10 15]);
model.component('comp1').pair('ap3').source.set([3 7]);

model.result('pg1').run;

model.param.set('weight_mas', '20e-3 [kg]');

model.component('comp1').pair.move('p2', 2);
model.component('comp1').pair('p2').source.set([12]);
model.component('comp1').pair('p2').destination.set([12]);
model.component('comp1').pair('p2').type('Contact');

model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').geom(2);
model.component('comp1').view('view1').hideEntities('hide1').add([2]);
model.component('comp1').view('view1').set('hidestatus', 'hide');

model.component('comp1').pair('p2').destination.set([4 12]);
model.component('comp1').pair('p2').source.set([4]);
model.component('comp1').pair('p2').destination.remove([4]);
model.component('comp1').pair('p2').active(true);

model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideEntities.clear;
model.component('comp1').view('view1').hideMesh.clear;

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair.duplicate('ap4', 'ap3');
model.component('comp1').pair('ap4').source.remove([3]);
model.component('comp1').pair('ap4').destination.remove([10]);

model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature('fin').set('action', 'union');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').mesh('mesh1').run;

model.study.create('std2');
model.study('std2').create('time', 'Transient');
model.study('std2').feature('time').activate('solid', true);

model.sol.create('sol2');
model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').set('data', 'dset2');
model.result('pg4').create('surf1', 'Surface');
model.result('pg4').feature('surf1').set('expr', {'solid.mises'});
model.result('pg4').label('Stress (solid)');
model.result('pg4').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg4').feature('surf1').set('resolution', 'normal');
model.result('pg4').feature('surf1').create('def', 'Deform');
model.result('pg4').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg4').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup.create('dset2solidlgrp', 'Results');
model.nodeGroup('dset2solidlgrp').label('Applied Loads (solid) 1');
model.nodeGroup('dset2solidlgrp').set('type', 'plotgroup');
model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset2');
model.result('pg5').label('Volume Loads (solid)');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg5');

model.result('pg5').set('showlegends', true);
model.result('pg5').set('titletype', 'custom');
model.result('pg5').set('typeintitle', false);
model.result('pg5').set('descriptionintitle', false);
model.result('pg5').set('unitintitle', false);
model.result('pg5').set('frametype', 'spatial');
model.result('pg5').set('showlegendsunit', true);
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', {'1'});
model.result('pg5').feature('surf1').label('Gray Surfaces');
model.result('pg5').feature('surf1').set('coloring', 'uniform');
model.result('pg5').feature('surf1').set('color', 'gray');
model.result('pg5').feature('surf1').active(false);
model.result('pg5').feature('surf1').create('def', 'Deform');
model.result('pg5').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg5').feature('surf1').feature('def').set('scale', 0);
model.result('pg5').create('arws1', 'ArrowSurface');
model.result('pg5').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg5').feature('arws1').set('placement', 'gausspoints');
model.result('pg5').feature('arws1').set('arrowbase', 'tail');
model.result('pg5').feature('arws1').label('Gravity 1');
model.result('pg5').feature.move('surf1', 1);
model.result('pg5').feature('arws1').set('inheritplot', 'none');
model.result('pg5').feature('arws1').create('col', 'Color');
model.result('pg5').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg5').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg5').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg5').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg5').feature('arws1').set('color', 'magenta');
model.result('pg5').feature('arws1').create('def', 'Deform');
model.result('pg5').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg5').feature('arws1').feature('def').set('scale', 0);

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').set('data', 'dset2');
model.result('pg6').label('Boundary Loads (solid)');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg6');

model.result('pg6').set('showlegends', true);
model.result('pg6').set('titletype', 'custom');
model.result('pg6').set('typeintitle', false);
model.result('pg6').set('descriptionintitle', false);
model.result('pg6').set('unitintitle', false);
model.result('pg6').set('frametype', 'spatial');
model.result('pg6').set('showlegendsunit', true);
model.result('pg6').create('surf1', 'Surface');
model.result('pg6').feature('surf1').set('expr', {'1'});
model.result('pg6').feature('surf1').label('Gray Surfaces');
model.result('pg6').feature('surf1').set('coloring', 'uniform');
model.result('pg6').feature('surf1').set('color', 'gray');
model.result('pg6').feature('surf1').active(false);
model.result('pg6').feature('surf1').create('def', 'Deform');
model.result('pg6').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg6').feature('surf1').feature('def').set('scale', 0);
model.result('pg6').create('arwl1', 'ArrowLine');
model.result('pg6').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg6').feature('arwl1').set('placement', 'gausspoints');
model.result('pg6').feature('arwl1').set('arrowbase', 'tail');
model.result('pg6').feature('arwl1').label('Load');
model.result('pg6').feature.move('surf1', 1);
model.result('pg6').feature('arwl1').set('inheritplot', 'none');
model.result('pg6').feature('arwl1').create('col', 'Color');
model.result('pg6').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg6').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg6').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg6').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg6').feature('arwl1').set('color', 'red');
model.result('pg6').feature('arwl1').create('def', 'Deform');
model.result('pg6').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg6').feature('arwl1').feature('def').set('scale', 0);
model.result.remove('pg4');
model.result.remove('pg6');
model.result.remove('pg5');

model.component('comp1').pair('ap4').active(false);
model.component('comp1').pair('p2').active(false);
model.component('comp1').pair('ap3').active(false);

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').set('data', 'dset2');
model.result('pg4').create('surf1', 'Surface');
model.result('pg4').feature('surf1').set('expr', {'solid.mises'});
model.result('pg4').label('Stress (solid)');
model.result('pg4').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg4').feature('surf1').set('resolution', 'normal');
model.result('pg4').feature('surf1').create('def', 'Deform');
model.result('pg4').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg4').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset2');
model.result('pg5').label('Volume Loads (solid)');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg5');

model.result('pg5').set('showlegends', true);
model.result('pg5').set('titletype', 'custom');
model.result('pg5').set('typeintitle', false);
model.result('pg5').set('descriptionintitle', false);
model.result('pg5').set('unitintitle', false);
model.result('pg5').set('frametype', 'spatial');
model.result('pg5').set('showlegendsunit', true);
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', {'1'});
model.result('pg5').feature('surf1').label('Gray Surfaces');
model.result('pg5').feature('surf1').set('coloring', 'uniform');
model.result('pg5').feature('surf1').set('color', 'gray');
model.result('pg5').feature('surf1').active(false);
model.result('pg5').feature('surf1').create('def', 'Deform');
model.result('pg5').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg5').feature('surf1').feature('def').set('scale', 0);
model.result('pg5').create('arws1', 'ArrowSurface');
model.result('pg5').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg5').feature('arws1').set('placement', 'gausspoints');
model.result('pg5').feature('arws1').set('arrowbase', 'tail');
model.result('pg5').feature('arws1').label('Gravity 1');
model.result('pg5').feature.move('surf1', 1);
model.result('pg5').feature('arws1').set('inheritplot', 'none');
model.result('pg5').feature('arws1').create('col', 'Color');
model.result('pg5').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg5').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg5').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg5').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg5').feature('arws1').set('color', 'magenta');
model.result('pg5').feature('arws1').create('def', 'Deform');
model.result('pg5').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg5').feature('arws1').feature('def').set('scale', 0);

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').set('data', 'dset2');
model.result('pg6').label('Boundary Loads (solid)');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg6');

model.result('pg6').set('showlegends', true);
model.result('pg6').set('titletype', 'custom');
model.result('pg6').set('typeintitle', false);
model.result('pg6').set('descriptionintitle', false);
model.result('pg6').set('unitintitle', false);
model.result('pg6').set('frametype', 'spatial');
model.result('pg6').set('showlegendsunit', true);
model.result('pg6').create('surf1', 'Surface');
model.result('pg6').feature('surf1').set('expr', {'1'});
model.result('pg6').feature('surf1').label('Gray Surfaces');
model.result('pg6').feature('surf1').set('coloring', 'uniform');
model.result('pg6').feature('surf1').set('color', 'gray');
model.result('pg6').feature('surf1').active(false);
model.result('pg6').feature('surf1').create('def', 'Deform');
model.result('pg6').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg6').feature('surf1').feature('def').set('scale', 0);
model.result('pg6').create('arwl1', 'ArrowLine');
model.result('pg6').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg6').feature('arwl1').set('placement', 'gausspoints');
model.result('pg6').feature('arwl1').set('arrowbase', 'tail');
model.result('pg6').feature('arwl1').label('Load');
model.result('pg6').feature.move('surf1', 1);
model.result('pg6').feature('arwl1').set('inheritplot', 'none');
model.result('pg6').feature('arwl1').create('col', 'Color');
model.result('pg6').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg6').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg6').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg6').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg6').feature('arwl1').set('color', 'red');
model.result('pg6').feature('arwl1').create('def', 'Deform');
model.result('pg6').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg6').feature('arwl1').feature('def').set('scale', 0);

model.sol('sol2').runAll;

model.result('pg4').run;
model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').set('data', 'dset2');
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;

model.component('comp1').pair('ap4').type('Contact');

model.component('comp1').view('view1').set('hidestatus', 'ignore');
model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').geom(2);
model.component('comp1').view('view1').hideEntities('hide1').add([2]);
model.component('comp1').view('view1').set('hidestatus', 'hide');

model.component('comp1').pair('ap4').active(true);
model.component('comp1').pair('ap4').source.set([6]);

model.component('comp1').view('view1').set('hidestatus', 'showonlyhidden');

model.component('comp1').pair('ap4').destination.set([6]);

model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg1').run;

model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('uni1');

model.component('comp1').view('view1').set('hidestatus', 'ignore');
model.component('comp1').view('view1').hideObjects.clear;
model.component('comp1').view('view1').hideObjects.create('hide1');
model.component('comp1').view('view1').hideObjects('hide1').init;
model.component('comp1').view('view1').hideObjects('hide1').add({'uni1'});
model.component('comp1').view('view1').set('hidestatus', 'ignore');

model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 'thickness*2'});
model.component('comp1').geom('geom1').run('r2');

model.param.set('top_plate_y', 'thickness*2');
model.param.descr('top_plate_y', 'Starting point of the y component of corner of top plate');

model.component('comp1').geom('geom1').feature.duplicate('pt9', 'pt7');
model.component('comp1').geom('geom1').feature.duplicate('pt10', 'pt8');
model.component('comp1').geom('geom1').feature.remove('pt9');
model.component('comp1').geom('geom1').feature.remove('pt10');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 'top_plate_y'});
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('pt5').setIndex('p', 'top_plate_y', 1);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('pt5');
model.component('comp1').geom('geom1').feature('pt6').setIndex('p', 'top_plate_y', 1);
model.component('comp1').geom('geom1').run('pt6');
model.component('comp1').geom('geom1').feature('pt3').setIndex('p', 'top_plate_y+*thickness', 1);
model.component('comp1').geom('geom1').run('pt6');
model.component('comp1').geom('geom1').feature('pt3').setIndex('p', 'top_plate_y+thickness', 1);
model.component('comp1').geom('geom1').run('pt3');
model.component('comp1').geom('geom1').feature('pt4').setIndex('p', 'top_plate_y+thickness', 1);
model.component('comp1').geom('geom1').run('pt4');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair('ap4').destination.remove([7]);
model.component('comp1').pair('ap4').source.set([8]);
model.component('comp1').pair('ap4').destination.set([7]);
model.component('comp1').pair('p1').source.set([5]);
model.component('comp1').pair('p1').destination.set([3]);
model.component('comp1').pair('p1').active(true);
model.component('comp1').pair('p2').active(true);
model.component('comp1').pair('p2').source.set([14]);
model.component('comp1').pair('p2').destination.set([13]);

model.param.set('top_plate_y', 'thickness*1');

model.component('comp1').geom('geom1').run('fin');

model.param.set('plate_separation', '1e-10[m]');
model.param.set('top_plate_y', 'thickness*(1+plate_separation)');
model.param.set('plate_separation', '1e-10');
model.param.set('top_plate_y', 'thickness*(2+plate_separation)');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair('p2').source.set([14]);
model.component('comp1').pair('p2').destination.set([13]);
model.component('comp1').pair('ap4').source.set([8]);
model.component('comp1').pair('ap4').destination.set([7]);
model.component('comp1').pair('p1').source.set([5]);
model.component('comp1').pair('p1').destination.set([3]);

model.param.set('top_plate_y', 'thickness*(1+plate_separation)');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair('p1').source.set([4]);
model.component('comp1').pair('p2').type('Identity');
model.component('comp1').pair('ap4').source.set([6]);

model.component('comp1').geom('geom1').feature('fin').set('action', 'assembly');
model.component('comp1').geom('geom1').run;

model.component('comp1').view.create('view2', 'geom1');
model.component('comp1').view('view2').set('locked', true);
model.component('comp1').view('view2').label('Left Clip');
model.component('comp1').view('view1').label('Overall');
model.component('comp1').view.create('view3', 'geom1');
model.component('comp1').view('view3').set('locked', true);
model.component('comp1').view('view3').label('Right Clip');

model.param.set('top_plate_y', 'thickness*2');
model.param.remove('plate_separation');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair('p2').source.set([15]);
model.component('comp1').pair('p2').destination.set([7]);
model.component('comp1').pair('ap4').source.remove([12]);
model.component('comp1').pair('ap4').destination.set([4]);
model.component('comp1').pair('ap4').source.set([12]);
model.component('comp1').pair('p1').source.remove([3]);
model.component('comp1').pair('p1').destination.set([3]);

model.param.set('top_plate_y', 'thickness');

model.component('comp1').geom('geom1').run('fin');

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;

model.component('comp1').physics('solid').create('rig5', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature.remove('rig5');
model.component('comp1').physics('solid').create('fix3', 'PairFixed', 1);
model.component('comp1').physics('solid').feature('fix3').set('pairs', {'p1' 'p2'});

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg1').run;

model.component('comp1').physics('solid').feature.remove('fix1');
model.component('comp1').physics('solid').feature.remove('roll1');
model.component('comp1').physics('solid').feature.remove('rig2');
model.component('comp1').physics('solid').feature.remove('rig3');
model.component('comp1').physics('solid').feature.remove('rig4');
model.component('comp1').physics('solid').feature('rig1').selection.set([5]);
model.component('comp1').physics('solid').feature('rig1').setIndex('Direction', true, 0);
model.component('comp1').physics('solid').feature('rig1').label('Rigid Bottom plate');
model.component('comp1').physics('solid').feature('rig1').active(true);
model.component('comp1').physics('solid').feature.remove('free2');

model.sol('sol1').runAll;

model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.component('comp1').physics('solid').create('rig2', 'PairRigidConnector', 1);
model.component('comp1').physics('solid').feature('fix3').active(false);
model.component('comp1').physics('solid').feature('rig2').set('pairs', {'p1' 'p2'});
model.component('comp1').physics('solid').feature('rig2').label('Clips');

model.sol('sol1').runAll;

model.result('pg2').set('window', 'window1');
model.result('pg2').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,1)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg1').run;
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg1');
model.result.export('anim1').run;
model.result.export('anim1').run;
model.result.export('anim1').run;

model.study('std2').feature('time').set('tlist', 'range(0,0.1,5)');

model.result('pg1').run;
model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', '1');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.1,5)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg1').run;
model.result.export.create('anim2', 'Animation');
model.result.export('anim2').set('target', 'player');
model.result.export('anim2').set('plotgroup', 'pg1');
model.result.export('anim2').run;
model.result.export('anim2').set('framesel', 'all');
model.result.export('anim2').run;

model.label('ez_actuator_no_electrostatics.mph');

model.result.export('anim2').showFrame;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;

model.component('comp1').geom('geom1').run('fin');

model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').run;
model.result.remove('pg3');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('data', 'dset2');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.create('anim3', 'Animation');
model.result.export('anim3').set('target', 'player');
model.result.export('anim3').set('plotgroup', 'pg2');
model.result.export('anim3').run;
model.result.export('anim3').set('framesel', 'all');
model.result.export('anim3').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;
model.result.export('anim1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').feature('def1').set('scale', 3);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('line1').feature('def1').set('scale', 3);
model.result('pg1').run;
model.result('pg1').feature('line1').feature('def1').set('scale', 1);
model.result('pg1').run;
model.result('pg1').feature('surf1').feature('def1').set('scale', 1);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.duplicate('pg7', 'pg2');
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').feature('lngr2').set('expr', 'u');
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').feature('lngr3').set('expr', 'u');
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result.export.create('anim4', 'Animation');
model.result.export('anim4').set('target', 'player');
model.result.export('anim4').set('plotgroup', 'pg7');
model.result.export('anim4').run;
model.result.export('anim4').set('framesel', 'all');
model.result.export('anim4').run;
model.result.export('anim2').showFrame;
model.result.export('anim1').showFrame;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg1').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg1').run;
model.result.export.create('img1', 'Image');
model.result.export('img1').set('size', 'presentation');
model.result.export('img1').set('unit', 'px');
model.result.export('img1').set('height', '656');
model.result.export('img1').set('width', '874');
model.result.export('img1').set('lockratio', 'off');
model.result.export('img1').set('resolution', '96');
model.result.export('img1').set('antialias', 'on');
model.result.export('img1').set('zoomextents', 'off');
model.result.export('img1').set('fontsize', '12');
model.result.export('img1').set('customcolor', [1 1 1]);
model.result.export('img1').set('background', 'transparent');
model.result.export('img1').set('gltfincludelines', 'on');
model.result.export('img1').set('title1d', 'on');
model.result.export('img1').set('legend1d', 'on');
model.result.export('img1').set('logo1d', 'on');
model.result.export('img1').set('options1d', 'on');
model.result.export('img1').set('title2d', 'on');
model.result.export('img1').set('legend2d', 'on');
model.result.export('img1').set('logo2d', 'on');
model.result.export('img1').set('options2d', 'off');
model.result.export('img1').set('title3d', 'on');
model.result.export('img1').set('legend3d', 'on');
model.result.export('img1').set('logo3d', 'on');
model.result.export('img1').set('options3d', 'off');
model.result.export('img1').set('axisorientation', 'on');
model.result.export('img1').set('grid', 'on');
model.result.export('img1').set('axes1d', 'on');
model.result.export('img1').set('axes2d', 'on');
model.result.export('img1').set('showgrid', 'on');
model.result.export('img1').set('target', 'file');
model.result.export('img1').set('qualitylevel', '92');
model.result.export('img1').set('qualityactive', 'off');
model.result.export('img1').set('imagetype', 'png');
model.result.export('img1').set('lockview', 'off');
model.result.export.remove('img1');
model.result.export('anim2').showFrame;
model.result.export('anim1').showFrame;
model.result.export('anim2').showFrame;
model.result.export.create('tbl1', 'Table');
model.result.export('tbl1').set('source', 'evaluationgroup');
model.result.export.remove('tbl1');
model.result.export('anim1').showFrame;
model.result.export.create('data1', 'dset2', 'Data');
model.result.export('data1').set('filename', 'C:\Users\ul18363\OneDrive - University of Bristol\Documents\COMSOL\Examples leading to EZ\09_ EZ actuator no electrostatics\time_dependant_results.txt');
model.result.export('data1').run;
model.result.export.remove('data1');
model.result('pg1').run;

model.sol('sol2').feature('t1').create('ar1', 'AutoRemesh');
model.sol('sol2').feature('t1').create('se1', 'Segregated');
model.sol('sol2').feature('t1').feature.remove('se1');
model.sol('sol2').feature('t1').create('st1', 'StopCondition');
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondarr', '', 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondterminateon', 'true', 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondActive', true, 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopconddesc', 'Stop expression 1', 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondarr', '', 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondterminateon', 'true', 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopcondActive', true, 0);
model.sol('sol2').feature('t1').feature('st1').setIndex('stopconddesc', 'Stop expression 1', 0);
model.sol('sol2').feature('t1').feature('st1').active(false);
model.sol.create('sol3');
model.sol('sol3').label('Remeshed Solution 1');
model.sol('sol3').study('std2');
model.sol('sol2').feature('t1').feature('ar1').set('tadapsol', 'sol3');

model.result.create('pg8', 'PlotGroup2D');
model.result('pg8').set('data', 'dset3');
model.result('pg8').create('surf1', 'Surface');
model.result('pg8').feature('surf1').set('expr', {'solid.mises'});
model.result('pg8').label('Stress (solid) 1');
model.result('pg8').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg8').feature('surf1').set('resolution', 'normal');
model.result('pg8').feature('surf1').create('def', 'Deform');
model.result('pg8').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg8').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup.create('dset3solidlgrp', 'Results');
model.nodeGroup('dset3solidlgrp').label('Applied Loads (solid) 2');
model.nodeGroup('dset3solidlgrp').set('type', 'plotgroup');
model.nodeGroup('dset3solidlgrp').placeAfter('plotgroup', 'pg8');

model.result.create('pg9', 'PlotGroup2D');
model.result('pg9').set('data', 'dset3');
model.result('pg9').label('Volume Loads (solid) 1');

model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg9');

model.result('pg9').set('showlegends', true);
model.result('pg9').set('titletype', 'custom');
model.result('pg9').set('typeintitle', false);
model.result('pg9').set('descriptionintitle', false);
model.result('pg9').set('unitintitle', false);
model.result('pg9').set('frametype', 'spatial');
model.result('pg9').set('showlegendsunit', true);
model.result('pg9').create('surf1', 'Surface');
model.result('pg9').feature('surf1').set('expr', {'1'});
model.result('pg9').feature('surf1').label('Gray Surfaces');
model.result('pg9').feature('surf1').set('coloring', 'uniform');
model.result('pg9').feature('surf1').set('color', 'gray');
model.result('pg9').feature('surf1').active(false);
model.result('pg9').feature('surf1').create('def', 'Deform');
model.result('pg9').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg9').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg9').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg9').feature('surf1').feature('def').set('scale', 0);
model.result('pg9').create('arws1', 'ArrowSurface');
model.result('pg9').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg9').feature('arws1').set('placement', 'gausspoints');
model.result('pg9').feature('arws1').set('arrowbase', 'tail');
model.result('pg9').feature('arws1').label('Gravity 1');
model.result('pg9').feature.move('surf1', 1);
model.result('pg9').feature('arws1').set('inheritplot', 'none');
model.result('pg9').feature('arws1').create('col', 'Color');
model.result('pg9').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg9').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg9').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg9').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg9').feature('arws1').set('color', 'magenta');
model.result('pg9').feature('arws1').create('def', 'Deform');
model.result('pg9').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg9').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg9').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg9').feature('arws1').feature('def').set('scale', 0);

model.nodeGroup('dset3solidlgrp').placeAfter('plotgroup', 'pg8');

model.result.create('pg10', 'PlotGroup2D');
model.result('pg10').set('data', 'dset3');
model.result('pg10').label('Boundary Loads (solid) 1');

model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg10');

model.result('pg10').set('showlegends', true);
model.result('pg10').set('titletype', 'custom');
model.result('pg10').set('typeintitle', false);
model.result('pg10').set('descriptionintitle', false);
model.result('pg10').set('unitintitle', false);
model.result('pg10').set('frametype', 'spatial');
model.result('pg10').set('showlegendsunit', true);
model.result('pg10').create('surf1', 'Surface');
model.result('pg10').feature('surf1').set('expr', {'1'});
model.result('pg10').feature('surf1').label('Gray Surfaces');
model.result('pg10').feature('surf1').set('coloring', 'uniform');
model.result('pg10').feature('surf1').set('color', 'gray');
model.result('pg10').feature('surf1').active(false);
model.result('pg10').feature('surf1').create('def', 'Deform');
model.result('pg10').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg10').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg10').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg10').feature('surf1').feature('def').set('scale', 0);
model.result('pg10').create('arwl1', 'ArrowLine');
model.result('pg10').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg10').feature('arwl1').set('placement', 'gausspoints');
model.result('pg10').feature('arwl1').set('arrowbase', 'tail');
model.result('pg10').feature('arwl1').label('Load');
model.result('pg10').feature.move('surf1', 1);
model.result('pg10').feature('arwl1').set('inheritplot', 'none');
model.result('pg10').feature('arwl1').create('col', 'Color');
model.result('pg10').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg10').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg10').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg10').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg10').feature('arwl1').set('color', 'red');
model.result('pg10').feature('arwl1').create('def', 'Deform');
model.result('pg10').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg10').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg10').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg10').feature('arwl1').feature('def').set('scale', 0);
model.result.remove('pg8');
model.result.remove('pg10');
model.result.remove('pg9');

model.sol('sol2').feature('t1').feature('ar1').active(false);
model.sol('sol2').feature('t1').feature('fc1').active(true);
model.sol('sol2').feature('t1').feature('ar1').active(true);

model.result.create('pg8', 'PlotGroup2D');
model.result('pg8').set('data', 'dset3');
model.result('pg8').create('surf1', 'Surface');
model.result('pg8').feature('surf1').set('expr', {'solid.mises'});
model.result('pg8').label('Stress (solid) 1');
model.result('pg8').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg8').feature('surf1').set('resolution', 'normal');
model.result('pg8').feature('surf1').create('def', 'Deform');
model.result('pg8').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg8').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset3solidlgrp').placeAfter('plotgroup', 'pg8');

model.result.create('pg9', 'PlotGroup2D');
model.result('pg9').set('data', 'dset3');
model.result('pg9').label('Volume Loads (solid) 1');

model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg9');

model.result('pg9').set('showlegends', true);
model.result('pg9').set('titletype', 'custom');
model.result('pg9').set('typeintitle', false);
model.result('pg9').set('descriptionintitle', false);
model.result('pg9').set('unitintitle', false);
model.result('pg9').set('frametype', 'spatial');
model.result('pg9').set('showlegendsunit', true);
model.result('pg9').create('surf1', 'Surface');
model.result('pg9').feature('surf1').set('expr', {'1'});
model.result('pg9').feature('surf1').label('Gray Surfaces');
model.result('pg9').feature('surf1').set('coloring', 'uniform');
model.result('pg9').feature('surf1').set('color', 'gray');
model.result('pg9').feature('surf1').active(false);
model.result('pg9').feature('surf1').create('def', 'Deform');
model.result('pg9').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg9').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg9').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg9').feature('surf1').feature('def').set('scale', 0);
model.result('pg9').create('arws1', 'ArrowSurface');
model.result('pg9').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg9').feature('arws1').set('placement', 'gausspoints');
model.result('pg9').feature('arws1').set('arrowbase', 'tail');
model.result('pg9').feature('arws1').label('Gravity 1');
model.result('pg9').feature.move('surf1', 1);
model.result('pg9').feature('arws1').set('inheritplot', 'none');
model.result('pg9').feature('arws1').create('col', 'Color');
model.result('pg9').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg9').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg9').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg9').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg9').feature('arws1').set('color', 'magenta');
model.result('pg9').feature('arws1').create('def', 'Deform');
model.result('pg9').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg9').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg9').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg9').feature('arws1').feature('def').set('scale', 0);

model.nodeGroup('dset3solidlgrp').placeAfter('plotgroup', 'pg8');

model.result.create('pg10', 'PlotGroup2D');
model.result('pg10').set('data', 'dset3');
model.result('pg10').label('Boundary Loads (solid) 1');

model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg10');

model.result('pg10').set('showlegends', true);
model.result('pg10').set('titletype', 'custom');
model.result('pg10').set('typeintitle', false);
model.result('pg10').set('descriptionintitle', false);
model.result('pg10').set('unitintitle', false);
model.result('pg10').set('frametype', 'spatial');
model.result('pg10').set('showlegendsunit', true);
model.result('pg10').create('surf1', 'Surface');
model.result('pg10').feature('surf1').set('expr', {'1'});
model.result('pg10').feature('surf1').label('Gray Surfaces');
model.result('pg10').feature('surf1').set('coloring', 'uniform');
model.result('pg10').feature('surf1').set('color', 'gray');
model.result('pg10').feature('surf1').active(false);
model.result('pg10').feature('surf1').create('def', 'Deform');
model.result('pg10').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg10').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg10').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg10').feature('surf1').feature('def').set('scale', 0);
model.result('pg10').create('arwl1', 'ArrowLine');
model.result('pg10').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg10').feature('arwl1').set('placement', 'gausspoints');
model.result('pg10').feature('arwl1').set('arrowbase', 'tail');
model.result('pg10').feature('arwl1').label('Load');
model.result('pg10').feature.move('surf1', 1);
model.result('pg10').feature('arwl1').set('inheritplot', 'none');
model.result('pg10').feature('arwl1').create('col', 'Color');
model.result('pg10').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg10').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg10').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg10').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg10').feature('arwl1').set('color', 'red');
model.result('pg10').feature('arwl1').create('def', 'Deform');
model.result('pg10').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg10').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg10').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg10').feature('arwl1').feature('def').set('scale', 0);
model.result.remove('pg8');
model.result.remove('pg10');
model.result.remove('pg9');

model.sol('sol2').feature('t1').feature('ar1').active(false);
model.sol('sol2').run('t1');

model.result('pg1').run;

model.component('comp1').physics('solid').feature.remove('fix3');

model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 51, 0);
model.result('pg1').run;
model.result('pg1').set('data', 'dset1');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('data', 'dset1');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature.duplicate('lngr4', 'lngr2');
model.result('pg2').feature.duplicate('lngr5', 'lngr3');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr4').set('data', 'dset1');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').feature('lngr5').set('data', 'dset1');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.create('anim5', 'Animation');
model.result.export('anim5').set('target', 'player');
model.result.export('anim5').set('plotgroup', 'pg2');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.remove('anim5');
model.result.export.remove('anim1');
model.result.export.remove('anim2');
model.result.export.remove('anim3');
model.result.export.remove('anim4');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('data', 'dset2');
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg2');
model.result.export('anim1').run;
model.result.export('anim1').set('framesel', 'all');
model.result.export('anim1').showFrame;
model.result.export('anim1').set('maxframes', 51);
model.result.export('anim1').set('showframe', 1);
model.result.export('anim1').run;

model.study('std2').feature('time').set('tlist', 'range(0,0.01,5)');

model.sol('sol2').runAll;

model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.create('anim2', 'Animation');
model.result.export('anim2').set('target', 'player');
model.result.export('anim2').set('plotgroup', 'pg2');
model.result.export('anim2').run;
model.result.export('anim2').set('framesel', 'all');
model.result.export('anim2').set('stopped', true);
model.result.export('anim2').run;

model.study('std2').feature('time').set('tlist', 'range(0,0.001,0.01)');

model.sol('sol2').runAll;

model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg1').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;

model.study('std2').feature('time').set('tlist', 'range(0,0.0001,0.05)');

model.sol('sol2').runAll;

model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').showFrame;
model.result.export('anim1').set('maxframes', 501);
model.result.export('anim1').set('showframe', 18);
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;
model.result.export.remove('anim1');
model.result.export('anim2').showFrame;
model.result.export('anim2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result.export.create('anim3', 'Animation');
model.result.export('anim3').set('target', 'file');
model.result.export('anim3').set('plotgroup', 'pg2');
model.result.export('anim2').showFrame;
model.result.export('anim3').set('giffilename', 'C:\Users\ul18363\OneDrive - University of Bristol\Documents\COMSOL\Examples leading to EZ\09_ EZ actuator no electrostatics\time_evolution_actuator_not_charged.gif');
model.result.export('anim3').run;

model.label('ez_actuator_no_electrostatics_no_results.mph');

model.result.export('anim2').showFrame;
model.result.export.remove('anim2');
model.result.export.remove('anim3');
model.result('pg7').set('window', 'window1');
model.result('pg7').run;
model.result('pg4').run;
model.result('pg2').set('window', 'window1');
model.result('pg2').run;
model.result('pg1').run;

model.sol.remove('sol3');
model.sol.remove('sol2');
model.sol.remove('sol1');

model.study('std2').create('stat', 'Stationary');
model.study('std2').feature.move('stat', 0);

model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');

model.study('std1').feature('stat').activate('esbe', true);
model.study('std2').feature('stat').activate('esbe', true);
model.study('std2').feature('time').activate('esbe', true);
model.study('std2').feature('stat').setIndex('activate', false, 3);
model.study('std2').feature('stat').label('Stationary: No electrostatics');
model.study('std1').feature('stat').setIndex('activate', false, 3);
model.study('std1').feature('stat').label('Stationary: No electrostatics');

model.component('comp1').physics('esbe').create('init2', 'init1', 1);
model.component('comp1').physics('esbe').create('term1', 'Terminal', 1);
model.component('comp1').physics('esbe').create('term2', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term1').set('TerminalType', 'Voltage');

model.param.set('voltage', '6e3[V]');
model.param.descr('voltage', 'Voltage');

model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([2]);
model.component('comp1').selection('sel2').geom(1);
model.component('comp1').selection('sel2').set([9 10 11 13]);

model.param.set('top_plate_y', 'thickness*2');
model.param.remove('top_plate_y');
model.param.set('top_plate_y', '0.02[m]', 'thickness*2 Starting point of the y component of corner of top plate');

model.component('comp1').geom('geom1').run('fin');

model.param.set('top_plate_y', '0.002[m]');

model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection('sel2').set([9 10 11 12 13 14 15 16]);
model.component('comp1').selection('sel2').label('top plate boundaries');
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').label('bottom plate boundaries');
model.component('comp1').selection('sel3').set([1]);
model.component('comp1').selection('sel3').geom(1);
model.component('comp1').selection('sel3').set([1 2 3 4 5 6 7 8]);

model.param.descr('top_plate_y', 'Starting point of the y component of corner of top plate');
model.param.set('top_plate_y', 'thickness*1');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat4').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat4').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat4').propertyGroup('def').func.create('rho', 'Analytic');
model.component('comp1').material('mat4').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat4').propertyGroup('def').func.create('cs', 'Analytic');
model.component('comp1').material('mat4').propertyGroup('def').func.create('an1', 'Analytic');
model.component('comp1').material('mat4').propertyGroup('def').func.create('an2', 'Analytic');
model.component('comp1').material('mat4').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat4').propertyGroup.create('NonlinearModel', 'Nonlinear model');
model.component('comp1').material('mat4').label('Air');
model.component('comp1').material('mat4').set('family', 'air');
model.component('comp1').material('mat4').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat4').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.component('comp1').material('mat4').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat4').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat4').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat4').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.component('comp1').material('mat4').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat4').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/R_const[K*mol/J]/T');
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/R_const/T,pA)'; 'T' 'd(pA*0.02897/R_const/T,T)'});
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('argunit', 'Pa,K');
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat4').propertyGroup('def').func('rho').set('plotargs', {'pA' '0' '1'; 'T' '0' '1'});
model.component('comp1').material('mat4').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat4').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.component('comp1').material('mat4').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat4').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*R_const[K*mol/J]/0.02897*T)');
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('args', {'T'});
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('argunit', 'K');
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('fununit', 'm/s');
model.component('comp1').material('mat4').propertyGroup('def').func('cs').set('plotargs', {'T' '273.15' '373.15'});
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('funcname', 'alpha_p');
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('expr', '-1/rho(pA,T)*d(rho(pA,T),T)');
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('args', {'pA' 'T'});
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('argunit', 'Pa,K');
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('fununit', '1/K');
model.component('comp1').material('mat4').propertyGroup('def').func('an1').set('plotargs', {'pA' '101325' '101325'; 'T' '273.15' '373.15'});
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('funcname', 'muB');
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('expr', '0.6*eta(T)');
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('args', {'T'});
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('argunit', 'K');
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('fununit', 'Pa*s');
model.component('comp1').material('mat4').propertyGroup('def').func('an2').set('plotargs', {'T' '200' '1600'});
model.component('comp1').material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', '');
model.component('comp1').material('mat4').propertyGroup('def').set('molarmass', '');
model.component('comp1').material('mat4').propertyGroup('def').set('bulkviscosity', '');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', {'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)'});
model.component('comp1').material('mat4').propertyGroup('def').set('molarmass', '0.02897[kg/mol]');
model.component('comp1').material('mat4').propertyGroup('def').set('bulkviscosity', 'muB(T)');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat4').propertyGroup('def').descr('relpermeability_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat4').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat4').propertyGroup('def').descr('dynamicviscosity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.component('comp1').material('mat4').propertyGroup('def').descr('ratioofspecificheat_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', {'0[S/m]' '0' '0' '0' '0[S/m]' '0' '0' '0' '0[S/m]'});
model.component('comp1').material('mat4').propertyGroup('def').descr('electricconductivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat4').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('density', 'rho(pA,T)');
model.component('comp1').material('mat4').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('soundspeed', 'cs(T)');
model.component('comp1').material('mat4').propertyGroup('def').descr('soundspeed_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').descr('molarmass_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').descr('bulkviscosity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat4').propertyGroup('def').addInput('pressure');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').descr('n_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('RefractiveIndex').descr('ki_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('NonlinearModel').set('BA', '(def.gamma+1)/2');
model.component('comp1').material('mat4').propertyGroup('NonlinearModel').descr('BA_symmetry', '');
model.component('comp1').material('mat4').set('groups', {});
model.component('comp1').material('mat4').set('family', 'air');
model.component('comp1').material('mat4').selection.geom('geom1', 1);
model.component('comp1').material('mat4').selection.geom('geom1', 2);
model.component('comp1').material('mat4').active(false);
model.component('comp1').material('mat4').selection.allVoids;
model.component('comp1').material('mat4').active(true);

model.component('comp1').physics('esbe').feature('init2').selection.named('sel2');
model.component('comp1').physics('esbe').feature('init2').set('V', 'voltage');
model.component('comp1').physics('esbe').feature.duplicate('init3', 'init2');
model.component('comp1').physics('esbe').feature('init3').selection.named('sel3');
model.component('comp1').physics('esbe').feature('init3').set('V', '-voltage');
model.component('comp1').physics('esbe').feature('init3').label('Initial Values Bottom');
model.component('comp1').physics('esbe').feature.move('init3', 4);
model.component('comp1').physics('esbe').feature('init2').label('Initial Values Top');
model.component('comp1').physics('esbe').feature('term1').set('V0', 'voltage');
model.component('comp1').physics('esbe').feature('term1').selection.named('sel2');
model.component('comp1').physics('esbe').feature('term2').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term2').set('V0', '-voltage');
model.component('comp1').physics('esbe').feature('term1').label('BC Top');
model.component('comp1').physics('esbe').feature('term2').label('BC Bottom');
model.component('comp1').physics('esbe').feature('term2').selection.named('sel3');
model.component('comp1').physics('solid').create('bndl2', 'BoundaryLoad', 1);
model.component('comp1').physics('solid').feature('bndl2').selection.named('sel2');
model.component('comp1').physics('solid').feature('bndl2').selection.named('sel3');
model.component('comp1').physics('solid').feature('bndl2').selection.named('sel2');
model.component('comp1').physics('solid').feature('bndl2').selection.all;
model.component('comp1').physics('solid').feature('bndl2').set('FperArea', {'esbe.Tu' 'esbe.Tv' '0'});

model.component('comp1').common.create('minpt1', 'CommonInputDef');
model.component('comp1').common.remove('minpt1');

model.component('comp1').physics('solid').feature('bndl2').set('FperArea', {'-esbe.unTx ' '-esbe.unTy' '0'});
model.component('comp1').physics('solid').feature('bndl2').label('Electrostatic Force over boundary');

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg1').feature('surf1').feature('def').set('scale', '1');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 1);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 1);

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').set('data', 'dset1');
model.result('pg3').label('Boundary Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg3');

model.result('pg3').set('showlegends', true);
model.result('pg3').set('titletype', 'custom');
model.result('pg3').set('typeintitle', false);
model.result('pg3').set('descriptionintitle', false);
model.result('pg3').set('unitintitle', false);
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('showlegendsunit', true);
model.result('pg3').create('surf1', 'Surface');
model.result('pg3').feature('surf1').set('expr', {'1'});
model.result('pg3').feature('surf1').label('Gray Surfaces');
model.result('pg3').feature('surf1').set('coloring', 'uniform');
model.result('pg3').feature('surf1').set('color', 'gray');
model.result('pg3').feature('surf1').active(false);
model.result('pg3').feature('surf1').create('def', 'Deform');
model.result('pg3').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg3').feature('surf1').feature('def').set('scale', 1);
model.result('pg3').create('arwl1', 'ArrowLine');
model.result('pg3').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg3').feature('arwl1').set('placement', 'gausspoints');
model.result('pg3').feature('arwl1').set('arrowbase', 'tail');
model.result('pg3').feature('arwl1').label('Load');
model.result('pg3').feature.move('surf1', 1);
model.result('pg3').feature('arwl1').set('inheritplot', 'none');
model.result('pg3').feature('arwl1').create('col', 'Color');
model.result('pg3').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg3').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg3').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg3').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg3').feature('arwl1').set('color', 'red');
model.result('pg3').feature('arwl1').create('def', 'Deform');
model.result('pg3').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg3').feature('arwl1').feature('def').set('scale', 1);

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result('pg3').create('arwl2', 'ArrowLine');
model.result('pg3').feature('arwl2').set('expr', {'solid.bndl2.F_Ax' 'solid.bndl2.F_Ay'});
model.result('pg3').feature('arwl2').set('placement', 'gausspoints');
model.result('pg3').feature('arwl2').set('arrowbase', 'tail');
model.result('pg3').feature('arwl2').label('Electrostatic Force over boundary');
model.result('pg3').feature.move('surf1', 2);
model.result('pg3').feature('arwl2').set('inheritplot', 'arwl1');
model.result('pg3').feature('arwl2').create('col', 'Color');
model.result('pg3').feature('arwl2').feature('col').set('expr', 'comp1.solid.bndl2.F_A_Mag');
model.result('pg3').feature('arwl2').feature('col').set('colortable', 'Spectrum');
model.result('pg3').feature('arwl2').feature('col').set('coloring', 'gradient');
model.result('pg3').feature('arwl2').feature('col').set('topcolor', 'red');
model.result('pg3').feature('arwl2').set('color', 'red');
model.result('pg3').feature('arwl2').create('def', 'Deform');
model.result('pg3').feature('arwl2').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('arwl2').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('arwl2').feature('def').set('scaleactive', true);
model.result('pg3').feature('arwl2').feature('def').set('scale', 1);
model.result.remove('pg2');
model.result.remove('pg1');
model.result.remove('pg3');

model.component('comp1').physics('esbe').selection.set([0]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'solid.mises'});
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg1').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg1').feature('surf1').feature('def').set('scale', '1');
model.result('pg1').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg1').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').label('Volume Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg2');

model.result('pg2').set('showlegends', true);
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', {'1'});
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 1);
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').set('arrowbase', 'tail');
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature.move('surf1', 1);
model.result('pg2').feature('arws1').set('inheritplot', 'none');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').set('color', 'magenta');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg2').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('arws1').feature('def').set('scale', 1);

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').set('data', 'dset1');
model.result('pg3').label('Boundary Loads (solid)');

model.nodeGroup('dset1solidlgrp').add('plotgroup', 'pg3');

model.result('pg3').set('showlegends', true);
model.result('pg3').set('titletype', 'custom');
model.result('pg3').set('typeintitle', false);
model.result('pg3').set('descriptionintitle', false);
model.result('pg3').set('unitintitle', false);
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('showlegendsunit', true);
model.result('pg3').create('surf1', 'Surface');
model.result('pg3').feature('surf1').set('expr', {'1'});
model.result('pg3').feature('surf1').label('Gray Surfaces');
model.result('pg3').feature('surf1').set('coloring', 'uniform');
model.result('pg3').feature('surf1').set('color', 'gray');
model.result('pg3').feature('surf1').active(false);
model.result('pg3').feature('surf1').create('def', 'Deform');
model.result('pg3').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg3').feature('surf1').feature('def').set('scale', 1);
model.result('pg3').create('arwl1', 'ArrowLine');
model.result('pg3').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg3').feature('arwl1').set('placement', 'gausspoints');
model.result('pg3').feature('arwl1').set('arrowbase', 'tail');
model.result('pg3').feature('arwl1').label('Load');
model.result('pg3').feature.move('surf1', 1);
model.result('pg3').feature('arwl1').set('inheritplot', 'none');
model.result('pg3').feature('arwl1').create('col', 'Color');
model.result('pg3').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg3').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg3').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg3').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg3').feature('arwl1').set('color', 'red');
model.result('pg3').feature('arwl1').create('def', 'Deform');
model.result('pg3').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg3').feature('arwl1').feature('def').set('scale', 1);

model.nodeGroup('dset1solidlgrp').placeAfter('plotgroup', 'pg1');

model.result('pg3').create('arwl2', 'ArrowLine');
model.result('pg3').feature('arwl2').set('expr', {'solid.bndl2.F_Ax' 'solid.bndl2.F_Ay'});
model.result('pg3').feature('arwl2').set('placement', 'gausspoints');
model.result('pg3').feature('arwl2').set('arrowbase', 'tail');
model.result('pg3').feature('arwl2').label('Electrostatic Force over boundary');
model.result('pg3').feature.move('surf1', 2);
model.result('pg3').feature('arwl2').set('inheritplot', 'arwl1');
model.result('pg3').feature('arwl2').create('col', 'Color');
model.result('pg3').feature('arwl2').feature('col').set('expr', 'comp1.solid.bndl2.F_A_Mag');
model.result('pg3').feature('arwl2').feature('col').set('colortable', 'Spectrum');
model.result('pg3').feature('arwl2').feature('col').set('coloring', 'gradient');
model.result('pg3').feature('arwl2').feature('col').set('topcolor', 'red');
model.result('pg3').feature('arwl2').set('color', 'red');
model.result('pg3').feature('arwl2').create('def', 'Deform');
model.result('pg3').feature('arwl2').feature('def').set('expr', {'u' 'v'});
model.result('pg3').feature('arwl2').feature('def').set('descr', 'Displacement field');
model.result('pg3').feature('arwl2').feature('def').set('scaleactive', true);
model.result('pg3').feature('arwl2').feature('def').set('scale', 1);

model.sol('sol1').runAll;

model.result('pg1').run;

model.sol.create('sol2');
model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');
model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000018181803158');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.0001,0.05)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature('d1').set('linsolver', 'mumps');
model.sol('sol2').feature('t1').feature('d1').label('Suggested Direct Solver (esbe) (merged)');
model.sol('sol2').feature('t1').create('i1', 'Iterative');
model.sol('sol2').feature('t1').feature('i1').set('linsolver', 'bicgstab');
model.sol('sol2').feature('t1').feature('i1').set('prefuntype', 'right');
model.sol('sol2').feature('t1').feature('i1').label('Suggested Iterative Solver (esbe)');
model.sol('sol2').feature('t1').feature('i1').create('dp1', 'DirectPreconditioner');
model.sol('sol2').feature('t1').feature('i1').feature('dp1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').create('i2', 'Iterative');
model.sol('sol2').feature('t1').feature('i2').set('linsolver', 'gmres');
model.sol('sol2').feature('t1').feature('i2').set('prefuntype', 'right');
model.sol('sol2').feature('t1').feature('i2').label('GMRES Iterative Solver (esbe)');
model.sol('sol2').feature('t1').feature('i2').create('dp1', 'DirectPreconditioner');
model.sol('sol2').feature('t1').feature('i2').feature('dp1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').set('data', 'dset2');
model.result('pg4').create('surf1', 'Surface');
model.result('pg4').feature('surf1').set('expr', {'solid.mises'});
model.result('pg4').label('Stress (solid) 1');
model.result('pg4').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg4').feature('surf1').set('resolution', 'normal');
model.result('pg4').feature('surf1').create('def', 'Deform');
model.result('pg4').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg4').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup.create('dset2solidlgrp', 'Results');
model.nodeGroup('dset2solidlgrp').label('Applied Loads (solid) 1');
model.nodeGroup('dset2solidlgrp').set('type', 'plotgroup');
model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset2');
model.result('pg5').label('Volume Loads (solid) 1');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg5');

model.result('pg5').set('showlegends', true);
model.result('pg5').set('titletype', 'custom');
model.result('pg5').set('typeintitle', false);
model.result('pg5').set('descriptionintitle', false);
model.result('pg5').set('unitintitle', false);
model.result('pg5').set('frametype', 'spatial');
model.result('pg5').set('showlegendsunit', true);
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', {'1'});
model.result('pg5').feature('surf1').label('Gray Surfaces');
model.result('pg5').feature('surf1').set('coloring', 'uniform');
model.result('pg5').feature('surf1').set('color', 'gray');
model.result('pg5').feature('surf1').active(false);
model.result('pg5').feature('surf1').create('def', 'Deform');
model.result('pg5').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg5').feature('surf1').feature('def').set('scale', 0);
model.result('pg5').create('arws1', 'ArrowSurface');
model.result('pg5').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg5').feature('arws1').set('placement', 'gausspoints');
model.result('pg5').feature('arws1').set('arrowbase', 'tail');
model.result('pg5').feature('arws1').label('Gravity 1');
model.result('pg5').feature.move('surf1', 1);
model.result('pg5').feature('arws1').set('inheritplot', 'none');
model.result('pg5').feature('arws1').create('col', 'Color');
model.result('pg5').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg5').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg5').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg5').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg5').feature('arws1').set('color', 'magenta');
model.result('pg5').feature('arws1').create('def', 'Deform');
model.result('pg5').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg5').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg5').feature('arws1').feature('def').set('scale', 0);

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').set('data', 'dset2');
model.result('pg6').label('Boundary Loads (solid) 1');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg6');

model.result('pg6').set('showlegends', true);
model.result('pg6').set('titletype', 'custom');
model.result('pg6').set('typeintitle', false);
model.result('pg6').set('descriptionintitle', false);
model.result('pg6').set('unitintitle', false);
model.result('pg6').set('frametype', 'spatial');
model.result('pg6').set('showlegendsunit', true);
model.result('pg6').create('surf1', 'Surface');
model.result('pg6').feature('surf1').set('expr', {'1'});
model.result('pg6').feature('surf1').label('Gray Surfaces');
model.result('pg6').feature('surf1').set('coloring', 'uniform');
model.result('pg6').feature('surf1').set('color', 'gray');
model.result('pg6').feature('surf1').active(false);
model.result('pg6').feature('surf1').create('def', 'Deform');
model.result('pg6').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg6').feature('surf1').feature('def').set('scale', 0);
model.result('pg6').create('arwl1', 'ArrowLine');
model.result('pg6').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg6').feature('arwl1').set('placement', 'gausspoints');
model.result('pg6').feature('arwl1').set('arrowbase', 'tail');
model.result('pg6').feature('arwl1').label('Load');
model.result('pg6').feature.move('surf1', 1);
model.result('pg6').feature('arwl1').set('inheritplot', 'none');
model.result('pg6').feature('arwl1').create('col', 'Color');
model.result('pg6').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg6').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg6').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg6').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg6').feature('arwl1').set('color', 'red');
model.result('pg6').feature('arwl1').create('def', 'Deform');
model.result('pg6').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg6').feature('arwl1').feature('def').set('scale', 0);

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg4');

model.result.create('pg7', 'PlotGroup2D');
model.result('pg7').set('data', 'dset2');
model.result('pg7').label('Boundary Loads (solid) 2');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg7');

model.result('pg7').set('showlegends', true);
model.result('pg7').set('titletype', 'custom');
model.result('pg7').set('typeintitle', false);
model.result('pg7').set('descriptionintitle', false);
model.result('pg7').set('unitintitle', false);
model.result('pg7').set('frametype', 'spatial');
model.result('pg7').set('showlegendsunit', true);
model.result('pg7').create('surf1', 'Surface');
model.result('pg7').feature('surf1').set('expr', {'1'});
model.result('pg7').feature('surf1').label('Gray Surfaces');
model.result('pg7').feature('surf1').set('coloring', 'uniform');
model.result('pg7').feature('surf1').set('color', 'gray');
model.result('pg7').feature('surf1').active(false);
model.result('pg7').feature('surf1').create('def', 'Deform');
model.result('pg7').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg7').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg7').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg7').feature('surf1').feature('def').set('scale', 0);
model.result('pg7').create('arwl1', 'ArrowLine');
model.result('pg7').feature('arwl1').set('expr', {'solid.bndl2.F_Ax' 'solid.bndl2.F_Ay'});
model.result('pg7').feature('arwl1').set('placement', 'gausspoints');
model.result('pg7').feature('arwl1').set('arrowbase', 'tail');
model.result('pg7').feature('arwl1').label('Electrostatic Force over boundary');
model.result('pg7').feature.move('surf1', 1);
model.result('pg7').feature('arwl1').set('inheritplot', 'none');
model.result('pg7').feature('arwl1').create('col', 'Color');
model.result('pg7').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl2.F_A_Mag');
model.result('pg7').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg7').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg7').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg7').feature('arwl1').set('color', 'red');
model.result('pg7').feature('arwl1').create('def', 'Deform');
model.result('pg7').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg7').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg7').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg7').feature('arwl1').feature('def').set('scale', 0);
model.result.create('pg8', 'PlotGroup2D');
model.result('pg8').label('Electric Potential (esbe)');
model.result('pg8').set('data', 'dset2');
model.result('pg8').feature.create('line1', 'Line');
model.result('pg8').feature('line1').set('expr', 'esbe.V');
model.result('pg8').feature('line1').set('colortable', 'RainbowLight');
model.result('pg8').feature('line1').set('data', 'parent');
model.result.create('pg9', 'PlotGroup2D');
model.result('pg9').label('Surface Charge Density (esbe)');
model.result('pg9').set('data', 'dset2');
model.result('pg9').feature.create('line1', 'Line');
model.result('pg9').feature('line1').set('expr', 'esbe.nD');
model.result('pg9').feature('line1').set('colortable', 'RainbowLight');
model.result('pg9').feature('line1').set('data', 'parent');
model.result.dataset.create('grid1', 'Grid2D');
model.result.dataset('grid1').set('source', 'data');
model.result.dataset('grid1').set('data', 'dset2');
model.result.dataset('grid1').set('par1', 'x');
model.result.dataset('grid1').set('par2', 'y');
model.result.dataset('grid1').set('parmin1', -0.11000000000000001);
model.result.dataset('grid1').set('parmax1', 0.22000000000000003);
model.result.dataset('grid1').set('parmin2', -2.0000000000000004E-4);
model.result.dataset('grid1').set('parmax2', 4.000000000000001E-4);
model.result.create('pg10', 'PlotGroup2D');
model.result('pg10').set('data', 'grid1');
model.result('pg10').create('surf1', 'Surface');
model.result('pg10').feature('surf1').set('expr', {'esbe.V'});
model.result('pg10').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg10').label('Electric Potential and Electric Field (esbe)');
model.result('pg10').create('arws1', 'ArrowSurface');
model.result('pg10').feature('arws1').set('expr', {'esbe.Ex' 'esbe.Ey'});
model.result('pg10').create('line1', 'Line');
model.result('pg10').feature('line1').set('expr', {'1'});
model.result('pg10').feature('line1').set('data', 'dset2');
model.result('pg10').feature('line1').set('titletype', 'none');
model.result('pg10').feature('line1').set('coloring', 'uniform');
model.result('pg10').feature('line1').set('color', 'black');
model.result.remove('pg8');
model.result.remove('pg7');
model.result.remove('pg10');
model.result.remove('pg9');
model.result.remove('pg4');
model.result.remove('pg6');
model.result.remove('pg5');
model.result.dataset.remove('grid1');

model.param.set('filling_y', 'thickness');
model.param.set('thickness_polymer', '25e-6[m]');
model.param.set('filling_y', 'thickness+2*thickness_polymer');
model.param.set('top_plate_y', 'thickness+2*thickness_polymer');
model.param.remove('filling_y');

model.component('comp1').geom('geom1').run('fin');

model.param.set('separations', '0[m]');
model.param.rename('separations', 's');
model.param.rename('s', 'sp');
model.param.descr('sp', 'separation between bodies to better visualize them');
model.param.set('y_ins_btm', 'sp+thickness');
model.param.set('y_inst_top', 'sp+thickness_polymer+y_ins_btm');

model.geom.create('part1', 'Part', 2);
model.geom('part1').create('r1', 'Rectangle');
model.geom('part1').label('metal_sheet_part');
model.geom.create('part2', 'Part', 2);
model.geom('part2').create('imp1', 'Import');
model.geom('part2').feature('imp1').set('type', 'sequence');
model.geom('part2').feature('imp1').set('sequence', 'part1');
model.geom('part2').feature('imp1').importData;
model.geom('part1').run('r1');
model.component('comp1').geom('geom1').feature.duplicate('r3', 'r1');
model.geom('part1').feature.copyTo('r3', 'geom1/r3', 'r1');
model.component('comp1').geom('geom1').feature.remove('r3');
model.geom('part1').feature.remove('r1');
model.component('comp1').geom('geom1').feature.duplicate('pt9', 'pt1');
model.component('comp1').geom('geom1').feature.duplicate('pt10', 'pt2');
model.component('comp1').geom('geom1').feature.duplicate('pt11', 'pt7');
model.component('comp1').geom('geom1').feature.duplicate('pt12', 'pt8');
model.geom('part1').feature.copyTo('pt9', 'geom1/pt9', 'r3');
model.component('comp1').geom('geom1').feature.remove('pt9');
model.geom('part1').feature.copyTo('pt10', 'geom1/pt10', 'pt9');
model.component('comp1').geom('geom1').feature.remove('pt10');
model.geom('part1').feature.copyTo('pt11', 'geom1/pt11', 'pt10');
model.component('comp1').geom('geom1').feature.remove('pt11');
model.geom('part1').feature.copyTo('pt12', 'geom1/pt12', 'pt11');
model.component('comp1').geom('geom1').feature.remove('pt12');
model.component('comp1').geom('geom1').feature.duplicate('r3', 'r2');
model.geom('part1').feature.copyTo('r4', 'geom1/r3', 'r3');
model.component('comp1').geom('geom1').feature.remove('r3');
model.component('comp1').geom('geom1').run;

model.component('comp1').material.duplicate('mat5', 'mat2');
model.material.copy('mat6', 'mat5', '');
model.material('mat6').set('sys', 'none');
model.component('comp1').material.remove('mat5');
model.material('mat6').tag('mat5');
model.material('mat5').label('Steel AISI 4340.1');
model.component('comp1').material.duplicate('mat6', 'mat3');
model.material.copy('mat7', 'mat6', '');
model.material('mat7').set('sys', 'none');
model.component('comp1').material.remove('mat6');
model.material('mat7').tag('mat6');
model.material('mat6').label('Polyethylene 1');

model.geom('part1').run('pt12');
model.geom('part1').feature('r4').set('pos', {'0' 'thickness'});
model.geom('part1').feature('r4').set('size', {'length' 'thickness_polymer'});
model.geom('part1').run('r4');
model.geom('part1').run('pt12');

model.component('comp1').view.duplicate('view6', 'view2');
model.view.copyToGeometry('view7', 'view6', 'part1');
model.component('comp1').view.remove('view6');
model.view('view7').tag('view6');
model.view('view6').label('Left Clip 1');
model.view.move('view6', 0);
model.component('comp1').view.duplicate('view7', 'view3');
model.view.copyToGeometry('view8', 'view7', 'part1');
model.component('comp1').view.remove('view7');
model.view('view8').tag('view7');
model.view('view7').label('Right Clip 1');
model.view.move('view7', 1);

model.geom('part1').feature('pt11').label('Left_touch_point');
model.geom('part1').feature('pt12').label('Right_touch_point');
model.geom('part1').feature('pt12').setIndex('p', 'thickness+thickness_polymer', 1);
model.geom('part1').feature('pt11').setIndex('p', 'thickness+thickness_polymer', 1);
model.geom('part1').run('pt12');
model.geom('part1').feature('r4').set('pos', {'0' 'thickness+sp'});
model.geom('part1').feature('pt11').setIndex('p', 'thickness+thickness_polymer+sp', 1);
model.geom('part1').feature('pt12').setIndex('p', 'thickness+thickness_polymer+sp', 1);
model.geom('part1').run('pt12');
model.component('comp1').geom('geom1').feature('r1').active(false);
model.component('comp1').geom('geom1').feature('pt1').active(false);
model.component('comp1').geom('geom1').feature('pt2').active(false);
model.component('comp1').geom('geom1').feature('pt7').active(false);
model.component('comp1').geom('geom1').feature('pt8').active(false);
model.component('comp1').geom('geom1').feature('uni2').active(false);
model.component('comp1').geom('geom1').feature('r2').active(false);
model.component('comp1').geom('geom1').feature('pt5').active(false);
model.component('comp1').geom('geom1').feature('pt6').active(false);
model.component('comp1').geom('geom1').feature('pt3').active(false);
model.component('comp1').geom('geom1').feature('pt4').active(false);
model.component('comp1').geom('geom1').feature('uni1').active(false);
model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').create('imp1', 'Import');
model.component('comp1').geom('geom1').feature('imp1').set('type', 'sequence');
model.component('comp1').geom('geom1').feature('imp1').set('sequence', 'part1');
model.component('comp1').geom('geom1').feature('imp1').importData;
model.component('comp1').geom('geom1').feature.duplicate('imp2', 'imp1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature.remove('imp2');
model.component('comp1').geom('geom1').run('imp1');
model.component('comp1').geom('geom1').create('mir2', 'Mirror');
model.component('comp1').geom('geom1').feature('mir2').selection('input').set({'imp1'});
model.component('comp1').geom('geom1').feature('mir2').set('keep', true);
model.component('comp1').geom('geom1').run('mir2');
model.component('comp1').geom('geom1').feature('mir2').set('axis', [0 1]);
model.component('comp1').geom('geom1').run('mir2');
model.geom('part1').feature.move('r4', 5);
model.geom('part1').run('r4');
model.component('comp1').geom('geom1').feature('imp1').active(false);
model.component('comp1').geom('geom1').feature('mir2').active(false);
model.component('comp1').geom('geom1').feature('r1').active(true);
model.component('comp1').geom('geom1').feature('pt1').active(true);
model.component('comp1').geom('geom1').feature('pt2').active(true);
model.component('comp1').geom('geom1').feature('pt7').active(true);
model.component('comp1').geom('geom1').feature('pt8').active(true);
model.component('comp1').geom('geom1').feature('uni2').active(true);
model.component('comp1').geom('geom1').feature('r2').active(true);
model.component('comp1').geom('geom1').feature('mir1').active(true);
model.component('comp1').geom('geom1').feature('pt5').active(true);
model.component('comp1').geom('geom1').feature('pt6').active(true);
model.component('comp1').geom('geom1').feature('pt3').active(true);
model.component('comp1').geom('geom1').feature('pt4').active(true);
model.component('comp1').geom('geom1').feature('uni1').active(true);
model.component('comp1').geom('geom1').feature('r2').active(false);
model.component('comp1').geom('geom1').feature('mir1').active(false);
model.component('comp1').geom('geom1').feature('pt5').active(false);
model.component('comp1').geom('geom1').feature('pt6').active(false);
model.component('comp1').geom('geom1').feature('pt3').active(false);
model.component('comp1').geom('geom1').feature('pt4').active(false);
model.component('comp1').geom('geom1').feature('uni1').active(false);
model.geom('part1').feature.duplicate('r5', 'r4');
model.component('comp1').geom('geom1').feature.copyTo('r5', 'part1/r5', 'r1');
model.geom('part1').feature.remove('r5');
model.geom.remove('part2');
model.component('comp1').geom('geom1').run('pt8');
model.component('comp1').geom('geom1').feature('pt7').setIndex('p', 'thickness+thickness_polymer+sp', 1);
model.component('comp1').geom('geom1').run('pt7');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature.move('r5', 5);
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').runPre('uni2');
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'pt1' 'pt2' 'pt7' 'pt8' 'r1' 'r5'});
model.component('comp1').geom('geom1').run('uni2');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature.move('r5', 1);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('pt7').label('Left_contact_point');
model.component('comp1').geom('geom1').feature('pt8').label('Right_contact_point');
model.component('comp1').geom('geom1').feature('pt8').label('Right_contact_point_btm');
model.component('comp1').geom('geom1').feature('r1').label('metal_sheet_btm');
model.component('comp1').geom('geom1').feature('r5').label('metal_sheet_tp');
model.component('comp1').geom('geom1').feature('r5').label('insulator_tp');
model.component('comp1').geom('geom1').feature('r2').label('metal_sheet_tp');
model.component('comp1').geom('geom1').feature.duplicate('r6', 'r5');
model.component('comp1').geom('geom1').feature.move('r6', 7);
model.component('comp1').geom('geom1').feature('pt7').label('Left_contact_point_btm');
model.component('comp1').geom('geom1').feature.duplicate('r7', 'r5');
model.component('comp1').geom('geom1').feature.remove('r7');
model.component('comp1').geom('geom1').feature('r6').label('insulator_btm');
model.component('comp1').geom('geom1').feature('r6').set('pos', {'0' 'thickness+thickness_polymer+sp*2'});

model.param.set('top_plate_y', 'thickness+2*thickness_polymer+3*sp');

model.component('comp1').view('view2').set('showmaterial', false);
model.component('comp1').view('view2').set('locked', false);

model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('r2').active(true);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature.remove('imp1');
model.component('comp1').geom('geom1').feature.remove('mir2');
model.component('comp1').geom('geom1').feature.remove('mir1');
model.component('comp1').geom('geom1').feature('pt5').setIndex('p', 'thickness+thickness_polymer+sp*2', 1);
model.component('comp1').geom('geom1').feature('pt5').label('Left_contact_point_tp');
model.component('comp1').geom('geom1').feature('pt6').setIndex('p', 'thickness+thickness_polymer+sp*2', 1);
model.component('comp1').geom('geom1').feature('pt6').label('Right_contact_point_tp');
model.component('comp1').geom('geom1').feature('pt5').active(true);
model.component('comp1').geom('geom1').feature('pt6').active(true);
model.component('comp1').geom('geom1').feature('pt3').active(true);
model.component('comp1').geom('geom1').feature('pt4').active(true);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('uni1').active(true);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').runPre('uni1');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt3' 'pt4' 'pt5' 'pt6' 'r2' 'r6'});
model.component('comp1').geom('geom1').run('uni1');

model.param.set('sp', '3e-5[m]');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').pair('p1').source.set([14]);
model.component('comp1').pair('p1').destination.set([6]);

model.component('comp1').view('view2').set('locked', true);
model.component('comp1').view('view3').set('locked', true);

model.component('comp1').pair('p2').source.set([22]);

model.component('comp1').geom('geom1').feature('pt8').setIndex('p', 'thickness+thickness_polymer+sp', 1);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').pair('p2').destination.set([10]);
model.component('comp1').pair.create('p5', 'Identity');
model.component('comp1').pair('p5').source.set([17]);
model.component('comp1').pair('p5').destination.set([15]);
model.component('comp1').pair('p5').label('Interface_Top');
model.component('comp1').pair.duplicate('p6', 'p5');
model.component('comp1').pair('p6').source.set([5]);
model.component('comp1').pair('p6').destination.set([3]);
model.component('comp1').pair('p6').label('Interface_btm');
model.component('comp1').pair('ap4').source.set([22]);
model.component('comp1').pair('ap4').destination.set([10]);

model.component('comp1').material('mat3').active(true);
model.component('comp1').material('mat3').selection.set([2 3]);
model.component('comp1').material('mat2').selection.set([1 4]);

model.component('comp1').physics('esbe').active(false);
model.component('comp1').physics('solid').feature('bndl2').active(false);
model.component('comp1').physics('solid').feature('rig2').label('Solid Connections _ Clips/Interfaces');
model.component('comp1').physics('solid').feature('rig2').set('pairs', {'p1' 'p2' 'p5' 'p6'});
model.component('comp1').physics('solid').feature('rig1').selection.set([8]);
model.component('comp1').physics('solid').feature('fix2').selection.set([20]);
model.component('comp1').physics('solid').feature('bndl1').selection.set([8]);
model.component('comp1').physics('solid').feature('gr1').selection.all;
model.component('comp1').physics('solid').create('cnt1', 'SolidContact', 1);
model.component('comp1').physics('solid').feature('cnt1').active(false);
model.component('comp1').physics('solid').feature('cnt1').set('pairs', {'ap4'});

model.component('comp1').pair('ap4').label('Contact surfaces');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000052545329046');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000052545329046');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.param.set('sp', '0[m]');

model.component('comp1').geom('geom1').run('fin');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('solid').feature.duplicate('rig3', 'rig2');
model.component('comp1').physics('solid').feature.move('rig3', 7);
model.component('comp1').physics('solid').feature('rig3').label('Solid Connections _ Interfaces');
model.component('comp1').physics('solid').feature('rig3').set('pairs', {'p5' 'p6'});
model.component('comp1').physics('solid').feature('rig2').set('pairs', {'p1' 'p2'});
model.component('comp1').physics('solid').feature('rig2').label('Solid Connections _ Clips');

model.component('comp1').mesh('mesh1').autoMeshSize(3);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').autoMeshSize(5);
model.component('comp1').mesh('mesh1').run;

model.param.set('sp', '2e-5[m]');

model.component('comp1').geom('geom1').run;

model.component('comp1').pair('p5').source.set([17]);
model.component('comp1').pair('p5').destination.set([15]);
model.component('comp1').pair('p6').source.set([5]);
model.component('comp1').pair('p6').destination.set([3]);

model.param.set('sp', '0e-5[m]');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').physics('solid').feature('rig3').active(false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').pair('p5').active(false);
model.component('comp1').pair('p6').active(false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result.create('pg4', 'PlotGroup1D');
model.result('pg4').run;
model.result('pg4').create('lngr1', 'LineGraph');
model.result('pg4').feature('lngr1').selection.set([17]);
model.result('pg4').feature('lngr1').set('expr', 'v');
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature.duplicate('lngr2', 'lngr1');
model.result('pg4').run;

model.component('comp1').view('view3').set('hidestatus', 'ignore');
model.component('comp1').view('view3').hideEntities.create('hide1');
model.component('comp1').view('view3').hideEntities('hide1').geom(2);
model.component('comp1').view('view3').hideEntities('hide1').add([3]);
model.component('comp1').view('view3').set('hidestatus', 'hide');

model.result('pg4').run;
model.result('pg4').feature('lngr2').selection.set([6]);

model.component('comp1').view('view3').set('hidestatus', 'ignore');

model.result('pg4').run;

model.label('ez_actuator_with_filling.mph');

model.result('pg4').run;

model.study('std1').feature('stat').set('useloadcase', true);
model.study('std1').feature('stat').setIndex('loadcase', 'Load case 1', 0);
model.study('std1').feature('stat').setIndex('loadcase', 'Load case 1', 0);
model.study('std1').feature('stat').set('useloadcase', false);
model.study('std1').feature('stat').set('plotgroup', 'pg4');
model.study('std1').feature('stat').set('useadvanceddisable', true);

model.component('comp1').physics('solid').feature('cnt1').active(true);

model.study('std1').feature('stat').set('disabledphysics', {'solid/cnt1'});

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.study('std2').feature('stat').set('useadvanceddisable', true);
model.study('std2').feature('stat').set('disabledphysics', {'solid/cnt1'});
model.study('std2').feature('stat').set('useadvanceddisable', true);

model.component('comp1').physics('esbe').active(true);

model.component('comp1').selection('sel2').set([14 15 16 18 19 22]);
model.component('comp1').selection('sel3').set([1 2 4 7 8 10]);

model.component('comp1').physics('esbe').selection.set([0 2 3]);

model.study('std2').feature('time').set('tlist', 'range(0,1e-4,1e-3)');
model.study('std2').feature('stat').set('useadvanceddisable', true);

model.sol('sol2').study('std2');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('t1');
model.sol('sol2').attach('std2');
model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');
model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.label('ez_actuator_with_filling.mph');

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.study('std2').feature('stat').set('disabledphysics', {'solid/cnt1' 'esbe'});

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.component('comp1').physics('solid').feature('bndl2').selection.named('sel2');
model.component('comp1').physics('solid').feature('bndl2').selection.named('sel3');
model.component('comp1').physics('solid').feature('bndl2').label('Electrostatic Force over bottom metal plate');
model.component('comp1').physics('solid').feature.duplicate('bndl3', 'bndl2');
model.component('comp1').physics('solid').feature.move('bndl3', 10);
model.component('comp1').physics('solid').feature('bndl3').selection.named('geom1_uni1_bnd');
model.component('comp1').physics('solid').feature('bndl3').label('Electrostatic Force over top metal plate');
model.component('comp1').physics('solid').feature('bndl3').selection.named('sel2');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('disabledphysics', {'solid/cnt1' 'esbe'});

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg4').run;

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.study('std2').feature('stat').set('disabledphysics', {'solid/cnt1' 'esbe'});

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.component('comp1').physics('solid').feature('rig3').feature.remove('crb1');
model.component('comp1').physics('solid').feature('rig3').feature.remove('cre1');
model.component('comp1').physics('solid').feature('rig3').feature.remove('crp1');

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.component('comp1').physics('solid').feature('rig3').create('terc1', 'ThermalExpansionRC', 1);

model.study('std2').feature('time').active(false);

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'on');
model.study('std2').feature('time').set('notsolhide', 'on');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');
model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'on');
model.study('std2').feature('time').set('notsolhide', 'on');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');

model.sol('sol2').attach('std2');

model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset2');
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', {'solid.mises'});
model.result('pg5').label('Stress (solid) 1');
model.result('pg5').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg5').feature('surf1').set('resolution', 'normal');
model.result('pg5').feature('surf1').create('def', 'Deform');
model.result('pg5').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg5').feature('surf1').feature('def').set('scale', '1');
model.result('pg5').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg5').feature('surf1').feature('def').set('descr', 'Displacement field');

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg5');

model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').set('data', 'dset2');
model.result('pg6').label('Volume Loads (solid) 1');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg6');

model.result('pg6').set('showlegends', true);
model.result('pg6').set('titletype', 'custom');
model.result('pg6').set('typeintitle', false);
model.result('pg6').set('descriptionintitle', false);
model.result('pg6').set('unitintitle', false);
model.result('pg6').set('frametype', 'spatial');
model.result('pg6').set('showlegendsunit', true);
model.result('pg6').create('surf1', 'Surface');
model.result('pg6').feature('surf1').set('expr', {'1'});
model.result('pg6').feature('surf1').label('Gray Surfaces');
model.result('pg6').feature('surf1').set('coloring', 'uniform');
model.result('pg6').feature('surf1').set('color', 'gray');
model.result('pg6').feature('surf1').active(false);
model.result('pg6').feature('surf1').create('def', 'Deform');
model.result('pg6').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg6').feature('surf1').feature('def').set('scale', 1);
model.result('pg6').create('arws1', 'ArrowSurface');
model.result('pg6').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg6').feature('arws1').set('placement', 'gausspoints');
model.result('pg6').feature('arws1').set('arrowbase', 'tail');
model.result('pg6').feature('arws1').label('Gravity 1');
model.result('pg6').feature.move('surf1', 1);
model.result('pg6').feature('arws1').set('inheritplot', 'none');
model.result('pg6').feature('arws1').create('col', 'Color');
model.result('pg6').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg6').feature('arws1').feature('col').set('colortable', 'Spectrum');
model.result('pg6').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg6').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg6').feature('arws1').set('color', 'magenta');
model.result('pg6').feature('arws1').create('def', 'Deform');
model.result('pg6').feature('arws1').feature('def').set('expr', {'u' 'v'});
model.result('pg6').feature('arws1').feature('def').set('descr', 'Displacement field');
model.result('pg6').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg6').feature('arws1').feature('def').set('scale', 1);

model.nodeGroup('dset2solidlgrp').placeAfter('plotgroup', 'pg5');

model.result.create('pg7', 'PlotGroup2D');
model.result('pg7').set('data', 'dset2');
model.result('pg7').label('Boundary Loads (solid) 1');

model.nodeGroup('dset2solidlgrp').add('plotgroup', 'pg7');

model.result('pg7').set('showlegends', true);
model.result('pg7').set('titletype', 'custom');
model.result('pg7').set('typeintitle', false);
model.result('pg7').set('descriptionintitle', false);
model.result('pg7').set('unitintitle', false);
model.result('pg7').set('frametype', 'spatial');
model.result('pg7').set('showlegendsunit', true);
model.result('pg7').create('surf1', 'Surface');
model.result('pg7').feature('surf1').set('expr', {'1'});
model.result('pg7').feature('surf1').label('Gray Surfaces');
model.result('pg7').feature('surf1').set('coloring', 'uniform');
model.result('pg7').feature('surf1').set('color', 'gray');
model.result('pg7').feature('surf1').active(false);
model.result('pg7').feature('surf1').create('def', 'Deform');
model.result('pg7').feature('surf1').feature('def').set('expr', {'u' 'v'});
model.result('pg7').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg7').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg7').feature('surf1').feature('def').set('scale', 1);
model.result('pg7').create('arwl1', 'ArrowLine');
model.result('pg7').feature('arwl1').set('expr', {'solid.bndl1.F_Ax' 'solid.bndl1.F_Ay'});
model.result('pg7').feature('arwl1').set('placement', 'gausspoints');
model.result('pg7').feature('arwl1').set('arrowbase', 'tail');
model.result('pg7').feature('arwl1').label('Load');
model.result('pg7').feature.move('surf1', 1);
model.result('pg7').feature('arwl1').set('inheritplot', 'none');
model.result('pg7').feature('arwl1').create('col', 'Color');
model.result('pg7').feature('arwl1').feature('col').set('expr', 'comp1.solid.bndl1.F_A_Mag');
model.result('pg7').feature('arwl1').feature('col').set('colortable', 'Spectrum');
model.result('pg7').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg7').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg7').feature('arwl1').set('color', 'red');
model.result('pg7').feature('arwl1').create('def', 'Deform');
model.result('pg7').feature('arwl1').feature('def').set('expr', {'u' 'v'});
model.result('pg7').feature('arwl1').feature('def').set('descr', 'Displacement field');
model.result('pg7').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg7').feature('arwl1').feature('def').set('scale', 1);

model.sol('sol2').runAll;

model.result('pg5').run;

model.study('std2').feature('time').active(true);

model.sol('sol2').updateSolution;

model.result('pg5').run;

model.sol('sol2').updateSolution;

model.result('pg5').run;

model.component('comp1').physics('solid').feature('bndl2').active(true);
model.component('comp1').physics('solid').feature('bndl3').active(true);

model.sol('sol2').updateSolution;

model.result('pg5').run;
model.result('pg5').set('data', 'dset1');
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').set('data', 'dset2');
model.result('pg5').run;
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg5');
model.result('pg4').run;
model.result('pg4').set('data', 'dset2');
model.result('pg4').run;

model.sol('sol2').study('std2');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').attach('std2');

model.study('std2').setStoreSolution(true);

model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');

model.component('comp1').physics('esbe').feature.duplicate('ccn2', 'ccn1');
model.component('comp1').physics('esbe').feature.move('ccn2', 3);
model.component('comp1').physics('esbe').feature('ccn2').label('Charge Conservation 2: Air');
model.component('comp1').physics('esbe').feature('ccn2').label('Charge Conservation 2');
model.component('comp1').physics('esbe').feature('ccn1').label('Charge Conservation 1: Air');
model.component('comp1').physics('esbe').feature('ccn2').label('Charge Conservation 2: Dielectric');
model.component('comp1').physics('esbe').feature('ccn2').selection.set([2 3]);

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'on');
model.study('std2').feature('time').set('notsolhide', 'on');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');
model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');
model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('predictor', 'constant');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.study('std2').feature('stat').set('disabledphysics', {'solid/cnt1' 'esbe' 'solid/bndl2' 'solid/bndl3'});

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset5');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('predictor', 'constant');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').set('data', 'dset3');
model.result('pg4').run;
model.result('pg4').set('data', 'dset2');
model.result('pg4').run;

model.component('comp1').mesh('mesh1').autoMeshSize(7);
model.component('comp1').mesh('mesh1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset5');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('predictor', 'constant');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.component('comp1').mesh('mesh1').automatic(false);
model.component('comp1').mesh('mesh1').feature('ftri1').active(false);
model.component('comp1').mesh('mesh1').create('map1', 'Map');
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature.remove('ftri1');
model.component('comp1').mesh('mesh1').create('map2', 'Map');
model.component('comp1').mesh('mesh1').feature('map1').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 5);
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').selection.set([12]);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('type', 'predefined');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('method', 'geometric');
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('elemratio', 2);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').selection.set([3 12]);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('reverse', true);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('symmetric', true);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').selection.set([12]);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature.duplicate('dis2', 'dis1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').selection.set([3]);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('reverse', false);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('symmetric', false);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis2').set('reverse', true);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('symmetric', false);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis1').set('reverse', false);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').set('adjustedgdistr', true);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').set('adjustedgdistr', false);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').set('adjustedgdistr', true);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').create('dis3', 'Distribution');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').selection.set([14]);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').set('numelem', 3);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').set('type', 'predefined');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').set('elemratio', 2);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').set('elemcount', 3);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis3').set('elemratio', 2.5);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').feature.duplicate('dis4', 'dis3');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis4').selection.set([1]);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis4').set('reverse', true);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').create('dis5', 'Distribution');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis5').selection.set([2 4 15 16]);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis5').set('numelem', 'length/1e-5');
model.component('comp1').mesh('mesh1').feature('map1').feature.duplicate('dis6', 'dis5');
model.component('comp1').mesh('mesh1').feature('map1').feature('dis6').selection.set([4 15]);
model.component('comp1').mesh('mesh1').feature('map1').feature.move('dis6', 4);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis5').selection.set([2 16]);
model.component('comp1').mesh('mesh1').feature('map1').feature('dis5').active(false);
model.component('comp1').mesh('mesh1').run('map1');

model.study('std2').setGenPlots(false);

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset5');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('predictor', 'constant');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol2').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol2').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.result.dataset.remove('dset2');

model.label('ez_actuator_with_filling_rectangular_mesh_out_of_memory.mph');

model.result.create('pg4', 'PlotGroup1D');
model.result('pg4').run;
model.result('pg4').create('lngr1', 'LineGraph');
model.result('pg4').feature('lngr1').selection.set([17 20]);
model.result('pg4').run;
model.result('pg1').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('lngr1').selection.set([13 17 20]);
model.result('pg4').run;
model.result('pg4').feature.duplicate('lngr2', 'lngr1');
model.result('pg4').run;
model.result('pg4').feature('lngr2').selection.set([13 20]);

model.component('comp1').view('view2').set('hidestatus', 'ignore');
model.component('comp1').view('view2').hideEntities.create('hide1');
model.component('comp1').view('view2').hideEntities('hide1').geom(2);
model.component('comp1').view('view2').hideEntities('hide1').add([3]);
model.component('comp1').view('view2').set('hidestatus', 'showonlyhidden');

model.result('pg4').feature('lngr2').selection.set([13 17 20]);

model.component('comp1').view('view2').set('hidestatus', 'hide');

model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('lngr1').set('expr', 'v');
model.result('pg4').run;
model.result('pg4').feature('lngr2').set('expr', 'v');
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('lngr2').selection.set([5 13 17]);
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('lngr2').selection.set([4]);
model.result('pg4').run;
model.result('pg4').feature('lngr1').selection.set([15]);
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;

model.label('ez_actuator_with_filling_rectangular_mesh_out_of_memory.mph');

model.result('pg4').run;
model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('min1', 'MinLine');
model.result.evaluationGroup('eg1').feature('min1').selection.set([2]);
model.result.evaluationGroup('eg1').feature('min1').setIndex('expr', 'v', 0);
model.result.evaluationGroup('eg1').run;
model.result.evaluationGroup('eg1').feature('min1').set('data', 'dset1');
model.result.evaluationGroup('eg1').run;
model.result.evaluationGroup('eg1').feature('min1').set('data', 'parent');
model.result.evaluationGroup('eg1').run;
model.result('pg4').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;

model.component('comp1').view('view2').hideObjects.clear;
model.component('comp1').view('view2').hideEntities.clear;
model.component('comp1').view('view2').hideMesh.clear;

model.study('std1').feature('stat').set('useparam', true);
model.study('std1').feature('stat').setIndex('pname', 'weight_mas', 0);
model.study('std1').feature('stat').setIndex('punit', 'g', 0);
model.study('std1').feature('stat').setIndex('plistarr', '0,6,10,20,50,100,200', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('control', 'stat');
model.sol('sol1').feature('s1').set('control', 'stat');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('disabledphysics', {'solid/cnt1' 'esbe' 'solid/bndl2' 'solid/bndl3'});

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('control', 'stat');
model.sol('sol1').feature('s1').set('control', 'stat');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.param.set('weight_mas', '20[g]');

model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('lngr1').set('unit', 'mm');
model.result('pg4').run;
model.result('pg4').feature('lngr2').set('unit', 'mm');
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').set('legendpos', 'lowerleft');
model.result('pg4').run;
model.result('pg4').feature('lngr1').set('legend', true);
model.result('pg4').run;
model.result('pg4').run;

model.label('ez_actuator_with_filling_rectangular_mesh_out_of_memory.mph');

model.result('pg4').run;

model.study('std2').feature('time').set('useadvanceddisable', true);
model.study('std2').feature('time').set('disabledphysics', {'solid/cnt1'});

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset5');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.result.dataset.create('dset4', 'Solution');
model.result.dataset('dset4').set('solution', 'sol2');

model.component('comp1').mesh.remove('mesh1');
model.component('comp1').mesh.create('mesh1');

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.component('comp1').mesh('mesh1').autoMeshSize(9);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh.create('mesh2');
model.component('comp1').mesh('mesh2').create('map1', 'Map');
model.component('comp1').mesh('mesh2').feature('map1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').create('map1', 'Map');
model.component('comp1').mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('map1').selection.set([1 4]);
model.component('comp1').mesh('mesh1').feature('map1').label('Metal mesh');
model.component('comp1').mesh('mesh1').label('Metal mesh');
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 7);
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh2').feature('map1').selection.set([2 3]);
model.component('comp1').mesh('mesh2').feature('map1').label('Insulator Mesh');
model.component('comp1').mesh('mesh2').label('Insulator Mesh');
model.component('comp1').mesh('mesh2').automatic(true);
model.component('comp1').mesh('mesh2').automatic(false);
model.component('comp1').mesh('mesh2').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.component('comp1').mesh('mesh2').feature('size').set('hauto', 2);
model.component('comp1').mesh('mesh2').run('size');
model.component('comp1').mesh('mesh2').run('map1');
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh2').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.study('std2').feature('stat').set('disabledphysics', {'solid/cnt1' 'solid/bndl2' 'solid/bndl3' 'esbe'});

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.component('comp1').mesh.create('mesh3');
model.component('comp1').mesh.create('mesh4');
model.component('comp1').mesh.remove('mesh4');
model.component('comp1').mesh.move('mesh3', 0);
model.component('comp1').mesh('mesh1').feature('map1').active(false);
model.component('comp1').mesh('mesh2').feature('map1').active(false);
model.component('comp1').mesh('mesh3').run;

model.study('std2').feature('time').mglevel.create('mgl1');
model.study('std2').feature('time').mglevel('mgl1').setIndex('mesh', 'mesh3', 1);

model.component('comp1').mesh.remove('mesh1');
model.component('comp1').mesh.remove('mesh2');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('control', 'stat');
model.sol('sol1').feature('s1').set('control', 'stat');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study('std1').feature('stat').set('useparam', false);

model.param.set('weight_mas', '200[g]');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.study('std2').feature('time').set('plot', true);
model.study('std2').feature('time').set('disabledphysics', {'solid/cnt1' 'solid/bndl3'});

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol3').copySolution('sol4');

model.result.dataset('dset3').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v2');
model.sol('sol2').feature.remove('st2');
model.sol('sol2').feature.remove('su1');
model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol4').copySolution('sol3');
model.sol.remove('sol4');
model.sol('sol3').label('Solution Store 1');

model.result.dataset.remove('dset6');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').create('su1', 'StoreSolution');
model.sol('sol2').feature('su1').set('sol', 'sol3');
model.sol('sol2').feature('su1').label('Solution Store 1');
model.sol('sol2').create('st2', 'StudyStep');
model.sol('sol2').feature('st2').set('study', 'std2');
model.sol('sol2').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol3');
model.study('std2').feature('time').set('initsoluse', 'sol3');

model.sol('sol2').create('v2', 'Variables');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol2').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.11000028409054226');
model.sol('sol2').feature('v2').set('initmethod', 'sol');
model.sol('sol2').feature('v2').set('initsol', 'sol2');
model.sol('sol2').feature('v2').set('initsoluse', 'su1');
model.sol('sol2').feature('v2').set('notsolmethod', 'sol');
model.sol('sol2').feature('v2').set('notsol', 'sol2');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol2').feature('t1').set('plot', 'on');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('t1').create('seDef', 'Segregated');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').feature('t1').feature.remove('seDef');

model.result.dataset('dset3').set('solution', 'sol3');

model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol2').feature('v2').set('notsolnum', 'auto');
model.sol('sol2').feature('v2').set('control', 'time');
model.sol('sol2').attach('std2');

model.study('std1').feature('stat').set('useadvanceddisable', false);
model.study.remove('std1');

model.sol.remove('sol2');

model.study('std2').feature('time').mglevel.remove('mgl1');
model.study('std2').feature('time').set('useadvanceddisable', false);

model.label('ez_actuator_no_results.mph');

model.study('std2').label('Study 1');

model.component('comp1').geom('geom1').run('uni1');
model.component('comp1').geom('geom1').create('r7', 'Rectangle');
model.component('comp1').geom('geom1').feature('r7').set('size', {'length/2' '1'});
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('r7').set('size', {'length/2' 'length/10'});
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('r7').set('size', {'length/2' 'length/20'});
model.component('comp1').geom('geom1').feature('r7').set('pos', {'0' '-length/40'});
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('r7').set('pos', {'length/2' '-length/40'});
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'r7'});
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'uni1' 'uni2'});
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run;

model.component('comp1').physics('solid').create('sym1', 'SymmetrySolid', 1);
model.component('comp1').physics('solid').feature('sym1').selection.set([13 14 15 16]);
model.component('comp1').physics('esbe').prop('Symmetry').set('sym1', 'even');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym1plane', 'length/2');

model.component('comp1').mesh('mesh3').automatic(false);
model.component('comp1').mesh('mesh3').feature('ftri1').active(false);
model.component('comp1').mesh('mesh3').feature.remove('ftri1');
model.component('comp1').mesh('mesh3').create('bl1', 'BndLayer');
model.component('comp1').mesh('mesh3').feature('bl1').create('blp', 'BndLayerProp');
model.component('comp1').mesh('mesh3').feature.remove('bl1');
model.component('comp1').mesh('mesh3').create('map1', 'Map');
model.component('comp1').mesh('mesh3').run;
model.component('comp1').mesh('mesh3').feature('map1').set('adjustedgdistr', true);
model.component('comp1').mesh('mesh3').run;
model.component('comp1').mesh('mesh3').feature('size').set('hauto', 2);
model.component('comp1').mesh('mesh3').run;
model.component('comp1').mesh('mesh3').feature('map1').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh3').feature('map1').feature('dis1').selection.set([13 14 15 16]);
model.component('comp1').mesh('mesh3').feature('map1').feature('dis1').set('numelem', 2);
model.component('comp1').mesh('mesh3').run;

model.sol.create('sol1');
model.sol('sol1').study('std2');
model.sol('sol1').attach('std2');

model.component('comp1').geom('geom1').runPre('fin');

model.component('comp1').pair('p1').source.set([6]);
model.component('comp1').pair('p1').destination.set([6]);

model.component('comp1').geom('geom1').run('dif1');
model.component('comp1').geom('geom1').create('spl1', 'Split');
model.component('comp1').geom('geom1').feature('spl1').selection('input').set({'dif1'});
model.component('comp1').geom('geom1').run('spl1');
model.component('comp1').geom('geom1').run;

model.component('comp1').pair('p1').source.remove([12]);
model.component('comp1').pair('p1').destination.remove([8]);
model.component('comp1').pair.remove('ap3');
model.component('comp1').pair.remove('p2');
model.component('comp1').pair.remove('ap4');
model.component('comp1').pair.remove('p5');
model.component('comp1').pair.remove('p6');
model.component('comp1').pair('ap7').manualSelection(true);
model.component('comp1').pair('ap7').type('Contact');
model.component('comp1').pair('ap8').manualSelection(true);
model.component('comp1').pair('ap8').type('Contact');
model.component('comp1').pair('ap7').type('Identity');
model.component('comp1').pair('ap8').type('Identity');

model.component('comp1').physics('solid').create('cont1', 'Continuity', 1);
model.component('comp1').physics('solid').feature('cont1').set('pairs', {'ap7' 'ap8'});
model.component('comp1').physics('solid').feature.remove('rig3');

model.component('comp1').pair.create('p9', 'Contact');
model.component('comp1').pair('p9').source.set([9 14]);
model.component('comp1').pair('p9').label('Contact Surfaces');

model.component('comp1').physics('solid').feature('cnt1').set('pairs', {'p9'});
model.component('comp1').physics('solid').feature.remove('rig2');
model.component('comp1').physics('solid').feature('cont1').set('pairs', {'ap7' 'ap8' 'p1'});

model.sol.remove('sol1');
model.sol.create('sol1');
model.sol('sol1').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std2');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').create('su1', 'StoreSolution');
model.sol('sol1').create('st2', 'StudyStep');
model.sol('sol1').feature('st2').set('study', 'std2');
model.sol('sol1').feature('st2').set('studystep', 'time');
model.sol('sol1').create('v2', 'Variables');
model.sol('sol1').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v2').set('initmethod', 'sol');
model.sol('sol1').feature('v2').set('initsol', 'sol1');
model.sol('sol1').feature('v2').set('initsoluse', 'su1');
model.sol('sol1').feature('v2').set('notsolmethod', 'sol');
model.sol('sol1').feature('v2').set('notsol', 'sol1');
model.sol('sol1').feature('v2').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol1').feature('t1').set('plot', 'on');
model.sol('sol1').feature('t1').set('plotgroup', 'Default');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('predictor', 'constant');
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('t1').create('seDef', 'Segregated');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol1').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol1').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol1').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol1').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').feature('t1').feature.remove('seDef');
model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol1').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('control', 'time');
model.sol('sol1').attach('std2');

model.component('comp1').pair('p9').source.remove([14]);
model.component('comp1').pair('p9').destination.set([14]);

model.sol('sol1').study('std2');

model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolvertype', 'solnum');
model.study('std2').feature('time').set('notlistsolnum', {'1'});
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('notsolnumhide', 'off');
model.study('std2').feature('time').set('notstudyhide', 'off');
model.study('std2').feature('time').set('notsolhide', 'off');
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'auto');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'off');
model.study('std2').feature('time').set('initsolhide', 'off');

model.sol('sol2').copySolution('sol3');

model.result.dataset('dset2').set('solution', 'none');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');
model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', 'auto');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'auto');

model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v2');
model.sol('sol1').feature.remove('st2');
model.sol('sol1').feature.remove('su1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol3').copySolution('sol2');
model.sol.remove('sol3');
model.sol('sol2').label('Solution Store 1');

model.result.dataset.remove('dset4');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std2');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v1').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature('fc1').set('termonres', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('reserrfact', 1000);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').create('su1', 'StoreSolution');
model.sol('sol1').feature('su1').set('sol', 'sol2');
model.sol('sol1').feature('su1').label('Solution Store 1');
model.sol('sol1').create('st2', 'StudyStep');
model.sol('sol1').feature('st2').set('study', 'std2');
model.sol('sol1').feature('st2').set('studystep', 'time');

model.study('std2').feature('time').set('notsoluse', 'sol2');
model.study('std2').feature('time').set('initsoluse', 'sol2');

model.sol('sol1').create('v2', 'Variables');
model.sol('sol1').feature('v2').feature('comp1_solid_uv_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_solid_phi_rig1').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol1').feature('v2').feature('comp1_solid_uv_rig1').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v2').feature('comp1_solid_phi_rig1').set('scaleval', '1e-2');
model.sol('sol1').feature('v2').feature('comp1_u').set('scaleval', '1e-2*0.055000568178883394');
model.sol('sol1').feature('v2').set('initmethod', 'sol');
model.sol('sol1').feature('v2').set('initsol', 'sol1');
model.sol('sol1').feature('v2').set('initsoluse', 'su1');
model.sol('sol1').feature('v2').set('notsolmethod', 'sol');
model.sol('sol1').feature('v2').set('notsol', 'sol1');
model.sol('sol1').feature('v2').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-4,1e-3)');
model.sol('sol1').feature('t1').set('plot', 'on');
model.sol('sol1').feature('t1').set('plotgroup', 'Default');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('predictor', 'constant');
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('t1').create('seDef', 'Segregated');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol1').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol1').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature('fc1').set('ntolfact', 1);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 4);
model.sol('sol1').feature('t1').feature('fc1').set('ntermauto', 'tol');
model.sol('sol1').feature('t1').feature('fc1').set('minstep', 1.0E-4);
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').feature('t1').feature.remove('seDef');

model.result.dataset('dset2').set('solution', 'sol2');

model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('notsolvertype', 'solnum');
model.sol('sol1').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('notlistsolnum', {'1'});
model.sol('sol1').feature('v2').set('notsolnum', 'auto');
model.sol('sol1').feature('v2').set('control', 'time');
model.sol('sol1').attach('std2');

model.component('comp1').physics('solid').feature('rig1').create('rf1', 'RigidBodyForce', -1);
model.component('comp1').physics('solid').feature('rig1').feature('rf1').set('Ft', {'0' '-load' '0'});
model.component('comp1').physics('solid').feature.remove('bndl1');

model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'const');
model.sol('sol1').feature('s1').feature('fc1').set('stabacc', 'aacc');

model.label('ez_actuator_no_results_updated (1).mph');

model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'const');
model.sol('sol1').feature('t1').feature('fc1').set('stabacc', 'aacc');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'onevery');

model.component('comp1').physics('solid').prop('StructuralTransientBehavior').set('StructuralTransientBehavior', 'IncludeInertia');

model.sol('sol1').feature('t1').set('timemethod', 'genalpha');
model.sol('sol1').feature('t1').set('tstepsgenalpha', 'intermediate');

model.component('comp1').func.create('step1', 'Step');
model.component('comp1').func('step1').set('smooth', '1e-4');
model.component('comp1').func('step1').set('location', '1e-4/2');

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('voltage', '6e3[V]*step1(t[1/s])');

model.param.remove('voltage');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').create('def1', 'Deform');
model.result('pg1').run;
model.result('pg1').feature('surf1').feature('def1').set('scaleactive', true);
model.result('pg1').feature('surf1').feature('def1').set('scale', 1);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').label('Displacement (solid)');
model.result('pg1').run;
model.result('pg1').run;

model.study('std2').feature('time').set('tlist', 'range(0,1e-5,1e-3)');
model.study('std2').feature('time').set('plotfreq', 'tsteps');

model.sol('sol1').feature('t1').feature('fc1').set('plot', true);
model.sol('sol1').clearSolutionData;
model.sol('sol2').clearSolutionData;
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 50);
model.sol('sol1').feature('s1').feature('fc1').set('aaccdim', 50);

model.result('pg1').run;

model.nodeGroup('dset3solidlgrp').label('Applied Loads (solid) ');

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.label('ez_actuator_no_results_updated_2.mph');

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').set('data', 'dset2');
model.result('pg1').run;
model.result('pg1').feature('surf1').set('data', 'dset1');
model.result('pg1').feature('surf1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').feature('surf1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').run;

model.study('std2').feature('time').set('tlist', 'range(0,1e-9,1e-8)');

model.sol('sol1').updateSolution;

model.result('pg1').run;

model.param.set('voltage', '12000[V]');

model.sol('sol1').updateSolution;

model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.study('std2').feature('time').set('tlist', 'range(0,1e-8,1e-7)');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.param.set('voltage', '12e4[V]');

model.sol('sol1').updateSolution;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 2, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 3, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 4, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 6, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 7, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 10, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 9, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 8, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 11, 0);
model.result('pg1').run;
model.result('pg1').run;
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg1');
model.result.export('anim1').run;
model.result.export('anim1').set('showframe', 10);
model.result.export('anim1').run;
model.result.export('anim1').set('showframe', 1);

model.study('std2').feature('time').set('tlist', 'range(0,1e-8,1e-5)');

out = model;
