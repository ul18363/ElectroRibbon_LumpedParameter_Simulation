function out = create_X_Symmetry_ES_model(obj)
%
b_points=obj.bezier_points;
x_start=b_points(1,1);
thickness=obj.thickness;
sheet_width=obj.sheet_width;
clip_l=obj.clip_l;
base_l=obj.base_l;
gap=obj.gap;
voltage=obj.voltage;
x_end=b_points(1,end);
y_end=b_points(2,end);
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('ES_Model');

model.label('Bezier_Vertical_Symmetry.mph');

model.component.create('comp1', true);
model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');
model.component('comp1').geom('geom1').create('cb1', 'CubicBezier');
model.component('comp1').geom('geom1').feature('cb1').set('p', b_points);
model.component('comp1').geom('geom1').create('cb2', 'CubicBezier');
model.component('comp1').geom('geom1').feature('cb2').set('p', [b_points(1,:) ;b_points(2,:)-thickness]);
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', [-clip_l -thickness]);
model.component('comp1').geom('geom1').feature('r2').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r2').set('size', [clip_l+x_start thickness]);
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', [x_end  y_end-thickness]);
model.component('comp1').geom('geom1').feature('r3').set('type', 'curve');
model.component('comp1').geom('geom1').feature('r3').set('size', [base_l/2 thickness]);

model.component('comp1').geom('geom1').create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('csol1').selection('input').set({'cb1' 'cb2' 'r2' 'r3'});

model.component('comp1').geom('geom1').create('mir2', 'Mirror');
model.component('comp1').geom('geom1').feature('mir2').set('keep', true);
model.component('comp1').geom('geom1').feature('mir2').set('pos', [x_end+base_l/2 0]);
model.component('comp1').geom('geom1').feature('mir2').set('axis', [1 0]);
model.component('comp1').geom('geom1').feature('mir2').selection('input').set({'csol1'});

model.component('comp1').geom('geom1').create('uni1', 'Union');
model.component('comp1').geom('geom1').feature('uni1').selection('input').set({'csol1' 'mir2'});
model.component('comp1').geom('geom1').run;

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').set([1 2 3 4 5 6]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel1').label('bottom_plate');
model.component('comp1').selection('sel2').label('top_plate');

model.view.create('view2', 2);

obj.add_material(model,'comp1','mat3','Transformer oil')
obj.add_material(model,'comp1','mat2','Steel AISI 4340')

model.component('comp1').material('mat3').selection.set([]);
model.component('comp1').material('mat3').selection.allVoids;

model.component('comp1').material('mat2').selection.set(2);

model.component('comp1').physics.create('esbe', 'ElectrostaticsBoundaryElements', 'geom1');
model.component('comp1').physics('esbe').selection.set([]);
model.component('comp1').physics('esbe').selection.allVoids;
model.component('comp1').physics('esbe').create('term1', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term1').selection.named('sel1');
model.component('comp1').physics('esbe').create('term2', 'Terminal', 1);
model.component('comp1').physics('esbe').feature('term2').selection.named('sel2');

%% Create Mesh & Views
model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.view('view2').axis.set('xmin', -0.0488400012254715);
model.view('view2').axis.set('xmax', 0.11044000089168549);
model.view('view2').axis.set('ymin', -0.09553901851177216);
model.view('view2').axis.set('ymax', 0.07948900759220123);



%% Create Physics & Apply boundary conditions
model.component('comp1').physics('esbe').prop('ShapeProperty').set('shapeorder', 'p55');
model.component('comp1').physics('esbe').prop('EquationForm').set('form', 'Stationary');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2', 'odd');
model.component('comp1').physics('esbe').prop('Symmetry').set('sym2plane', gap/2);
model.component('comp1').physics('esbe').prop('FarField').set('bemFarFieldTol', '1e-4');
model.component('comp1').physics('esbe').prop('d').set('d', sheet_width);

model.component('comp1').physics('esbe').feature('term1').set('TerminalType', 'Voltage');
model.component('comp1').physics('esbe').feature('term1').set('V0', voltage);

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

% model.result.dataset.create('grid1', 'Grid2D');

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


% model.result.dataset('grid1').set('source', 'data');
% model.result.dataset('grid1').set('parmin1', -0.0416);
% model.result.dataset('grid1').set('parmax1', 0.0832);
% model.result.dataset('grid1').set('parmin2', -0.0322);
% model.result.dataset('grid1').set('parmax2', 0.0161);
% model.result.evaluationGroup('eg1').set('data', 'dset1');
% model.result.evaluationGroup('eg1').feature('gev1').set('expr', {'esbe.C11' 'esbe.Q0_1' 'esbe.V0_1' 'esbe.Q0_1/esbe.V0_1'});
% model.result.evaluationGroup('eg1').feature('gev1').set('unit', {'F' 'C' 'V' 'F'});
% model.result.evaluationGroup('eg1').feature('gev1').set('descr', {'Maxwell capacitance' 'Terminal charge' 'Terminal voltage' ''});
% model.result.evaluationGroup('eg1').run;
out = model;
