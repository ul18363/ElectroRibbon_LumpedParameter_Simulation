% function generate_selections(model)
function generate_selections(~,model)
% generate_selections(model)
% Domains:
% 1 - Exterior Oil
% 2 - Bottom Electrode
% 3 - Bottom Insulator
% 4 - Top Insulator
% 5 - Top Electrode
% ? - Interior Oil (For some reason COMSOL likes to create small bubbles in
%     the interface, luckily they are small so we need to find the biggest 
%     remainig domain)

exterior_oil_domain=1;
bottom_electrode_domain=2;
bottom_insulator_domain=3;
top_insulator_domain=4;
top_electrode_domain=5;
nBoundaries=model.geom('geom1').getNBoundaries;
left_edge_index=4;
%% Find the interior oil domain by catching the biggest remaining one
nDomains=model.geom('geom1').getNDomains;
domain_size=0;
model.component('comp1').selection.create('test_sel', 'Explicit');
model.component('comp1').selection('test_sel').geom('geom1', 2, 1, {'exterior'});
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
%% Create Selections
% Basics - Bottom Plate (surfaces)
model.component('comp1').selection.create('sel7', 'Explicit');
model.component('comp1').selection('sel7').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel7').set(bottom_electrode_domain);
model.component('comp1').selection('sel7').label('bottom_plate');
model.component('comp1').selection('sel7').tag('bottom_plate');

% Basics -  Bottom Insulator (surfaces)
model.component('comp1').selection.create('sel17', 'Explicit');
model.component('comp1').selection('sel17').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel17').set(bottom_insulator_domain);
model.component('comp1').selection('sel17').label('bottom_insulator');
model.component('comp1').selection('sel17').tag('bottom_insulator');
% Basics - Top Insulator (surfaces)
model.component('comp1').selection.create('sel16', 'Explicit');
model.component('comp1').selection('sel16').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel16').set(top_insulator_domain);
model.component('comp1').selection('sel16').label('top_insulator');
model.component('comp1').selection('sel16').tag('top_insulator');
% Basics - %Top Plate (surfaces)
model.component('comp1').selection.create('sel6', 'Explicit');
model.component('comp1').selection('sel6').geom('geom1', 2, 1, {'exterior'});
model.component('comp1').selection('sel6').set(top_electrode_domain);
model.component('comp1').selection('sel6').label('top_plate');
model.component('comp1').selection('sel6').tag('top_plate');
% Basics - Actuator
model.component('comp1').selection.create('sel18', 'Explicit');
model.component('comp1').selection('sel18').set([bottom_electrode_domain bottom_insulator_domain top_insulator_domain top_electrode_domain]);
model.component('comp1').selection('sel18').label('actuator');
model.component('comp1').selection('sel18').tag('actuator');
% Basics - Electrodes
model.component('comp1').selection.create('electrodes', 'Explicit');
model.component('comp1').selection('electrodes').set([bottom_electrode_domain top_electrode_domain]);
model.component('comp1').selection('electrodes').label('electrodes');
% Basics - Electrodes complement
model.component('comp1').selection.create('all_but_electrodes', 'Complement');
model.component('comp1').selection('all_but_electrodes').label('all_but_electrodes');
model.component('comp1').selection('all_but_electrodes').set('input', {'electrodes'});

% Basics - Oil surroundings Domains
model.component('comp1').selection.create('sel19', 'Explicit');
model.component('comp1').selection('sel19').set([exterior_oil_domain interior_oil_domain]);
model.component('comp1').selection('sel19').label('surrounding');
model.component('comp1').selection('sel19').tag('surrounding');

% Basics - Oil surroundings Domains
model.component('comp1').selection.create('interior_oil', 'Explicit');
model.component('comp1').selection('interior_oil').set(interior_oil_domain);
model.component('comp1').selection('interior_oil').label('interior_oil');

% Basics - Oil surroundings (surfaces)
model.component('comp1').selection.create('sel20', 'Explicit');
model.component('comp1').selection('sel20').geom('geom1', 2, 1, {'exterior' 'interior'});
model.component('comp1').selection('sel20').set([exterior_oil_domain interior_oil_domain]);
model.component('comp1').selection('sel20').label('surrounding_surfaces');
model.component('comp1').selection('sel20').tag('surrounding_surfaces');
% Basics - Universe as designed
model.component('comp1').selection.create('uni1', 'Union');
model.component('comp1').selection('uni1').label('universe');
model.component('comp1').selection('uni1').set('input', {'actuator' 'surrounding'});
model.component('comp1').selection('uni1').tag('universe');
% Basics - Insulator
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([bottom_insulator_domain top_insulator_domain]);
model.component('comp1').selection('sel2').label('insulator');
model.component('comp1').selection('sel2').tag('insulator');
% Basics - Bottom Insulator Domain
model.component('comp1').selection.create('sel23', 'Explicit');
model.component('comp1').selection('sel23').set(bottom_insulator_domain);
model.component('comp1').selection('sel23').label('bottom_insulator_domain');
model.component('comp1').selection('sel23').tag('bottom_insulator_domain');
% Basics - Top Insulator Domain
model.component('comp1').selection.create('sel24', 'Explicit');
model.component('comp1').selection('sel24').set(top_insulator_domain);
model.component('comp1').selection('sel24').label('top_insulator_domain');
model.component('comp1').selection('sel24').tag('top_insulator_domain');

% Strange islands - Domain
model.component('comp1').selection.create('com1', 'Complement');
model.component('comp1').selection('com1').label('noise_islands');
model.component('comp1').selection('com1').set('input', {'universe'});
model.component('comp1').selection('com1').tag('noise_islands');

% Strange islands - Surfaces
model.component('comp1').selection.create('adj1', 'Adjacent');
model.component('comp1').selection('adj1').label('noise_islands_surfaces');
model.component('comp1').selection('adj1').set('input', {'noise_islands'});
model.component('comp1').selection('adj1').tag('noise_islands_surfaces');

% Interfaces - Bottom Interface
model.component('comp1').selection.create('int2', 'Intersection');
model.component('comp1').selection('int2').set('entitydim', 1);
model.component('comp1').selection('int2').label('bottom_interface_all');
model.component('comp1').selection('int2').set('input', {'bottom_plate' 'bottom_insulator'});
model.component('comp1').selection('int2').tag('bottom_interface_all');

% Interfaces - Top Interface
model.component('comp1').selection.create('int3', 'Intersection');
model.component('comp1').selection('int3').set('entitydim', 1);
model.component('comp1').selection('int3').label('top_interface_all');
model.component('comp1').selection('int3').set('input', {'top_insulator' 'top_plate'});
model.component('comp1').selection('int3').tag('top_interface_all');

% Clipping Area - Left Vertical Edges
model.component('comp1').selection.create('sel21', 'Explicit');
model.component('comp1').selection('sel21').geom('geom1', 1);
model.component('comp1').selection('sel21').set(left_edge_index);
model.component('comp1').selection('sel21').label('left_edges');
model.component('comp1').selection('sel21').set('groupcontang', true);
model.component('comp1').selection('sel21').tag('left_edges');

% Clipping Area - Right Vertical Edges
model.component('comp1').selection.create('sel22', 'Explicit');
model.component('comp1').selection('sel22').geom('geom1', 1);
model.component('comp1').selection('sel22').set(nBoundaries-1);
model.component('comp1').selection('sel22').label('right_edges');
model.component('comp1').selection('sel22').set('groupcontang', true);
model.component('comp1').selection('sel22').tag('right_edges');

% Clipping Area - Right Horizontal Edges
model.component('comp1').selection.create('adj2', 'Adjacent');
model.component('comp1').selection('adj2').set('entitydim', 1);
model.component('comp1').selection('adj2').label('right_edge_horiz');
model.component('comp1').selection('adj2').set('input', {'right_edges'});
model.component('comp1').selection('adj2').tag('right_edge_horiz');

% Clipping Area - Left Horizontal Edges
model.component('comp1').selection.create('adj3', 'Adjacent');
model.component('comp1').selection('adj3').set('entitydim', 1);
model.component('comp1').selection('adj3').label('left_edge_horiz');
model.component('comp1').selection('adj3').set('input', {'left_edges'});
model.component('comp1').selection('adj3').tag('left_edge_horiz');

% Clipping Area - Clip Edges
model.component('comp1').selection.create('uni4', 'Union');
model.component('comp1').selection('uni4').set('entitydim', 1);
model.component('comp1').selection('uni4').label('clip_edges');
model.component('comp1').selection('uni4').set('input', {'left_edges' 'left_edge_horiz' 'right_edges' 'right_edge_horiz'});
model.component('comp1').selection('uni4').tag('clip_edges');

% Exposed Electrodes -  Bottom Exterior (including sides)
model.component('comp1').selection.create('int4', 'Intersection');
model.component('comp1').selection('int4').set('entitydim', 1);
model.component('comp1').selection('int4').label('bottom_plate_exteriors');
model.component('comp1').selection('int4').set('input', {'bottom_plate' 'surrounding_surfaces'});
model.component('comp1').selection('int4').tag('bottom_plate_exteriors');

% Exposed Electrodes - Bottom Exposed Electrode
model.component('comp1').selection.create('dif7', 'Difference');
model.component('comp1').selection('dif7').set('entitydim', 1);
model.component('comp1').selection('dif7').label('bottom_exposed_electrode_all');
model.component('comp1').selection('dif7').set('add', {'bottom_plate_exteriors'});
model.component('comp1').selection('dif7').set('subtract', {'left_edges' 'right_edges'});
model.component('comp1').selection('dif7').tag('bottom_exposed_electrode_all');

% Exposed Electrodes - Top Exterior (including sides)
model.component('comp1').selection.create('int5', 'Intersection');
model.component('comp1').selection('int5').set('entitydim', 1);
model.component('comp1').selection('int5').label('top_plate_exteriors');
model.component('comp1').selection('int5').set('input', {'top_plate' 'surrounding_surfaces'});
model.component('comp1').selection('int5').tag('top_plate_exteriors');

% Exposed Electrodes - Top Exposed Electrode
model.component('comp1').selection.create('dif8', 'Difference');
model.component('comp1').selection('dif8').set('entitydim', 1);
model.component('comp1').selection('dif8').label('top_exposed_electrode_all');
model.component('comp1').selection('dif8').set('add', {'top_plate_exteriors'});
model.component('comp1').selection('dif8').set('subtract', {'left_edges' 'right_edges'});
model.component('comp1').selection('dif8').tag('top_exposed_electrode_all');

% Exposed Insulators - Bottom/Bubbles
model.component('comp1').selection.create('int6', 'Intersection');
model.component('comp1').selection('int6').set('entitydim', 1);
model.component('comp1').selection('int6').label('bottom_noise_surfaces');
model.component('comp1').selection('int6').set('input', {'bottom_insulator' 'noise_islands_surfaces'});
model.component('comp1').selection('int6').tag('bottom_noise_surfaces');

% Exposed Insulators - Bottom/Top
model.component('comp1').selection.create('int7', 'Intersection');
model.component('comp1').selection('int7').set('entitydim', 1);
model.component('comp1').selection('int7').label('insulators_touch_points');
model.component('comp1').selection('int7').set('input', {'bottom_insulator' 'top_insulator'});
model.component('comp1').selection('int7').tag('insulators_touch_points');

% Exposed Insulators - Bottom/Oil
model.component('comp1').selection.create('int8', 'Intersection');
model.component('comp1').selection('int8').set('entitydim', 1);
model.component('comp1').selection('int8').label('bottom_insulator_exposed_to_oil');
model.component('comp1').selection('int8').set('input', {'bottom_insulator' 'surrounding_surfaces'});
model.component('comp1').selection('int8').tag('bottom_insulator_exposed_to_oil');

% Exposed Insulators - Bottom Exposed Insulator
model.component('comp1').selection.create('uni2', 'Union');
model.component('comp1').selection('uni2').set('entitydim', 1);
model.component('comp1').selection('uni2').label('bottom_exposed_insulator_all');
model.component('comp1').selection('uni2').set('input', {'bottom_noise_surfaces' 'insulators_touch_points' 'bottom_insulator_exposed_to_oil'});
model.component('comp1').selection('uni2').tag('bottom_exposed_insulator_all');

% Exposed Insulators - Top/Bubbles
model.component('comp1').selection.create('int9', 'Intersection');
model.component('comp1').selection('int9').set('entitydim', 1);
model.component('comp1').selection('int9').label('top_noise_surfaces');
model.component('comp1').selection('int9').set('input', {'top_insulator' 'noise_islands_surfaces'});
model.component('comp1').selection('int9').tag('top_noise_surfaces');

% Exposed Insulators - Top/Oil
model.component('comp1').selection.create('int10', 'Intersection');
model.component('comp1').selection('int10').set('entitydim', 1);
model.component('comp1').selection('int10').label('top_insulator_exposed_to_oil');
model.component('comp1').selection('int10').set('input', {'top_insulator' 'surrounding_surfaces'});
model.component('comp1').selection('int10').tag('top_insulator_exposed_to_oil');

% Exposed Insulators - Top Exposed Insulator
model.component('comp1').selection.create('uni3', 'Union');
model.component('comp1').selection('uni3').set('entitydim', 1);
model.component('comp1').selection('uni3').label('top_exposed_insulator_all');
model.component('comp1').selection('uni3').set('input', {'insulators_touch_points' 'top_noise_surfaces' 'top_insulator_exposed_to_oil'});
model.component('comp1').selection('uni3').tag('top_exposed_insulator_all');

% Processed Layers - Bottom Exposed Electrode
model.component('comp1').selection.create('dif3', 'Difference');
model.component('comp1').selection('dif3').set('entitydim', 1);
model.component('comp1').selection('dif3').label('bottom_exposed_electrode');
model.component('comp1').selection('dif3').set('add', {'bottom_exposed_electrode_all'});
model.component('comp1').selection('dif3').set('subtract', {'clip_edges'});
model.component('comp1').selection('dif3').tag('bottom_exposed_electrode');

% Processed Layers - Bottom Interface
model.component('comp1').selection.create('bottom_interface', 'Difference');
model.component('comp1').selection('bottom_interface').set('entitydim', 1);
model.component('comp1').selection('bottom_interface').label('bottom_interface');
model.component('comp1').selection('bottom_interface').set('add', {'bottom_interface_all'});
model.component('comp1').selection('bottom_interface').set('subtract', {'clip_edges'});

% Processed Layers - Bottom Exposed Insulator
model.component('comp1').selection.create('dif5', 'Difference');
model.component('comp1').selection('dif5').set('entitydim', 1);
model.component('comp1').selection('dif5').label('bottom_exposed_insulator');
model.component('comp1').selection('dif5').set('add', {'bottom_exposed_insulator_all'});
model.component('comp1').selection('dif5').set('subtract', {'clip_edges'});
model.component('comp1').selection('dif5').tag('bottom_exposed_insulator');

% Processed Layers - Top Exposed Insulator
model.component('comp1').selection.create('dif6', 'Difference');
model.component('comp1').selection('dif6').set('entitydim', 1);
model.component('comp1').selection('dif6').label('top_exposed_insulator');
model.component('comp1').selection('dif6').set('add', {'top_exposed_insulator_all'});
model.component('comp1').selection('dif6').set('subtract', {'clip_edges'});
model.component('comp1').selection('dif6').tag('top_exposed_insulator');

% Processed Layers - Top Interface
model.component('comp1').selection.create('top_interface', 'Difference');
model.component('comp1').selection('top_interface').set('entitydim', 1);
model.component('comp1').selection('top_interface').label('top_interface');
model.component('comp1').selection('top_interface').set('add', {'top_interface_all'});
model.component('comp1').selection('top_interface').set('subtract', {'clip_edges'});

% Processed Layers -  Top Exposed Electrode
model.component('comp1').selection.create('dif4', 'Difference');
model.component('comp1').selection('dif4').set('entitydim', 1);
model.component('comp1').selection('dif4').label('top_exposed_electrode');
model.component('comp1').selection('dif4').set('add', {'top_exposed_electrode_all'});
model.component('comp1').selection('dif4').set('subtract', {'clip_edges'});
model.component('comp1').selection('dif4').tag('top_exposed_electrode');

%% Create Selection Groups
model.nodeGroup.create('grp1', 'Definitions', 'comp1');
model.nodeGroup('grp1').set('type', 'selection');
model.nodeGroup('grp1').placeAfter([]);
model.nodeGroup('grp1').label('basics');
model.nodeGroup('grp1').add('selection', 'bottom_plate');
model.nodeGroup('grp1').add('selection', 'bottom_insulator');
model.nodeGroup('grp1').add('selection', 'top_insulator');
model.nodeGroup('grp1').add('selection', 'top_plate');
model.nodeGroup('grp1').add('selection', 'actuator');
model.nodeGroup('grp1').add('selection', 'surrounding');
model.nodeGroup('grp1').add('selection', 'surrounding_surfaces');
model.nodeGroup('grp1').add('selection', 'universe');
model.nodeGroup('grp1').add('selection', 'insulator');
model.nodeGroup('grp1').add('selection', 'bottom_insulator_domain');
model.nodeGroup('grp1').add('selection', 'top_insulator_domain');
model.nodeGroup('grp1').add('selection', 'electrodes');
model.nodeGroup('grp1').add('selection', 'interior_oil');
model.nodeGroup('grp1').add('selection', 'all_but_electrodes');


model.nodeGroup.create('grp2', 'Definitions', 'comp1');
model.nodeGroup('grp2').set('type', 'selection');
model.nodeGroup.move('grp2', 1);
model.nodeGroup('grp2').placeAfter([]);
model.nodeGroup('grp2').label('comsol_noise');
model.nodeGroup('grp2').add('selection', 'noise_islands');
model.nodeGroup('grp2').add('selection', 'noise_islands_surfaces');


model.nodeGroup.create('grp3', 'Definitions', 'comp1');
model.nodeGroup('grp3').set('type', 'selection');
model.nodeGroup.move('grp3', 2);
model.nodeGroup('grp3').placeAfter([]);
model.nodeGroup('grp3').label('interfaces');
model.nodeGroup('grp3').add('selection', 'bottom_interface_all');
model.nodeGroup('grp3').add('selection', 'top_interface_all');


model.nodeGroup.create('grp4', 'Definitions', 'comp1');
model.nodeGroup('grp4').set('type', 'selection');
model.nodeGroup.move('grp4', 3);
model.nodeGroup('grp4').label('clipping_area');
model.nodeGroup('grp4').add('selection', 'left_edges');
model.nodeGroup('grp4').add('selection', 'right_edges');
model.nodeGroup('grp4').add('selection', 'right_edge_horiz');
model.nodeGroup('grp4').add('selection', 'left_edge_horiz');
model.nodeGroup('grp4').add('selection', 'clip_edges');
model.nodeGroup('grp4').placeAfter([]);

model.nodeGroup.create('grp5', 'Definitions', 'comp1');
model.nodeGroup('grp5').set('type', 'selection');
model.nodeGroup.move('grp5', 4);
model.nodeGroup('grp5').placeAfter([]);
model.nodeGroup('grp5').label('exposed_electrodes');
model.nodeGroup('grp5').add('selection', 'bottom_plate_exteriors');
model.nodeGroup('grp5').add('selection', 'bottom_exposed_electrode_all');
model.nodeGroup('grp5').add('selection', 'top_plate_exteriors');
model.nodeGroup('grp5').add('selection', 'top_exposed_electrode_all');

model.nodeGroup.create('grp6', 'Definitions', 'comp1');
model.nodeGroup('grp6').set('type', 'selection');
model.nodeGroup.move('grp6', 5);
model.nodeGroup('grp6').placeAfter([]);
model.nodeGroup('grp6').label('exposed_insulators');
model.nodeGroup('grp6').add('selection', 'bottom_noise_surfaces');
model.nodeGroup('grp6').add('selection', 'insulators_touch_points');
model.nodeGroup('grp6').add('selection', 'bottom_insulator_exposed_to_oil');
model.nodeGroup('grp6').add('selection', 'bottom_exposed_insulator_all');
model.nodeGroup('grp6').add('selection', 'top_noise_surfaces');
model.nodeGroup('grp6').add('selection', 'top_insulator_exposed_to_oil');
model.nodeGroup('grp6').add('selection', 'top_exposed_insulator_all');


model.nodeGroup.create('grp7', 'Definitions', 'comp1');
model.nodeGroup('grp7').set('type', 'selection');
model.nodeGroup.move('grp7', 6);
model.nodeGroup('grp7').placeAfter([]);
model.nodeGroup('grp7').label('processed_layers');
model.nodeGroup('grp7').add('selection', 'bottom_exposed_electrode');
model.nodeGroup('grp7').add('selection', 'bottom_interface');
model.nodeGroup('grp7').add('selection', 'bottom_exposed_insulator');
model.nodeGroup('grp7').add('selection', 'top_exposed_insulator');
model.nodeGroup('grp7').add('selection', 'top_interface');
model.nodeGroup('grp7').add('selection', 'top_exposed_electrode');

end