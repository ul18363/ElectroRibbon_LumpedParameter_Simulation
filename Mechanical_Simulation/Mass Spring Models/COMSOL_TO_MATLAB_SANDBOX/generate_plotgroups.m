function generate_plotgroups(model)

model.result.create('pg2', 'PlotGroup1D');
model.result('pg2').create('lngr1', 'LineGraph');
model.result('pg2').feature('lngr1').selection.named('bottom_interface');
model.result('pg2').feature('lngr1').set('expr', 'es.Ey^2*epsilon0_const*es.d');
model.result('pg2').feature('lngr1').set('resolution', 'normal');
% 
end