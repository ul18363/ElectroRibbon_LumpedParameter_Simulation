function out = model
%
% ER.m
%
% Model exported on Jul 13 2020, 16:46 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Docker\Documents\Repo\DISSERTATION\Mechanical_Simulation\Mass Spring Models\10_MATLAB_Electromechanics_full_symmetry\COMSOL files\Mechanical_Good');

model.label('ER.mph');

model.param.set('clip_l', '0.001[m]');
model.param.set('base_l', '0.001[m]');
model.param.set('L', '0.1[m]');
model.param.set('w', '0.0127[m]');
model.param.set('t', '50e-6[m]');
model.param.set('mass', '0.02[kg]');
model.param.set('L_tot', 'L+base_l+2*clip_l');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('min1', 'MinLine');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', {'L_tot' 't'});
model.component('comp1').geom('geom1').create('pt1', 'Point');
model.component('comp1').geom('geom1').feature('pt1').label('l_clip');
model.component('comp1').geom('geom1').feature('pt1').set('p', {'clip_l' 't'});
model.component('comp1').geom('geom1').create('pt2', 'Point');
model.component('comp1').geom('geom1').feature('pt2').label('r_clip');
model.component('comp1').geom('geom1').feature('pt2').set('p', {'L_tot-clip_l' 't'});
model.component('comp1').geom('geom1').create('pt3', 'Point');
model.component('comp1').geom('geom1').feature('pt3').label('base_l');
model.component('comp1').geom('geom1').feature('pt3').set('p', {'(L_tot-base_l)/2' '0'});
model.component('comp1').geom('geom1').create('pt4', 'Point');
model.component('comp1').geom('geom1').feature('pt4').label('base_r');
model.component('comp1').geom('geom1').feature('pt4').set('p', {'(L_tot+base_l)/2' '0'});
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'pt1' 'pt2' 'pt3' 'pt4' 'r1'});
model.component('comp1').geom('geom1').create('pt6', 'Point');
model.component('comp1').geom('geom1').feature('pt6').label('fix_r');
model.component('comp1').geom('geom1').feature('pt6').set('p', {'(L_tot+base_l)/2' '2*t'});
model.component('comp1').geom('geom1').create('pt5', 'Point');
model.component('comp1').geom('geom1').feature('pt5').label('fix_l');
model.component('comp1').geom('geom1').feature('pt5').set('p', {'(L_tot-base_l)/2' '2*t'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 't'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'L_tot' 't'});
model.component('comp1').geom('geom1').create('pt7', 'Point');
model.component('comp1').geom('geom1').feature('pt7').label('l_clip 1');
model.component('comp1').geom('geom1').feature('pt7').set('p', {'clip_l' 't'});
model.component('comp1').geom('geom1').create('pt8', 'Point');
model.component('comp1').geom('geom1').feature('pt8').label('r_clip 1');
model.component('comp1').geom('geom1').feature('pt8').set('p', {'L_tot-clip_l' 't'});
model.component('comp1').geom('geom1').create('uni2', 'Union');
model.component('comp1').geom('geom1').feature('uni2').selection('input').set({'pt5' 'pt6' 'pt7' 'pt8' 'r2'});
model.component('comp1').geom('geom1').feature('fin').label('Form Assembly');
model.component('comp1').geom('geom1').feature('fin').set('action', 'assembly');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 0, {'exterior'});

model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').set([2]);

model.component('comp1').pair.create('p1', 'Identity');
model.component('comp1').pair('p1').source.set([10]);
model.component('comp1').pair('p1').destination.set([3]);
model.component('comp1').pair.create('p2', 'Identity');
model.component('comp1').pair('p2').source.set([15]);
model.component('comp1').pair('p2').destination.set([7]);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('gr1', 'Gravity', 2);
model.component('comp1').physics('solid').feature('gr1').selection.set([1 2]);
model.component('comp1').physics('solid').create('free2', 'Free', 1);
model.component('comp1').physics('solid').feature('free2').selection.set([4 12]);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([13]);
model.component('comp1').physics('solid').create('adm1', 'AddedMass1', 1);
model.component('comp1').physics('solid').feature('adm1').selection.set([5]);
model.component('comp1').physics('solid').create('cont1', 'Continuity', 1);
model.component('comp1').physics('solid').create('rig1', 'RigidConnector', 1);
model.component('comp1').physics('solid').feature('rig1').selection.set([5]);

model.component('comp1').mesh('mesh1').autoMeshSize(1);

model.component('comp1').view('view1').axis.set('xmin', 0.04543911665678024);
model.component('comp1').view('view1').axis.set('xmax', 0.061248764395713806);
model.component('comp1').view('view1').axis.set('ymin', -0.008145295083522797);
model.component('comp1').view('view1').axis.set('ymax', 0.0070160068571567535);

model.component('comp1').pair('p1').label('l_clip');
model.component('comp1').pair('p2').label('r_clip');

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
model.component('comp1').physics('solid').feature('adm1').set('MassType', 'mTot');
model.component('comp1').physics('solid').feature('adm1').set('mTot', {'mass'; '0'; '0'; '0'; 'mass'; '0'; '0'; '0'; 'mass'});
model.component('comp1').physics('solid').feature('cont1').set('pairs', {'p1'; 'p2'});
model.component('comp1').physics('solid').feature('rig1').set('RotationType', 'PrescribedRotationGroup');
model.component('comp1').physics('solid').feature('rig1').active(false);

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study.create('std2');
model.study('std2').create('time', 'Transient');

model.sol.create('sol2');
model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol.create('sol3');
model.sol('sol3').study('std1');
model.sol('sol3').attach('std1');
model.sol('sol3').create('st1', 'StudyStep');
model.sol('sol3').create('v1', 'Variables');
model.sol('sol3').create('s1', 'Stationary');
model.sol('sol3').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol3').feature('s1').feature.remove('fcDef');

model.result.dataset.create('dset3', 'Solution');
model.result.dataset('dset2').set('solution', 'sol2');
model.result.dataset('dset3').set('solution', 'sol3');
model.result.dataset.remove('dset1');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup2D');
model.result.create('pg4', 'PlotGroup1D');
model.result('pg1').set('data', 'dset3');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', 'solid.mises');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg2').set('data', 'dset3');
model.result('pg2').create('arws1', 'ArrowSurface');
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('arws1').create('col', 'Color');
model.result('pg2').feature('arws1').create('def', 'Deform');
model.result('pg2').feature('arws1').feature('col').set('expr', 'comp1.solid.gr1.F_V_Mag');
model.result('pg2').feature('surf1').set('expr', '1');
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg3').set('data', 'dset3');
model.result('pg3').create('arwl1', 'ArrowLine');
model.result('pg3').create('surf1', 'Surface');
model.result('pg3').feature('arwl1').create('col', 'Color');
model.result('pg3').feature('arwl1').create('def', 'Deform');
model.result('pg3').feature('arwl1').feature('col').set('expr', 'comp1.solid.adm1.F_A_Mag');
model.result('pg3').feature('surf1').set('expr', '1');
model.result('pg3').feature('surf1').create('def', 'Deform');
model.result('pg4').create('lngr1', 'LineGraph');
model.result('pg4').create('lngr2', 'LineGraph');
model.result('pg4').feature('lngr1').set('data', 'dset3');
model.result('pg4').feature('lngr1').selection.set([11 13 14]);
model.result('pg4').feature('lngr1').set('expr', 'y');
model.result('pg4').feature('lngr2').set('data', 'dset3');
model.result('pg4').feature('lngr2').selection.set([2 5 6]);
model.result('pg4').feature('lngr2').set('expr', 'y');

model.nodeGroup.create('dset3solidlgrp', 'Results');
model.nodeGroup('dset3solidlgrp').set('type', 'plotgroup');
model.nodeGroup('dset3solidlgrp').placeAfter('plotgroup', 'pg1');

model.study('std1').feature('stat').set('geometricNonlinearity', true);
model.study('std2').feature('time').set('tlist', 'range(0,0.001,0.1)');
model.study('std2').feature('time').set('plot', true);

model.sol('sol2').attach('std2');
model.sol('sol2').feature('v1').set('clist', {'range(0,0.001,0.1)' '1.0E-4[s]'});
model.sol('sol2').feature('v1').feature('comp1_u').set('scalemethod', 'manual');
model.sol('sol2').feature('v1').feature('comp1_u').set('scaleval', '1e-2*0.1030000485436779');
model.sol('sol2').feature('t1').set('control', 'user');
model.sol('sol2').feature('t1').set('tlist', 'range(0,0.001,0.1)');
model.sol('sol2').feature('t1').set('timemethod', 'genalpha');
model.sol('sol2').feature('t1').set('plot', true);
model.sol('sol2').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol2').runAll;
model.sol('sol3').attach('std1');
model.sol('sol3').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol3').feature('s1').feature('fc1').set('dtech', 'ddog');
model.sol('sol3').feature('s1').feature('fc1').set('maxiter', 1024);
model.sol('sol3').runAll;

model.result.evaluationGroup('eg1').set('data', 'dset3');
model.result.evaluationGroup('eg1').feature('min1').set('expr', {'y'});
model.result.evaluationGroup('eg1').feature('min1').set('unit', {'m'});
model.result.evaluationGroup('eg1').feature('min1').set('descr', {'y-coordinate'});
model.result.evaluationGroup('eg1').feature('min1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.evaluationGroup('eg1').feature('min1').set('dataseries', 'minimum');
model.result.evaluationGroup('eg1').feature('min1').selection.set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]);
model.result.evaluationGroup('eg1').run;
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg2').label('Volume Loads (solid)');
model.result('pg2').set('titletype', 'custom');
model.result('pg2').set('typeintitle', false);
model.result('pg2').set('descriptionintitle', false);
model.result('pg2').set('unitintitle', false);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsunit', true);
model.result('pg2').feature('arws1').label('Gravity 1');
model.result('pg2').feature('arws1').set('expr', {'solid.gr1.F_Vx' 'solid.gr1.F_Vy'});
model.result('pg2').feature('arws1').set('descr', 'Load (spatial frame)');
model.result('pg2').feature('arws1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg2').feature('arws1').set('placement', 'gausspoints');
model.result('pg2').feature('arws1').feature('col').set('coloring', 'gradient');
model.result('pg2').feature('arws1').feature('col').set('topcolor', 'red');
model.result('pg2').feature('arws1').feature('def').set('scaleactive', true);
model.result('pg2').feature('surf1').active(false);
model.result('pg2').feature('surf1').label('Gray Surfaces');
model.result('pg2').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg2').feature('surf1').set('coloring', 'uniform');
model.result('pg2').feature('surf1').set('color', 'gray');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg3').label('Boundary Loads (solid)');
model.result('pg3').set('titletype', 'custom');
model.result('pg3').set('typeintitle', false);
model.result('pg3').set('descriptionintitle', false);
model.result('pg3').set('unitintitle', false);
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('showlegendsunit', true);
model.result('pg3').feature('arwl1').label('Added Mass 1');
model.result('pg3').feature('arwl1').set('expr', {'solid.adm1.F_AX' 'solid.adm1.F_AY'});
model.result('pg3').feature('arwl1').set('descr', 'Load (material and geometry frames)');
model.result('pg3').feature('arwl1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg3').feature('arwl1').set('placement', 'gausspoints');
model.result('pg3').feature('arwl1').feature('col').set('coloring', 'gradient');
model.result('pg3').feature('arwl1').feature('col').set('topcolor', 'red');
model.result('pg3').feature('arwl1').feature('def').set('scaleactive', true);
model.result('pg3').feature('surf1').active(false);
model.result('pg3').feature('surf1').label('Gray Surfaces');
model.result('pg3').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg3').feature('surf1').set('coloring', 'uniform');
model.result('pg3').feature('surf1').set('color', 'gray');
model.result('pg3').feature('surf1').set('resolution', 'normal');
model.result('pg3').feature('surf1').feature('def').set('scaleactive', true);
model.result('pg4').set('xlabel', 'Arc length (m)');
model.result('pg4').set('ylabel', 'y-coordinate (m)');
model.result('pg4').set('xlabelactive', false);
model.result('pg4').set('ylabelactive', false);
model.result('pg4').feature('lngr1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg4').feature('lngr1').set('resolution', 'normal');
model.result('pg4').feature('lngr2').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg4').feature('lngr2').set('resolution', 'normal');

model.nodeGroup('dset3solidlgrp').label('Applied Loads (solid)');
model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg2');
model.nodeGroup('dset3solidlgrp').add('plotgroup', 'pg3');

out = model;
