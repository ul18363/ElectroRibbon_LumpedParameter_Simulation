function update_model_private(obj,model)
%% GEOMETRY
obj.update_geometry_private(model);
%% Correct Selections
nDomains=model.geom('geom1').getNDomains;
domain_size=0;
exterior_oil_domain=1;
% Find Interior Oil Domain
model.component('comp1').selection.create('test_sel', 'Explicit');
model.component('comp1').selection('test_sel').geom('geom1', 2, 1, {'exterior'});
interior_oil_domain=6;
for i= 6:nDomains
model.selection('test_sel').set(i);
number_of_edges=length(model.selection('test_sel').entities(1));
if number_of_edges>domain_size
   domain_size=number_of_edges;
   interior_oil_domain=i;
end
% disp(['Domain [',num2str(i),'] has ',num2str(number_of_edges),'edges']);
end
model.component('comp1').selection.remove('test_sel')
% Redefine selections which use the interior oil domain
model.component('comp1').selection('surrounding_surfaces').set([exterior_oil_domain interior_oil_domain]);
model.component('comp1').selection('interior_oil').set(interior_oil_domain);
model.component('comp1').selection('surrounding').set([exterior_oil_domain interior_oil_domain]);
%% Re-Mesh
model.component('comp1').mesh('mesh1').run;
%% Redefine Physics
model.component('comp1').physics('es').prop('d').set('d', obj.sheet_width);
model.component('comp1').physics('es').feature('term3').set('V0', obj.voltage);
model.component('comp1').physics('es').feature('term4').set('V0', -obj.voltage);
%% Run Solver
model.sol('sol1').runAll;

end