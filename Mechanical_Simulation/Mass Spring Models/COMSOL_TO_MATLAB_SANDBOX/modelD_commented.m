function out = model
%
% modelD.m
%
% Model exported on Aug 9 2020, 04:30 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\COMSOL_TO_MATLAB_SANDBOX');

model.label('es_model_for_MATLAB_NoNoise_V5_2_simpler_geometry.mph');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('int1', 'IntLine');
model.result.evaluationGroup('eg1').create('int2', 'IntSurface');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', {'-0.01' '0';  ...
'0' '0';  ...
'4.47921E-8' '-1.82E-14';  ...
'8.95841E-8' '-7.28E-14';  ...
'1.34376E-7' '-1.64E-13';  ...
'1.79168E-7' '-2.91E-13';  ...
'2.2396E-7' '-4.55E-13';  ...
'2.68752E-7' '-6.55E-13';  ...
'3.13544E-7' '-8.91E-13';  ...
'3.58337E-7' '-1.16E-12';  ...
'4.03129E-7' '-1.47E-12';  ...
'4.47921E-7' '-1.82E-12';  ...
'8.95841E-7' '-7.28E-12';  ...
'1.34376E-6' '-1.64E-11';  ...
'1.79168E-6' '-2.91E-11';  ...
'2.2396E-6' '-4.55E-11';  ...
'2.68752E-6' '-6.55E-11';  ...
'3.13544E-6' '-8.91E-11';  ...
'3.58336E-6' '-1.16E-10';  ...
'4.03128E-6' '-1.47E-10';  ...
'4.4792E-6' '-1.82E-10';  ...
'8.95837E-6' '-7.28E-10';  ...
'1.34375E-5' '-1.64E-9';  ...
'1.79167E-5' '-2.91E-9';  ...
'2.23958E-5' '-4.55E-9';  ...
'2.68749E-5' '-6.55E-9';  ...
'3.13539E-5' '-8.91E-9';  ...
'3.5833E-5' '-1.16E-8';  ...
'4.0312E-5' '-1.47E-8';  ...
'4.4791E-5' '-1.82E-8';  ...
'8.95798E-5' '-7.27E-8';  ...
'1.34367E-4' '-1.63E-7';  ...
'1.79151E-4' '-2.9E-7';  ...
'2.23933E-4' '-4.53E-7';  ...
'2.68714E-4' '-6.52E-7';  ...
'3.13492E-4' '-8.87E-7';  ...
'3.58268E-4' '-1.16E-6';  ...
'4.03042E-4' '-1.46E-6';  ...
'4.47814E-4' '-1.81E-6';  ...
'8.95416E-4' '-7.18E-6';  ...
'0.001342811' '-1.6E-5';  ...
'0.001790003' '-2.83E-5';  ...
'0.002236997' '-4.4E-5';  ...
'0.002683796' '-6.29E-5';  ...
'0.003130406' '-8.5E-5';  ...
'0.00357683' '-1.1E-4';  ...
'0.004023072' '-1.39E-4';  ...
'0.004469138' '-1.7E-4';  ...
'0.008921007' '-6.31E-4';  ...
'0.013359912' '-0.00131';  ...
'0.017790158' '-0.00214';  ...
'0.02221605' '-0.00304';  ...
'0.026641894' '-0.00394';  ...
'0.031071995' '-0.00477';  ...
'0.035510657' '-0.00546';  ...
'0.039962186' '-0.00593';  ...
'0.044430887' '-0.006115478';  ...
'0.044430887+0.005' '-0.006115478'});
model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').set('disply', '-1e-4');
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy5', 'Copy');
model.component('comp1').geom('geom1').feature('copy5').set('disply', '130e-6');
model.component('comp1').geom('geom1').feature('copy5').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').selection('vertex1').set('copy3(1)', 1);
model.component('comp1').geom('geom1').feature('ls1').selection('vertex2').set('pol1(1)', 1);
model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').selection('vertex1').set('ls1(1)', 2);
model.component('comp1').geom('geom1').feature('ls2').selection('vertex2').set('copy5(1)', 1);
model.component('comp1').geom('geom1').create('mir4', 'Mirror');
model.component('comp1').geom('geom1').feature('mir4').set('keep', true);
model.component('comp1').geom('geom1').feature('mir4').set('pos', [0 1.3E-4]);
model.component('comp1').geom('geom1').feature('mir4').set('axis', [0 1]);
model.component('comp1').geom('geom1').feature('mir4').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'pol1'});
model.component('comp1').geom('geom1').create('mir5', 'Mirror');
model.component('comp1').geom('geom1').feature('mir5').set('keep', true);
model.component('comp1').geom('geom1').feature('mir5').set('pos', [0.049430887 0]);
model.component('comp1').geom('geom1').feature('mir5').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir5').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'mir4' 'pol1'});
model.component('comp1').geom('geom1').create('csol5', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol5').label('bottom_metal_sheet');
model.component('comp1').geom('geom1').feature('csol5').set('keep', true);
model.component('comp1').geom('geom1').feature('csol5').selection('input').set({'copy3' 'ls1' 'mir5(1)' 'mir5(10)' 'mir5(3)' 'pol1'});
model.component('comp1').geom('geom1').create('csol4', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol4').label('bottom_insulator');
model.component('comp1').geom('geom1').feature('csol4').set('keep', true);
model.component('comp1').geom('geom1').feature('csol4').selection('input').set({'copy5' 'ls2' 'mir4(2)' 'mir5(10)' 'mir5(2)' 'mir5(4)' 'pol1'});
model.component('comp1').geom('geom1').create('csol7', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol7').label('top_insulator');
model.component('comp1').geom('geom1').feature('csol7').set('keep', true);
model.component('comp1').geom('geom1').feature('csol7').selection('input').set({'copy5' 'mir4(2)' 'mir4(4)' 'mir4(5)' 'mir5(6)' 'mir5(8)' 'mir5(9)'});
model.component('comp1').geom('geom1').create('csol6', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol6').label('top_metal_sheet');
model.component('comp1').geom('geom1').feature('csol6').set('keep', true);
model.component('comp1').geom('geom1').feature('csol6').selection('input').set({'mir4(1)' 'mir4(3)' 'mir4(5)' 'mir5(5)' 'mir5(7)' 'mir5(9)'});
model.component('comp1').geom('geom1').create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').init;
model.component('comp1').geom('geom1').feature('del3').selection('input').set({'copy3' 'copy5' 'ls1' 'ls2' 'mir4' 'mir5' 'pol1'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', {'-.1' '-.1'});
model.component('comp1').geom('geom1').feature('r4').set('size', [0.3 0.2]);
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel7', 'Explicit');
model.component('comp1').selection('sel7').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel7').set([2]);
model.component('comp1').selection.create('sel17', 'Explicit');
model.component('comp1').selection('sel17').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel17').set([3]);
model.component('comp1').selection.create('sel16', 'Explicit');
model.component('comp1').selection('sel16').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel16').set([4]);
model.component('comp1').selection.create('sel6', 'Explicit');
model.component('comp1').selection('sel6').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel6').set([5]);
model.component('comp1').selection.create('sel18', 'Explicit');
model.component('comp1').selection('sel18').set([2 3 4 5]);
model.component('comp1').selection.create('sel19', 'Explicit');
model.component('comp1').selection('sel19').set([1 7]);
model.component('comp1').selection.create('sel20', 'Explicit');
model.component('comp1').selection('sel20').geom('geom1', 2, 1, {'exterior' 'interior'});
model.component('comp1').selection('sel20').set([1 7]);
model.component('comp1').selection.create('uni1', 'Union');
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([3 4]);
model.component('comp1').selection.create('sel23', 'Explicit');
model.component('comp1').selection('sel23').set([3]);
model.component('comp1').selection.create('sel24', 'Explicit');
model.component('comp1').selection('sel24').set([4]);
model.component('comp1').selection.create('com1', 'Complement');
model.component('comp1').selection.create('adj1', 'Adjacent');
model.component('comp1').selection.create('int2', 'Intersection');
model.component('comp1').selection('int2').set('entitydim', 1);
model.component('comp1').selection.create('int3', 'Intersection');
model.component('comp1').selection('int3').set('entitydim', 1);
model.component('comp1').selection.create('sel21', 'Explicit');
model.component('comp1').selection('sel21').geom('geom1', 1);
model.component('comp1').selection('sel21').set([4 6 8 10]);
model.component('comp1').selection.create('adj3', 'Adjacent');
model.component('comp1').selection('adj3').set('entitydim', 1);
model.component('comp1').selection.create('sel22', 'Explicit');
model.component('comp1').selection('sel22').geom('geom1', 1);
model.component('comp1').selection('sel22').set([572 573 574 575]);
model.component('comp1').selection.create('adj2', 'Adjacent');
model.component('comp1').selection('adj2').set('entitydim', 1);
model.component('comp1').selection.create('uni4', 'Union');
model.component('comp1').selection('uni4').set('entitydim', 1);
model.component('comp1').selection.create('int4', 'Intersection');
model.component('comp1').selection('int4').set('entitydim', 1);
model.component('comp1').selection.create('dif7', 'Difference');
model.component('comp1').selection('dif7').set('entitydim', 1);
model.component('comp1').selection.create('int5', 'Intersection');
model.component('comp1').selection('int5').set('entitydim', 1);
model.component('comp1').selection.create('dif8', 'Difference');
model.component('comp1').selection('dif8').set('entitydim', 1);
model.component('comp1').selection.create('int6', 'Intersection');
model.component('comp1').selection('int6').set('entitydim', 1);
model.component('comp1').selection.create('int7', 'Intersection');
model.component('comp1').selection('int7').set('entitydim', 1);
model.component('comp1').selection.create('int8', 'Intersection');
model.component('comp1').selection('int8').set('entitydim', 1);
model.component('comp1').selection.create('uni2', 'Union');
model.component('comp1').selection('uni2').set('entitydim', 1);
model.component('comp1').selection.create('int9', 'Intersection');
model.component('comp1').selection('int9').set('entitydim', 1);
model.component('comp1').selection.create('int10', 'Intersection');
model.component('comp1').selection('int10').set('entitydim', 1);
model.component('comp1').selection.create('uni3', 'Union');
model.component('comp1').selection('uni3').set('entitydim', 1);
model.component('comp1').selection.create('dif3', 'Difference');
model.component('comp1').selection('dif3').set('entitydim', 1);
model.component('comp1').selection.create('bottom_interface', 'Difference');
model.component('comp1').selection('bottom_interface').set('entitydim', 1);
model.component('comp1').selection.create('dif5', 'Difference');
model.component('comp1').selection('dif5').set('entitydim', 1);
model.component('comp1').selection.create('dif6', 'Difference');
model.component('comp1').selection('dif6').set('entitydim', 1);
model.component('comp1').selection.create('top_interface', 'Difference');
model.component('comp1').selection('top_interface').set('entitydim', 1);
model.component('comp1').selection.create('dif4', 'Difference');
model.component('comp1').selection('dif4').set('entitydim', 1);
model.component('comp1').selection('sel7').label('bottom_plate');
model.component('comp1').selection('sel17').label('bottom_insulator');
model.component('comp1').selection('sel16').label('top_insulator');
model.component('comp1').selection('sel6').label('top_plate');
model.component('comp1').selection('sel18').label('actuator');
model.component('comp1').selection('sel19').label('surrounding');
model.component('comp1').selection('sel20').label('surrounding_surfaces');
model.component('comp1').selection('uni1').label('universe');
model.component('comp1').selection('uni1').set('input', {'sel18' 'sel19'});
model.component('comp1').selection('sel2').label('insulator');
model.component('comp1').selection('sel23').label('bottom_insulator_domain');
model.component('comp1').selection('sel24').label('top_insulator_domain');
model.component('comp1').selection('com1').label('noise_islands');
model.component('comp1').selection('com1').set('input', {'uni1'});
model.component('comp1').selection('adj1').label('noise_islands_surfaces');
model.component('comp1').selection('adj1').set('input', {'com1'});
model.component('comp1').selection('int2').label('bottom_interface_all');
model.component('comp1').selection('int2').set('input', {'sel7' 'sel17'});
model.component('comp1').selection('int3').label('top_interface_all');
model.component('comp1').selection('int3').set('input', {'sel16' 'sel6'});
model.component('comp1').selection('sel21').label('left_edges');
model.component('comp1').selection('sel21').set('groupcontang', true);
model.component('comp1').selection('adj3').label('left_edge_horiz');
model.component('comp1').selection('adj3').set('input', {'sel21'});
model.component('comp1').selection('sel22').label('right_edges');
model.component('comp1').selection('sel22').set('groupcontang', true);
model.component('comp1').selection('adj2').label('right_edge_horiz');
model.component('comp1').selection('adj2').set('input', {'sel22'});
model.component('comp1').selection('uni4').label('clip_edges');
model.component('comp1').selection('uni4').set('input', {'sel21' 'adj3' 'sel22' 'adj2'});
model.component('comp1').selection('int4').label('bottom_plate_exteriors');
model.component('comp1').selection('int4').set('input', {'sel7' 'sel20'});
model.component('comp1').selection('dif7').label('bottom_exposed_electrode_all');
model.component('comp1').selection('dif7').set('add', {'int4'});
model.component('comp1').selection('dif7').set('subtract', {'sel21' 'sel22'});
model.component('comp1').selection('int5').label('top_plate_exteriors');
model.component('comp1').selection('int5').set('input', {'sel6' 'sel20'});
model.component('comp1').selection('dif8').label('top_exposed_electrode_all');
model.component('comp1').selection('dif8').set('add', {'int5'});
model.component('comp1').selection('dif8').set('subtract', {'sel21' 'sel22'});
model.component('comp1').selection('int6').label('bottom_noise_surfaces');
model.component('comp1').selection('int6').set('input', {'sel17' 'adj1'});
model.component('comp1').selection('int7').label('insulators_touch_points');
model.component('comp1').selection('int7').set('input', {'sel17' 'sel16'});
model.component('comp1').selection('int8').label('bottom_insulator_exposed_to_oil');
model.component('comp1').selection('int8').set('input', {'sel17' 'sel20'});
model.component('comp1').selection('uni2').label('bottom_exposed_insulator_all');
model.component('comp1').selection('uni2').set('input', {'int6' 'int7' 'int8'});
model.component('comp1').selection('int9').label('top_noise_surfaces');
model.component('comp1').selection('int9').set('input', {'sel16' 'adj1'});
model.component('comp1').selection('int10').label('top_insulator_exposed_to_oil');
model.component('comp1').selection('int10').set('input', {'sel16' 'sel20'});
model.component('comp1').selection('uni3').label('top_exposed_insulator_all');
model.component('comp1').selection('uni3').set('input', {'int7' 'int9' 'int10'});
model.component('comp1').selection('dif3').label('bottom_exposed_electrode');
model.component('comp1').selection('dif3').set('add', {'dif7'});
model.component('comp1').selection('dif3').set('subtract', {'uni4'});
model.component('comp1').selection('bottom_interface').label('bottom_interface');
model.component('comp1').selection('bottom_interface').set('add', {'int2'});
model.component('comp1').selection('bottom_interface').set('subtract', {'uni4'});
model.component('comp1').selection('dif5').label('bottom_exposed_insulator');
model.component('comp1').selection('dif5').set('add', {'uni2'});
model.component('comp1').selection('dif5').set('subtract', {'uni4'});
model.component('comp1').selection('dif6').label('top_exposed_insulator');
model.component('comp1').selection('dif6').set('add', {'uni3'});
model.component('comp1').selection('dif6').set('subtract', {'uni4'});
model.component('comp1').selection('top_interface').label('top_interface');
model.component('comp1').selection('top_interface').set('add', {'int3'});
model.component('comp1').selection('top_interface').set('subtract', {'uni4'});
model.component('comp1').selection('dif4').label('top_exposed_electrode');
model.component('comp1').selection('dif4').set('add', {'dif8'});
model.component('comp1').selection('dif4').set('subtract', {'uni4'});

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat3').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').selection.set([2 5]);
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat4').selection.set([3 4]);
model.component('comp1').material('mat4').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
model.component('comp1').physics('es').field('electricpotential').field('V2');
model.component('comp1').physics('es').selection.set([1 3 4 6 7 8]);
model.component('comp1').physics('es').create('ccn2', 'ChargeConservation', 2);
model.component('comp1').physics('es').feature('ccn2').selection.set([3 4]);
model.component('comp1').physics('es').create('term3', 'Terminal', 1);
model.component('comp1').physics('es').feature('term3').selection.named('sel7');
model.component('comp1').physics('es').create('term4', 'Terminal', 1);
model.component('comp1').physics('es').feature('term4').selection.named('sel6');

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').create('ftri2', 'FreeTri');
model.component('comp1').mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri1').selection.set([3 4]);
model.component('comp1').mesh('mesh1').feature('ftri2').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri2').selection.set([6 7 8]);

model.component('comp1').view('view1').axis.set('xmin', -0.11500000953674316);
model.component('comp1').view('view1').axis.set('xmax', 0.2150000035762787);
model.component('comp1').view('view1').axis.set('ymin', -0.13420000672340393);
model.component('comp1').view('view1').axis.set('ymax', 0.13420000672340393);

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
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'2.7' '0' '0' '0' '2.7' '0' '0' '0' '2.7'});
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
model.component('comp1').material('mat4').label('PVC - Polyvinyl chloride');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', {'100e-6[1/K]' '0' '0' '0' '100e-6[1/K]' '0' '0' '0' '100e-6[1/K]'});
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'4.6' '0' '0' '0' '4.6' '0' '0' '0' '4.6'});
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity_symmetry', '0');
model.component('comp1').material('mat4').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('density', '1760[kg/m^3]');
model.component('comp1').material('mat4').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('def').set('thermalconductivity', {'0.1[W/(m*K)]' '0' '0' '0' '0.1[W/(m*K)]' '0' '0' '0' '0.1[W/(m*K)]'});
model.component('comp1').material('mat4').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('Enu').set('youngsmodulus', '2.9e9[Pa]');
model.component('comp1').material('mat4').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat4').propertyGroup('Enu').descr('poissonsratio_symmetry', '');

model.component('comp1').physics('es').prop('d').set('d', 0.0127);
model.component('comp1').physics('es').feature('term3').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term3').set('V0', 6000);
model.component('comp1').physics('es').feature('term4').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').feature('term4').set('V0', -6000);

model.component('comp1').mesh('mesh1').run;

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

model.result.numerical.create('evalpoint1', 'EvalPoint');
model.result.numerical('evalpoint1').set('probetag', 'none');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup1D');
model.result('pg2').create('lngr1', 'LineGraph');
model.result('pg2').feature('lngr1').selection.named('bottom_interface');
model.result('pg2').feature('lngr1').set('expr', 'es.Ey^2*epsilon0_const*es.d');

model.nodeGroup.create('grp1', 'Definitions', 'comp1');
model.nodeGroup('grp1').set('type', 'selection');
model.nodeGroup('grp1').placeAfter([]);
model.nodeGroup.create('grp2', 'Definitions', 'comp1');
model.nodeGroup('grp2').set('type', 'selection');
model.nodeGroup.move('grp2', 1);
model.nodeGroup('grp2').placeAfter([]);
model.nodeGroup.create('grp3', 'Definitions', 'comp1');
model.nodeGroup('grp3').set('type', 'selection');
model.nodeGroup.move('grp3', 2);
model.nodeGroup('grp3').placeAfter([]);
model.nodeGroup.create('grp4', 'Definitions', 'comp1');
model.nodeGroup('grp4').set('type', 'selection');
model.nodeGroup.move('grp4', 3);
model.nodeGroup('grp4').placeAfter([]);
model.nodeGroup.create('grp5', 'Definitions', 'comp1');
model.nodeGroup('grp5').set('type', 'selection');
model.nodeGroup.move('grp5', 4);
model.nodeGroup('grp5').placeAfter([]);
model.nodeGroup.create('grp6', 'Definitions', 'comp1');
model.nodeGroup('grp6').set('type', 'selection');
model.nodeGroup.move('grp6', 5);
model.nodeGroup('grp6').placeAfter([]);
model.nodeGroup.create('grp7', 'Definitions', 'comp1');
model.nodeGroup('grp7').set('type', 'selection');
model.nodeGroup.move('grp7', 6);
model.nodeGroup('grp7').placeAfter([]);

model.sol('sol1').attach('std2');
model.sol('sol1').runAll;

model.result.evaluationGroup('eg1').set('data', 'dset1');
model.result.evaluationGroup('eg1').feature('int1').set('expr', {'es.Ey^2*epsilon0_const*es.d*4.65'});
model.result.evaluationGroup('eg1').feature('int1').set('unit', {'N'});
model.result.evaluationGroup('eg1').feature('int1').set('descr', {''});
model.result.evaluationGroup('eg1').feature('int1').selection.named('dif6');
model.result.evaluationGroup('eg1').feature('int2').set('expr', {'es.Ey*es.Py'});
model.result.evaluationGroup('eg1').feature('int2').set('unit', {'N'});
model.result.evaluationGroup('eg1').feature('int2').set('descr', {''});
model.result.evaluationGroup('eg1').feature('int2').selection.set([4]);
model.result.evaluationGroup('eg1').run;
model.result('pg2').set('xlabel', 'Arc length (m)');
model.result('pg2').set('ylabel', 'es.Ey<sup>2</sup>*epsilon0_const*es.d (N/m)');
model.result('pg2').set('xlog', true);
model.result('pg2').set('xlabelactive', false);
model.result('pg2').set('ylabelactive', false);
model.result('pg2').feature('lngr1').set('resolution', 'normal');

model.nodeGroup('grp1').label('basics');
model.nodeGroup('grp1').add('selection', 'sel7');
model.nodeGroup('grp1').add('selection', 'sel17');
model.nodeGroup('grp1').add('selection', 'sel16');
model.nodeGroup('grp1').add('selection', 'sel6');
model.nodeGroup('grp1').add('selection', 'sel18');
model.nodeGroup('grp1').add('selection', 'sel19');
model.nodeGroup('grp1').add('selection', 'sel20');
model.nodeGroup('grp1').add('selection', 'uni1');
model.nodeGroup('grp1').add('selection', 'sel2');
model.nodeGroup('grp1').add('selection', 'sel23');
model.nodeGroup('grp1').add('selection', 'sel24');
model.nodeGroup('grp2').label('comsol_noise');
model.nodeGroup('grp2').add('selection', 'com1');
model.nodeGroup('grp2').add('selection', 'adj1');
model.nodeGroup('grp3').label('interfaces');
model.nodeGroup('grp3').add('selection', 'int2');
model.nodeGroup('grp3').add('selection', 'int3');
model.nodeGroup('grp4').label('clipping_area');
model.nodeGroup('grp4').add('selection', 'sel21');
model.nodeGroup('grp4').add('selection', 'adj3');
model.nodeGroup('grp4').add('selection', 'sel22');
model.nodeGroup('grp4').add('selection', 'adj2');
model.nodeGroup('grp4').add('selection', 'uni4');
model.nodeGroup('grp5').label('exposed_electrodes');
model.nodeGroup('grp5').add('selection', 'int4');
model.nodeGroup('grp5').add('selection', 'dif7');
model.nodeGroup('grp5').add('selection', 'int5');
model.nodeGroup('grp5').add('selection', 'dif8');
model.nodeGroup('grp6').label('exposed_insulators');
model.nodeGroup('grp6').add('selection', 'int6');
model.nodeGroup('grp6').add('selection', 'int7');
model.nodeGroup('grp6').add('selection', 'int8');
model.nodeGroup('grp6').add('selection', 'uni2');
model.nodeGroup('grp6').add('selection', 'int9');
model.nodeGroup('grp6').add('selection', 'int10');
model.nodeGroup('grp6').add('selection', 'uni3');
model.nodeGroup('grp7').label('processed_layers');
model.nodeGroup('grp7').add('selection', 'dif3');
model.nodeGroup('grp7').add('selection', 'bottom_interface');
model.nodeGroup('grp7').add('selection', 'dif5');
model.nodeGroup('grp7').add('selection', 'dif6');
model.nodeGroup('grp7').add('selection', 'top_interface');
model.nodeGroup('grp7').add('selection', 'dif4');

out = model;
