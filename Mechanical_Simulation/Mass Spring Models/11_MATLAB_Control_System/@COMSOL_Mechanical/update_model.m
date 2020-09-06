function update_model(obj)
    obj.model.component('comp1').geom('geom1').feature('pol1').set('table', obj.og_p);
    obj.model.component('comp1').physics('solid').prop('d').set('d', obj.sheet_width); %Add Sheet width
    obj.model.component('comp1').physics('solid').feature('adm1').set('mTot', obj.M);            
    obj.model.component('comp1').physics('solid').feature('adm1').selection.set(2*obj.N);
    obj.model.component('comp1').physics('solid').feature('rig1').selection.set(2*obj.N);
    obj.model.component('comp1').geom('geom1').run;
    obj.model.sol('sol1').runAll;
end