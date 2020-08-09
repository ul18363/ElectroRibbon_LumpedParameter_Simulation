model.component('comp1').selection.create('test_sel', 'Explicit')
% model.component('comp1').selection.create('test_sel_2', 'Adjacent')
%%
% model.selection('test_sel').geom(2)
model.component('comp1').selection('test_sel').geom('geom1', 2, 1, {'exterior'});
nDomains=model.geom('geom1').getNDomains;

model.component('comp1').selection.create('test_sel', 'Explicit')
for i= 0:nDomains
model.selection('test_sel').set(i);
number_of_edges=length(test_sel.entities(1));
disp(['Domain [',num2str(i),'] has ',num2str(number_of_edges),'edges']);
end
%%
% sel.set('input', 7)
model.selection('test_sel').set(0);

mphviewselection(model, 'test_sel')