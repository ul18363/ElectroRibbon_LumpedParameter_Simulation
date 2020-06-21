%function out = model
%
% basic_model_source.m
%
% Model exported on Jun 12 2020, 09:22 by COMSOL 5.5.0.359.
clear;clc;
btm_plate_coords= [0 0; 0.1 0; 0.2 0; 0.3 0; 0.4 0; 0.5 0; 0.6 0; 0.7 0; 0.8 0; 0.9 0; 1 0; 1 0.1; 0.9 0.1; 0.8 0.1; 0.7 0.1; 0.6 0.1; 0.5 0.1; 0.4 0.1; 0.3 0.1; 0.2 0.1; 0.1 0.1; 0 0.1];
top_plate_coords= [0 0.3; 0.1 0.3; 0.2 0.3; 0.3 0.3; 0.4 0.3; 0.5 0.3; 0.6 0.3; 0.7 0.3; 0.8 0.3; 0.9 0.3; 1 0.3; 1 0.4; 0.9 0.4; 0.8 0.4; 0.7 0.4; 0.6 0.4; 0.5 0.4; 0.4 0.4; 0.3 0.4; 0.2 0.4; 0.1 0.4; 0 0.4];
%% Import COMSOL API
import com.comsol.model.*
import com.comsol.model.util.*
%% Create Model
model = ModelUtil.create('Model');
model.modelPath('C:\Users\ul18363\OneDrive - University of Bristol\Documents\COMSOL\MATLAB\03_Model');
%% Create Component within Model 
model.component.create('comp1', true);
%Create Geometry
model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', btm_plate_coords);
model.component('comp1').geom('geom1').create('pol2', 'Polygon');
model.component('comp1').geom('geom1').feature('pol2').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol2').set('table', top_plate_coords);
model.component('comp1').geom('geom1').run;
%% Create Evaluation Groups
model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('pev1', 'EvalPoint');
model.result.evaluationGroup('eg1').create('pev2', 'EvalPoint');
model.result.evaluationGroup('eg1').create('pev3', 'EvalPoint');
model.result.evaluationGroup('eg1').create('pev4', 'EvalPoint');
model.result.evaluationGroup('eg1').create('gev1', 'EvalGlobal');

model.component('comp1').mesh.create('mesh1');


%% Selections Definitions
% Top plate edge selection
model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').set([2]);
model.component('comp1').selection('sel1').label('Top plate edge selection');
% Bottom plate edge selection
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel2').set([1]);
model.component('comp1').selection('sel2').label('Bottom plate edge selection');
% Top plate point selection
model.component('comp1').selection.create('sel4', 'Explicit');
model.component('comp1').selection('sel4').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel4').set([2]);
model.component('comp1').selection('sel4').label('Top plate point selection');
% Bottom plate point selection
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel3').set([1]);
model.component('comp1').selection('sel3').label('Bottom plate point selection ');


%% Add Material
add_material(model,'comp1','mat1','Air')
add_material(model,'comp1','mat2','Steel AISI 4340')
% Asign materials
model.component('comp1').material('mat1').selection.set([0]); % Infinite Void <- Air
model.component('comp1').material('mat2').selection.set([1 2]); % Plates <- Steel
%% Add Physics
model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');
model.component('comp1').physics('esbe').selection.set([0]); % Compute inthe void
% Create Boundary conditions
model.component('comp1').physics('esbe').create('term1', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term1').selection.named('sel1');
model.component('comp1').physics('esbe').create('term2', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term2').selection.named('sel2');
model.component('comp1').physics('esbe').feature('term1').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term1').set('V0', '12000[V]');
model.component('comp1').physics('esbe').feature('term1').label('Top plate Voltage');
model.component('comp1').physics('esbe').feature('term2').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term2').set('V0', '-12000[V]');
model.component('comp1').physics('esbe').feature('term2').label('Bottom plate Voltage');
%% Create View
% model.view.create('view2', 2);
% model.component('comp1').view('view1').axis.set('xmin', -0.0509943962097168);
% model.component('comp1').view('view1').axis.set('xmax', 1.0509943962097168);
% model.component('comp1').view('view1').axis.set('ymin', -0.3500000536441803);
% model.component('comp1').view('view1').axis.set('ymax', 0.7499998807907104);
% model.view('view2').axis.set('xmin', -1.1500000953674316);
% model.view('view2').axis.set('xmax', 2.1500000953674316);
% model.view('view2').axis.set('ymin', -1.7011630535125732);
% model.view('view2').axis.set('ymax', 2.101162910461426);

%% Create Study
model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
% Set solver settings
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

% model.result.dataset.create('grid1', 'Grid2D');
% model.result.create('pg1', 'PlotGroup2D');
% model.result.create('pg2', 'PlotGroup2D');
% model.result.create('pg3', 'PlotGroup2D');
% model.result('pg1').create('line1', 'Line');
% model.result('pg2').create('line1', 'Line');
% model.result('pg2').feature('line1').set('expr', 'esbe.nD');
% model.result('pg3').create('surf1', 'Surface');
% model.result('pg3').create('arws1', 'ArrowSurface');
% model.result('pg3').create('line1', 'Line');
% model.result('pg3').feature('line1').set('data', 'dset1');
% model.result('pg3').feature('line1').set('expr', '1');

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

% model.result.dataset('grid1').set('source', 'data');
% model.result.dataset('grid1').set('parmin1', -1);
% model.result.dataset('grid1').set('parmax1', 2);
% model.result.dataset('grid1').set('parmin2', -0.4000000000000001);
% model.result.dataset('grid1').set('parmax2', 0.8000000000000002);
%% Evaluation Groups
% 
% model.result.evaluationGroup('eg1').set('data', 'dset1');
% 
% model.result.evaluationGroup('eg1').feature('pev1').label('Top plate unTx');
% model.result.evaluationGroup('eg1').feature('pev1').set('expr', {'esbe.unTx' 'x' 'y'});
% model.result.evaluationGroup('eg1').feature('pev1').set('unit', {'Pa' 'm' 'm'});
% model.result.evaluationGroup('eg1').feature('pev1').set('descr', {'Maxwell upward surface stress tensor, x component' 'x-coordinate' 'y-coordinate'});
% model.result.evaluationGroup('eg1').feature('pev1').selection.named('sel4');
% 
% model.result.evaluationGroup('eg1').feature('pev2').label('Top plate unTy');
% model.result.evaluationGroup('eg1').feature('pev2').set('expr', {'esbe.unTy' 'x' 'y'});
% model.result.evaluationGroup('eg1').feature('pev2').set('unit', {'Pa' 'm' 'm'});
% model.result.evaluationGroup('eg1').feature('pev2').set('descr', {'Maxwell upward surface stress tensor, y component' 'x-coordinate' 'y-coordinate'});
% model.result.evaluationGroup('eg1').feature('pev2').selection.named('sel4');
% 
% model.result.evaluationGroup('eg1').feature('pev3').label('Bottom plate unTx');
% model.result.evaluationGroup('eg1').feature('pev3').set('expr', {'esbe.unTx' 'x' 'y'});
% model.result.evaluationGroup('eg1').feature('pev3').set('unit', {'Pa' 'm' 'm'});
% model.result.evaluationGroup('eg1').feature('pev3').set('descr', {'Maxwell upward surface stress tensor, x component' 'x-coordinate' 'y-coordinate'});
% model.result.evaluationGroup('eg1').feature('pev3').selection.named('sel3');
% model.result.evaluationGroup('eg1').feature('pev4').label('Bottom plate unTy');
% model.result.evaluationGroup('eg1').feature('pev4').set('expr', {'esbe.unTy' 'x' 'y'});
% model.result.evaluationGroup('eg1').feature('pev4').set('unit', {'Pa' 'm' 'm'});
% model.result.evaluationGroup('eg1').feature('pev4').set('descr', {'Maxwell upward surface stress tensor, y component' 'x-coordinate' 'y-coordinate'});
% model.result.evaluationGroup('eg1').feature('pev4').selection.named('sel3');
% model.result.evaluationGroup('eg1').feature('gev1').set('expr', {'esbe.Q0_1' 'esbe.Q0_2' '(esbe.Q0_1+esbe.Q0_2)/esbe.Q0_1'});
% model.result.evaluationGroup('eg1').feature('gev1').set('unit', {'C' 'C' '1'});
% model.result.evaluationGroup('eg1').feature('gev1').set('descr', {'Terminal charge' 'Terminal charge' 'Charge difference ratio'});
% model.result.evaluationGroup('eg1').run;

% model.result('pg1').label('Electric Potential (esbe)');
% model.result('pg1').feature('line1').set('colortable', 'RainbowLight');
% model.result('pg1').feature('line1').set('resolution', 'normal');
% model.result('pg2').label('Surface Charge Density (esbe)');
% model.result('pg2').feature('line1').set('colortable', 'RainbowLight');
% model.result('pg2').feature('line1').set('resolution', 'normal');
% model.result('pg3').label('Electric Potential and Electric Field (esbe)');
% model.result('pg3').set('data', 'grid1');
% model.result('pg3').feature('surf1').set('colortable', 'RainbowLight');
% model.result('pg3').feature('surf1').set('smooth', 'internal');
% model.result('pg3').feature('surf1').set('allowmaterialsmoothing', false);
% model.result('pg3').feature('surf1').set('resolution', 'normal');
% model.result('pg3').feature('arws1').set('scale', 7.657950136376768E-7);
% model.result('pg3').feature('arws1').set('scaleactive', false);
% model.result('pg3').feature('line1').set('titletype', 'none');
% model.result('pg3').feature('line1').set('coloring', 'uniform');
% model.result('pg3').feature('line1').set('color', 'black');
% model.result('pg3').feature('line1').set('smooth', 'internal');
% model.result('pg3').feature('line1').set('resolution', 'normal');

%out = model;
%% Numerical Results
% result = model.result().numerical(<ftag>).getData()
model.result().numerical().create("glA", "Global");
% model.result().numerical("glA").set("expr", {'esbe.unTx' 'x' 'y'})
model.result().numerical("glA").set("expr", {'esbe.Q0_1' 'esbe.Q0_2' '(esbe.Q0_1+esbe.Q0_2)/esbe.Q0_1'});
data_charge= model.result().numerical('glA').getData();

model.result().numerical().create('tpuntx',"Eval")
model.result().numerical('tpuntx').selection.named('sel4')% Top plate selection
model.result().numerical('tpuntx').set('expr', {'esbe.unTx' 'esbe.unTy' 'x' 'y'});
raw_data_tp_unT= model.result().numerical('tpuntx').getData();
data_tp_unTx=reshape(raw_data_tp_unT,[4,22]);
%
% model.result().numerical().create('tpuntx2',"Eval")
% model.result().numerical('tpuntx2').selection.named('sel4')% Top plate selection
% model.result().numerical('tpuntx2').set('expr', {'esbe.unTx' 'x' 'y'});
% raw_data_tp_unTx= model.result().numerical('tpuntx2').getData();
% data_tp_unTx=reshape(raw_data_tp_unTx,[3,22]);
%%
model.result().numerical().create('btmuntx',"EvalPoint")
model.result().numerical('btmuntx').selection.named('sel4')% Top plate selection
% mphlaunch('Model')