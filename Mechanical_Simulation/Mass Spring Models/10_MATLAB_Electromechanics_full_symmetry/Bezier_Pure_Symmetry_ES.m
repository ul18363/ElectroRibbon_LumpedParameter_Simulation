function out = model
%
% Bezier_EZ_total_symmetry.m
%
% Model exported on Jun 29 2020, 07:52 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/Mass Spring Models/09_MATLAB_GUI/COMSOL files/models_for_matlab');

model.label('Bezier_EZ_total_symmetry.mph');
%% Parameters
model.param.set('thickness', '100e-6[m]');
model.param.set('voltage', '12e3[V]');
model.param.set('gap', '50e-6[m]');
model.param.set('clip_l', '1e-2[m]');
model.param.set('x_end', '0.0416 [m]');
model.param.set('y_end', '-0.016 [m]');
model.param.set('base_l', '1e-2[m]');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');
%% Define Geometry
model.component('comp1').geom('geom1').create('cb1', 'CubicBezier');
model.component('comp1').geom('geom1').feature('cb1').set('p', {'0' '0.0154' '0.0262' '0.0416'; '0' '-9.3928e-4' '-0.0151' '-0.016'});
model.component('comp1').geom('geom1').create('cb2', 'CubicBezier');
model.component('comp1').geom('geom1').feature('cb2').set('p', {'0' '0.0154' '0.0262' '0.0416'; '0-thickness' '-9.3928e-4-thickness' '-0.0151-thickness' '-0.016-thickness'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'-clip_l' '-thickness'});
model.component('comp1').geom('geom1').feature('r2').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r2').set('size', {'clip_l' 'thickness'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', {'x_end' 'y_end-thickness'});
model.component('comp1').geom('geom1').feature('r3').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r3').set('size', {'base_l/2' 'thickness'});
model.component('comp1').geom('geom1').create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol1').selection('input').set({'cb1' 'cb2' 'r2' 'r3'});
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').set([1 2 3]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').label('bottom_plate');
model.component('comp1').selection('sel2').label('top_plate');

model.view.create('view2', 2);

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat3').selection.set([]);
model.component('comp1').material('mat3').selection.allVoids;
model.component('comp1').material('mat3').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat2').selection.set([2]);
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');
model.component('comp1').physics('esbe').selection.set([]);
model.component('comp1').physics('esbe').selection.allVoids;
model.component('comp1').physics('esbe').feature('ccn1').selection('symsel1').set([6 8]);
model.component('comp1').physics('esbe').create('term1', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term1').selection.named('sel1');

model.component('comp1').mesh('mesh1').autoMeshSize(1);

model.component('comp1').view('view1').axis.set('xmin', -0.011415001936256886);
model.component('comp1').view('view1').axis.set('xmax', 0.04801499843597412);
model.component('comp1').view('view1').axis.set('ymin', -0.0526604950428009);
model.component('comp1').view('view1').axis.set('ymax', 0.03656049817800522);
model.view('view2').axis.set('xmin', -0.0488400012254715);
model.view('view2').axis.set('xmax', 0.11044000089168549);
model.view('view2').axis.set('ymin', -0.09553901851177216);
model.view('view2').axis.set('ymax', 0.07948900759220123);

model.component('comp1').material('mat3').label('Transformer oil');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('pieces', {'243.0' '273.0' '4492.20229-64.7408879*T^1+0.349900959*T^2-8.40477E-4*T^3+7.57041667E-7*T^4'; '273.0' '373.0' '91.4524999-1.33227058*T^1+0.00777680216*T^2-2.27271368E-5*T^3+3.32419673E-8*T^4-1.94631023E-11*T^5'});
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('pieces', {'223.0' '293.0' '-117056.38+1816.76208*T^1-10.305786*T^2+0.0256691919*T^3-2.36742424E-5*T^4'; '293.0' '373.0' '-13408.1491+123.044152*T^1-0.335401786*T^2+3.125E-4*T^3'});
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('pieces', {'223.0' '373.0' '1055.04607-0.581753034*T^1-6.40531689E-5*T^2'});
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('pieces', {'223.0' '373.0' '0.134299084-8.04973822E-5*T^1'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat3').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('dynamicviscosity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('density', 'rho(T)');
model.component('comp1').material('mat3').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'7' '0' '0' '0' '7' '0' '0' '0' '7'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity_symmetry', '0');
model.component('comp1').material('mat3').propertyGroup('def').addInput('temperature');
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

model.component('comp1').physics('esbe').prop('ShapeProperty').set('shapeorder', 'p55');
model.component('comp1').physics('esbe').prop('EquationForm').set('form', 'Stationary');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym1', 'even');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym1plane', 'x_end+base_l/2');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2', 'odd');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2plane', 'gap/2');
model.component('comp1').physics('esbe').prop('FarField').set('bemFarFieldTol', '1e-4');
model.component('comp1').physics('esbe').prop('d').set('d', 0.0127);
model.component('comp1').physics('esbe').feature('term1').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term1').set('V0', 'voltage');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').create('dp1', 'DirectPreconditioner');
model.sol('sol1').feature('s1').feature('i2').create('dp1', 'DirectPreconditioner');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.dataset.create('grid1', 'Grid2D');
model.result.create('pg5', 'PlotGroup1D');
model.result('pg5').create('lngr3', 'LineGraph');
model.result('pg5').create('lngr1', 'LineGraph');
model.result('pg5').create('lngr2', 'LineGraph');
model.result('pg5').create('lngr4', 'LineGraph');
model.result('pg5').create('lngr5', 'LineGraph');
model.result('pg5').feature('lngr3').selection.set([7 10]);
model.result('pg5').feature('lngr3').set('expr', 'x');
model.result('pg5').feature('lngr1').selection.set([7 10]);
model.result('pg5').feature('lngr1').set('expr', 'esbe.unTx');
model.result('pg5').feature('lngr2').selection.set([7 10]);
model.result('pg5').feature('lngr2').set('expr', 'esbe.unTy');
model.result('pg5').feature('lngr4').selection.set([7 10]);
model.result('pg5').feature('lngr4').set('expr', 'y');
model.result('pg5').feature('lngr5').set('xdata', 'reversedarc');
model.result('pg5').feature('lngr5').selection.set([10]);
model.result('pg5').feature('lngr5').set('expr', 'l');
model.result.export.create('plot1', 'Plot');
%% Solution
model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('d1').label('Suggested Direct Solver (esbe)');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'dense');
model.sol('sol1').feature('s1').feature('i1').label('Suggested Iterative Solver (esbe)');
model.sol('sol1').feature('s1').feature('i1').set('linsolver', 'bicgstab');
model.sol('sol1').feature('s1').feature('i1').set('prefuntype', 'right');
model.sol('sol1').feature('s1').feature('i1').feature('dp1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('i2').label('GMRES Iterative Solver (esbe)');
model.sol('sol1').feature('s1').feature('i2').set('prefuntype', 'right');
model.sol('sol1').feature('s1').feature('i2').feature('dp1').set('linsolver', 'pardiso');
model.sol('sol1').runAll;

model.result.dataset('grid1').set('source', 'data');
model.result.dataset('grid1').set('parmin1', -0.0416);
model.result.dataset('grid1').set('parmax1', 0.0832);
model.result.dataset('grid1').set('parmin2', -0.0322);
model.result.dataset('grid1').set('parmax2', 0.0161);

%% 
model.result('pg5').label('Graph I want');
model.result('pg5').set('titletype', 'manual');
model.result('pg5').set('title', 'Maxwell Stress Tensor and position');
model.result('pg5').set('xlabel', 'length [m]');
model.result('pg5').set('xlabelactive', true);
model.result('pg5').set('ylabel', 'Maxwell Pressure [N/m2]');
model.result('pg5').set('ylabelactive', true);
model.result('pg5').set('yseclabel', 'Position[m]');
model.result('pg5').set('yseclabelactive', true);
model.result('pg5').set('twoyaxes', true);
model.result('pg5').set('plotonsecyaxis', {'Line Graph 3' 'on' 'lngr3';  ...
'Line Graph 1' 'off' 'lngr1';  ...
'Line Graph 2' 'off' 'lngr2';  ...
'Line Graph 4' 'on' 'lngr4';  ...
'Line Graph 5' 'on' 'lngr5'});
model.result('pg5').set('legendpos', 'uppermiddle');
model.result('pg5').feature('lngr3').set('linestyle', 'dashed');
model.result('pg5').feature('lngr3').set('linecolor', 'custom');
model.result('pg5').feature('lngr3').set('customlinecolor', [1 1 1]);
model.result('pg5').feature('lngr3').set('autoexpr', true);
model.result('pg5').feature('lngr3').set('resolution', 'normal');
model.result('pg5').feature('lngr1').set('legend', true);
model.result('pg5').feature('lngr1').set('autosolution', false);
model.result('pg5').feature('lngr1').set('autoexpr', true);
model.result('pg5').feature('lngr1').set('resolution', 'normal');
model.result('pg5').feature('lngr2').set('linewidth', 4);
model.result('pg5').feature('lngr2').set('legend', true);
model.result('pg5').feature('lngr2').set('autoexpr', true);
model.result('pg5').feature('lngr2').set('resolution', 'normal');
model.result('pg5').feature('lngr4').set('linecolor', 'cyan');
model.result('pg5').feature('lngr4').set('linewidth', 4);
model.result('pg5').feature('lngr4').set('legend', true);
model.result('pg5').feature('lngr4').set('autoexpr', true);
model.result('pg5').feature('lngr4').set('resolution', 'normal');
model.result('pg5').feature('lngr5').active(false);
model.result('pg5').feature('lngr5').set('linewidth', 4);
model.result('pg5').feature('lngr5').set('legend', true);
model.result('pg5').feature('lngr5').set('autoexpr', true);
model.result('pg5').feature('lngr5').set('resolution', 'normal');
model.result.export('plot1').set('filename', '/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/Mass Spring Models/09_MATLAB_GUI/COMSOL files/exports/force_y.txt');

out = model;
