function create_comsol_plot(model)
model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').create('line1', 'Line');
model.result('pg1').feature('line1').create('def1', 'Deform');
model.result('pg1').feature('line1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('line1').set('resolution', 'normal');
model.result('pg1').feature('line1').feature('def1').set('scaleactive', true);
end