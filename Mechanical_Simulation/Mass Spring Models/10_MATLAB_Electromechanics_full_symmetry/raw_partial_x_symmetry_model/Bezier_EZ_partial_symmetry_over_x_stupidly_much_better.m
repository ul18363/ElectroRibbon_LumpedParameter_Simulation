%function out = model
%
% Bezier_EZ_partial_symmetry_over_x_stupidly_much_better.m
%
% Model exported on Jul 1 2020, 20:49 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/Mass Spring Models/10_MATLAB_Electromechanics_full_symmetry/raw_partial_x_symmetry_model');

model.label('Bezier_EZ_partial_symmetry_over_x_stupidly_much_better.mph');

model.param.set('thickness', '100e-6[m]');
model.param.set('voltage', '12e3[V]');
model.param.set('gap', '50e-6[m]');
model.param.set('clip_l', '1e-2[m]');
model.param.set('x_end', '0.0416 [m]');
model.param.set('y_end', '-0.016 [m]');
model.param.set('base_l', '1e-2[m]');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('gev1', 'EvalGlobal');

model.component('comp1').mesh.create('mesh1');

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
model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').active(false);
model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord1', {'0' '-thickness'});
model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').active(false);
model.component('comp1').geom('geom1').feature('ls2').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord1', {'0.0416' '-0.016-thickness'});
model.component('comp1').geom('geom1').feature('ls2').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord2', [0.0416 -0.016]);
model.component('comp1').geom('geom1').create('ls3', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls3').active(false);
model.component('comp1').geom('geom1').feature('ls3').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls3').set('coord1', {'x_end' '-thickness'});
model.component('comp1').geom('geom1').feature('ls3').set('specify2', 'coord');
model.component('comp1').geom('geom1').create('ls4', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls4').active(false);
model.component('comp1').geom('geom1').feature('ls4').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls4').set('coord1', {'0.0416' '-0.016-thickness'});
model.component('comp1').geom('geom1').feature('ls4').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls4').set('coord2', [0.0416 -0.016]);
model.component('comp1').geom('geom1').create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol1').selection('input').set({'cb1' 'cb2' 'r2' 'r3'});
model.component('comp1').geom('geom1').create('mir2', 'Mirror');
model.component('comp1').geom('geom1').feature('mir2').set('keep', true);
model.component('comp1').geom('geom1').feature('mir2').set('pos', {'x_end+base_l/2' '0'});
model.component('comp1').geom('geom1').feature('mir2').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir2').selection('input').set({'csol1'});
model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'csol1' 'mir2'});
model.component('comp1').geom('geom1').create('mir1', 'Mirror');
model.component('comp1').geom('geom1').feature('mir1').active(false);
model.component('comp1').geom('geom1').feature('mir1').set('keep', true);
model.component('comp1').geom('geom1').feature('mir1').set('pos', {'0' 'gap/2'});
model.component('comp1').geom('geom1').feature('mir1').set('axis', [0 1]);
model.component('comp1').geom('geom1').feature('mir1').selection('input').set({'uni1'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').label('Void');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-clip_l-0.01' 'y_end-0.01'});
model.component('comp1').geom('geom1').feature('r4').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r4').set('size', {'2*(x_end+clip_l)+base_l+2*0.01' '2*(-y_end)+2*0.01'});
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').set([1 2 3 4 5 6]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').label('bottom_plate');
model.component('comp1').selection('sel2').label('top_plate');

model.view.create('view2', 2);

add_material(model,'comp1','mat3','Transformer oil')
add_material(model,'comp1','mat2','Steel AISI 4340')

model.component('comp1').material('mat3').selection.set([]);
model.component('comp1').material('mat3').selection.allVoids;

model.component('comp1').material('mat2').selection.set([2]);

model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');
model.component('comp1').physics('esbe').selection.set([]);
model.component('comp1').physics('esbe').selection.allVoids;
model.component('comp1').physics('esbe').create('term1', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term1').selection.named('sel1');
model.component('comp1').physics('esbe').create('term2', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term2').selection.named('sel2');

%% Create Mesh & Views
model.component('comp1').mesh('mesh1').autoMeshSize(1);

model.component('comp1').view('view1').axis.set('xmin', -7.028207182884216E-4);
model.component('comp1').view('view1').axis.set('xmax', 6.342083215713501E-4);
model.component('comp1').view('view1').axis.set('ymin', -7.576299831271172E-4);
model.component('comp1').view('view1').axis.set('ymax', 5.978988483548164E-4);
model.view('view2').axis.set('xmin', -0.0488400012254715);
model.view('view2').axis.set('xmax', 0.11044000089168549);
model.view('view2').axis.set('ymin', -0.09553901851177216);
model.view('view2').axis.set('ymax', 0.07948900759220123);



%% Create Physics & Apply boundary conditions
model.component('comp1').physics('esbe').prop('ShapeProperty').set('shapeorder', 'p55');
model.component('comp1').physics('esbe').prop('EquationForm').set('form', 'Stationary');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2', 'odd');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2plane', 'gap/2');
model.component('comp1').physics('esbe').prop('FarField').set('bemFarFieldTol', '1e-4');
model.component('comp1').physics('esbe').prop('d').set('d', 0.0127);

model.component('comp1').physics('esbe').feature('term1').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term1').set('V0', 'voltage');
model.component('comp1').physics('esbe').feature('term2').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term2').set('V0', '-voltage');
model.component('comp1').physics('esbe').feature('term2').active(false);

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
model.result('pg5').feature('lngr3').selection.set([10 13 21 23]);
model.result('pg5').feature('lngr3').set('expr', 'x');
model.result('pg5').feature('lngr1').selection.set([10 13 21 23]);
model.result('pg5').feature('lngr1').set('expr', 'esbe.unTx');
model.result('pg5').feature('lngr2').selection.set([10 13 21 23]);
model.result('pg5').feature('lngr2').set('expr', 'esbe.unTy');
model.result('pg5').feature('lngr4').selection.set([10 13 21 23]);
model.result('pg5').feature('lngr4').set('expr', 'y');
model.result('pg5').feature('lngr5').set('xdata', 'reversedarc');
model.result('pg5').feature('lngr5').selection.set([21]);
model.result('pg5').feature('lngr5').set('expr', 'l');
model.result.export.create('plot1', 'Plot');

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
model.result.evaluationGroup('eg1').set('data', 'dset1');
model.result.evaluationGroup('eg1').feature('gev1').set('expr', {'esbe.C11' 'esbe.Q0_1' 'esbe.V0_1' 'esbe.Q0_1/esbe.V0_1'});
model.result.evaluationGroup('eg1').feature('gev1').set('unit', {'F' 'C' 'V' 'F'});
model.result.evaluationGroup('eg1').feature('gev1').set('descr', {'Maxwell capacitance' 'Terminal charge' 'Terminal voltage' ''});
model.result.evaluationGroup('eg1').run;
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
model.result('pg5').feature('lngr4').set('linestyle', 'dotted');
model.result('pg5').feature('lngr4').set('linecolor', 'red');
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

%out = model;
