function generate_phyisics(model,initial_V,width)

model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
% Define width of sheet model
model.component('comp1').physics('es').prop('d').set('d', width);
model.component('comp1').physics('es').field('electricpotential').field('V2');
% model.component('comp1').physics('es').selection.set([1 3 4 6 7 8]);
model.component('comp1').physics('es').selection.named('all_but_electrodes');
model.component('comp1').physics('es').create('ccn2', 'ChargeConservation', 2);
model.component('comp1').physics('es').feature('ccn2').selection.set([3 4]);

%Define Terminal Conditions
model.component('comp1').physics('es').create('term3', 'Terminal', 1);
model.component('comp1').physics('es').feature('term3').selection.named('bottom_plate');
model.component('comp1').physics('es').feature('term3').set('TerminalType', 'Voltage');
model.component('comp1').physics('es').create('term4', 'Terminal', 1);
model.component('comp1').physics('es').feature('term4').selection.named('top_plate');
model.component('comp1').physics('es').feature('term4').set('TerminalType', 'Voltage');
% Define initial values
model.component('comp1').physics('es').feature('term3').set('V0', initial_V);
model.component('comp1').physics('es').feature('term4').set('V0', -initial_V);