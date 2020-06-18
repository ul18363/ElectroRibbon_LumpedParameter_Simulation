function model = create_model(btm_plate_coords,top_plate_coords)
%
% basic_model_source.m
%
% Model exported on Jun 12 2020, 09:22 by COMSOL 5.5.0.359.
%clear;clc;
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
update_geometry(model,'comp1','geom1','pol1',btm_plate_coords);
model.component('comp1').geom('geom1').create('pol2', 'Polygon');
model.component('comp1').geom('geom1').feature('pol2').set('source', 'table');
update_geometry(model,'comp1','geom1','pol2',top_plate_coords);
model.component('comp1').geom('geom1').run;

%% Create Mesh
model.component('comp1').mesh.create('mesh1'); %Necessary for solver to work


%% Selections Definitions
% Top plate edge selection
model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').set(2);
model.component('comp1').selection('sel1').label('Top plate edge selection');
% Bottom plate edge selection
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel2').set(1);
model.component('comp1').selection('sel2').label('Bottom plate edge selection');
% Top plate point selection
model.component('comp1').selection.create('sel4', 'Explicit');
model.component('comp1').selection('sel4').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel4').set(2);
model.component('comp1').selection('sel4').label('Top plate point selection');
% Bottom plate point selection
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').geom('geom1', 2, 0, {'exterior'});
model.component('comp1').selection('sel3').set(1);
model.component('comp1').selection('sel3').label('Bottom plate point selection ');


%% Add Material
add_material(model,'comp1','mat1','Air')
add_material(model,'comp1','mat2','Steel AISI 4340')
% Asign materials
model.component('comp1').material('mat1').selection.set(0); % Infinite Void <- Air
model.component('comp1').material('mat2').selection.set([1 2]); % Plates <- Steel
%% Add Physics
model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');
model.component('comp1').physics('esbe').selection.set(0); % Compute in the void
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

%% Define Numerical Results
model.result().numerical().create("charges", "Global");
model.result().numerical("charges").set("expr", {'esbe.Q0_1' 'esbe.Q0_2' '(esbe.Q0_1+esbe.Q0_2)/esbe.Q0_1'});
% data_charge= model.result().numerical('glA').getData();

%
model.result().numerical().create('tpuntx',"Eval");
model.result().numerical('tpuntx').selection.named('sel4');% Top plate selection
model.result().numerical('tpuntx').set('expr', {'esbe.unTx' 'esbe.unTy' 'x' 'y'});
% raw_data_tp_unT= model.result().numerical('tpuntx').getData();
% data_tp_unTx=reshape(raw_data_tp_unT,[4,22]);
%
model.result().numerical().create('btmuntx',"Eval");
model.result().numerical('btmuntx').selection.named('sel4');% Top plate selection
model.result().numerical('btmuntx').set('expr', {'esbe.unTx' 'esbe.unTy' 'x' 'y'});
% mphlaunch('Model')
end