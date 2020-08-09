% function out = model
%
% es_model_for_MATLAB_NoNoise_V1_for_MATLAB.m
%
% Model exported on Aug 7 2020, 22:06 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_NewESModel\COMSOL files\ES_Good');

model.label('es_model_for_MATLAB_NoNoise_V1_for_MATLAB.mph');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('evl2', 'Table');
model.result.evaluationGroup.create('eg1', 'EvaluationGroup');
model.result.evaluationGroup('eg1').create('int1', 'IntLine');




model.view.create('view2', 2);
model.view.create('view3', 2);


model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
model.component('comp1').physics('es').field('electricpotential').field('V2');
model.component('comp1').physics('es').selection.set([1 3 4 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44]);
model.component('comp1').physics('es').create('ccn2', 'ChargeConservation', 2);
model.component('comp1').physics('es').feature('ccn2').selection.set([3 4]);
model.component('comp1').physics('es').create('term1', 'DomainTerminal', 2);
model.component('comp1').physics('es').feature('term1').selection.set([5]);
model.component('comp1').physics('es').create('term2', 'DomainTerminal', 2);
model.component('comp1').physics('es').feature('term2').selection.set([2]);
model.component('comp1').physics('es').create('term3', 'Terminal', 1);
model.component('comp1').physics('es').feature('term3').selection.named('sel7');
model.component('comp1').physics('es').create('term4', 'Terminal', 1);
model.component('comp1').physics('es').feature('term4').selection.named('sel6');


model.view('view2').axis.set('xmin', -0.0488400012254715);
model.view('view2').axis.set('xmax', 0.11044000089168549);
model.view('view2').axis.set('ymin', -0.09553901851177216);
model.view('view2').axis.set('ymax', 0.07948900759220123);
model.view('view3').axis.set('xmin', -0.011018949560821056);
model.view('view3').axis.set('xmax', 0.007674585096538067);
model.view('view3').axis.set('ymin', -0.008579621091485023);
model.view('view3').axis.set('ymax', 0.003405548632144928);




model.component('comp1').mesh('mesh1').feature('fq1').active(false);
model.component('comp1').mesh('mesh1').run;


% model.result.create('pg1', 'PlotGroup2D');
% model.result.create('pg2', 'PlotGroup1D');
% model.result.create('pg3', 'PlotGroup1D');
% model.result('pg1').create('surf1', 'Surface');
% model.result('pg2').create('lngr1', 'LineGraph');
% model.result('pg2').create('lngr2', 'LineGraph');
% model.result('pg2').create('lngr3', 'LineGraph');
% model.result('pg2').feature('lngr1').selection.named('sel13');
% model.result('pg2').feature('lngr1').set('expr', 'es.nD');
% model.result('pg2').feature('lngr2').selection.named('sel13');
% model.result('pg2').feature('lngr2').set('expr', 'es.Ey');
% model.result('pg2').feature('lngr3').selection.named('sel13');
% model.result('pg2').feature('lngr3').set('expr', 'es.unTx');
% model.result('pg3').create('lngr1', 'LineGraph');
% model.result('pg3').create('lngr2', 'LineGraph');
% model.result('pg3').create('lngr3', 'LineGraph');
% model.result('pg3').feature('lngr1').selection.named('dif2');
% model.result('pg3').feature('lngr1').set('expr', 'es.nD');
% model.result('pg3').feature('lngr2').selection.named('sel9');
% model.result('pg3').feature('lngr2').set('expr', 'es.Ey');
% model.result('pg3').feature('lngr3').selection.named('dif2');
% model.result('pg3').feature('lngr3').set('expr', 'es.Ey^2*epsilon0_const*es.d');
% model.result.export.create('plot1', 'Plot');
% model.result.export.create('plot2', 'Plot');
% model.result.export.create('plot3', 'Plot');


% model.result.evaluationGroup('eg1').set('data', 'dset1');
% model.result.evaluationGroup('eg1').feature('int1').set('expr', {'es.Ey^2*epsilon0_const*es.d'});
% model.result.evaluationGroup('eg1').feature('int1').set('unit', {'N'});
% model.result.evaluationGroup('eg1').feature('int1').set('descr', {''});
% model.result.evaluationGroup('eg1').feature('int1').selection.named('dif2');
% model.result.evaluationGroup('eg1').run;
% model.result('pg1').label('Electric Potential (es)');
% model.result('pg1').set('frametype', 'spatial');
% model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
% model.result('pg1').feature('surf1').set('resolution', 'normal');
% model.result('pg2').label('top_insulator');
% model.result('pg2').set('xlabel', 'Arc length (m)');
% model.result('pg2').set('xlabelactive', false);
% model.result('pg2').feature('lngr1').label('es.nD');
% model.result('pg2').feature('lngr1').set('resolution', 'normal');
% model.result('pg2').feature('lngr2').label('es.Ey');
% model.result('pg2').feature('lngr2').set('resolution', 'normal');
% model.result('pg2').feature('lngr3').active(false);
% model.result('pg2').feature('lngr3').label('es.Ey 1');
% model.result('pg2').feature('lngr3').set('resolution', 'normal');
% model.result('pg3').label('interface');
% model.result('pg3').set('xlabel', 'Arc length (m)');
% model.result('pg3').set('yseclabel', 'Surface charge density (C/m<sup>2</sup>)');
% model.result('pg3').set('twoyaxes', true);
% model.result('pg3').set('plotonsecyaxis', {'es.nD' 'on' 'lngr1'; 'es.Ey' 'off' 'lngr2'; 'Force' 'off' 'lngr3'});
% model.result('pg3').set('xlabelactive', false);
% model.result('pg3').set('yseclabelactive', false);
% model.result('pg3').feature('lngr1').label('es.nD');
% model.result('pg3').feature('lngr1').set('resolution', 'normal');
% model.result('pg3').feature('lngr2').label('es.Ey');
% model.result('pg3').feature('lngr2').set('resolution', 'normal');
% model.result('pg3').feature('lngr3').label('Force');
% model.result('pg3').feature('lngr3').set('resolution', 'normal');
% 
% model.result.export('plot1').set('plotgroup', 'pg3');
% model.result.export('plot1').set('plot', 'lngr3');
% model.result.export('plot1').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\Fy_interface_V3.csv');
% model.result.export('plot1').set('alwaysask', true);
% model.result.export('plot2').set('plotgroup', 'pg3');
% model.result.export('plot2').set('plot', 'lngr1');
% model.result.export('plot2').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\nD_interface_V3.csv');
% model.result.export('plot2').set('alwaysask', true);
% model.result.export('plot3').set('plotgroup', 'pg3');
% model.result.export('plot3').set('plot', 'lngr3');
% model.result.export('plot3').set('filename', 'C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\11_MATLAB_Control_System\COMSOL files\ES_Good\Ey_interface_V3.txt');
% model.result.export('plot3').set('alwaysask', true);

out = model;
