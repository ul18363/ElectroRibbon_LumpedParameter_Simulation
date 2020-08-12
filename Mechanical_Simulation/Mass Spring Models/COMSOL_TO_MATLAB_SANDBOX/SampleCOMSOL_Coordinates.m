function out = model
%
% SampleCOMSOL_Coordinates.m
%
% Model exported on Aug 12 2020, 16:20 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\Bruno\Documents\DISSERTATION\Mechanical_Simulation\Mass Spring Models\COMSOL_TO_MATLAB_SANDBOX');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('type', 'open');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', [0 0; 4.47921E-8 -1.82E-14; 8.95841E-8 -7.28E-14; 1.34376E-7 -1.64E-13; 1.79168E-7 -2.91E-13; 2.2396E-7 -4.55E-13; 2.68752E-7 -6.55E-13; 3.13544E-7 -8.91E-13; 3.58337E-7 -1.16E-12; 4.03129E-7 -1.47E-12; 4.47921E-7 -1.82E-12; 8.95841E-7 -7.28E-12; 1.34376E-6 -1.64E-11; 1.79168E-6 -2.91E-11; 2.2396E-6 -4.55E-11; 2.68752E-6 -6.55E-11; 3.13544E-6 -8.91E-11; 3.58336E-6 -1.16E-10; 4.03128E-6 -1.47E-10; 4.4792E-6 -1.82E-10; 8.95837E-6 -7.28E-10; 1.34375E-5 -1.64E-9; 1.79167E-5 -2.91E-9; 2.23958E-5 -4.55E-9; 2.68749E-5 -6.55E-9; 3.13539E-5 -8.91E-9; 3.5833E-5 -1.16E-8; 4.0312E-5 -1.47E-8; 4.4791E-5 -1.82E-8; 8.95798E-5 -7.27E-8; 1.34367E-4 -1.63E-7; 1.79151E-4 -2.9E-7; 2.23933E-4 -4.53E-7; 2.68714E-4 -6.52E-7; 3.13492E-4 -8.87E-7; 3.58268E-4 -1.16E-6; 4.03042E-4 -1.46E-6; 4.47814E-4 -1.81E-6; 8.95416E-4 -7.18E-6; 0.001342811 -1.6E-5; 0.001790003 -2.83E-5; 0.002236997 -4.4E-5; 0.002683796 -6.29E-5; 0.003130406 -8.5E-5; 0.00357683 -1.1E-4; 0.004023072 -1.39E-4; 0.004469138 -1.7E-4; 0.008921007 -6.31E-4; 0.013359912 -0.00131; 0.017790158 -0.00214; 0.02221605 -0.00304; 0.026641894 -0.00394; 0.031071995 -0.00477; 0.035510657 -0.00546; 0.039962186 -0.00593; 0.044430887 -0.006115478]);
model.component('comp1').geom('geom1').create('copy3', 'Copy');
model.component('comp1').geom('geom1').feature('copy3').setIndex('disply', '-1.0E-4', 0);
model.component('comp1').geom('geom1').feature('copy3').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('copy5', 'Copy');
model.component('comp1').geom('geom1').feature('copy5').setIndex('disply', '1.3E-4', 0);
model.component('comp1').geom('geom1').feature('copy5').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord1', {'0' '-100e-6'});
model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord2', {'0' '130e-6'});
model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord1', {'0.044430887' '-0.006115478-100e-6'});
model.component('comp1').geom('geom1').feature('ls2').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord2', {'0.044430887' '-0.006115478+130e-6'});
model.component('comp1').geom('geom1').run;

model.component('comp1').view('view1').axis.set('xmin', -0.0022215433418750763);
model.component('comp1').view('view1').axis.set('xmax', 0.046652428805828094);
model.component('comp1').view('view1').axis.set('ymin', -0.011813787743449211);
model.component('comp1').view('view1').axis.set('ymax', 0.005728309974074364);

out = model;
