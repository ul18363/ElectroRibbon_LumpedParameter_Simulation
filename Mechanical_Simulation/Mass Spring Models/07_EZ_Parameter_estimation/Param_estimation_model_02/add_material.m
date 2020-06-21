function add_material(model,comp_tag,mat_tag,mat)
%% Create Material
model.component(comp_tag).material.create(mat_tag, 'Common');
switch mat
    case 'Air'
        % Create Features
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('eta', 'Piecewise');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('Cp', 'Piecewise');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('rho', 'Analytic');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('k', 'Piecewise');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('cs', 'Analytic');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('an1', 'Analytic');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func.create('an2', 'Analytic');
        model.component(comp_tag).material(mat_tag).propertyGroup.create('RefractiveIndex', 'Refractive index');
        model.component(comp_tag).material(mat_tag).propertyGroup.create('NonlinearModel', 'Nonlinear model');
        % Define Feature Values and attributes
        model.component(comp_tag).material(mat_tag).label('Air');
        model.component(comp_tag).material(mat_tag).set('family', 'air');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('eta').set('arg', 'T');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('eta').set('argunit', 'K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('eta').set('fununit', 'Pa*s');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('Cp').set('arg', 'T');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('Cp').set('argunit', 'K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('expr', 'pA*0.02897/R_const[K*mol/J]/T');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('args', {'pA' 'T'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('dermethod', 'manual');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/R_const/T,pA)'; 'T' 'd(pA*0.02897/R_const/T,T)'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('argunit', 'Pa,K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('rho').set('plotargs', {'pA' '0' '1'; 'T' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('k').set('arg', 'T');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('k').set('argunit', 'K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*R_const[K*mol/J]/0.02897*T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('args', {'T'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('dermethod', 'manual');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('argunit', 'K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('fununit', 'm/s');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('cs').set('plotargs', {'T' '273.15' '373.15'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('funcname', 'alpha_p');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('expr', '-1/rho(pA,T)*d(rho(pA,T),T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('args', {'pA' 'T'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('argunit', 'Pa,K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('fununit', '1/K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an1').set('plotargs', {'pA' '101325' '101325'; 'T' '273.15' '373.15'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('funcname', 'muB');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('expr', '0.6*eta(T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('args', {'T'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('argunit', 'K');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('fununit', 'Pa*s');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').func('an2').set('plotargs', {'T' '200' '1600'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('thermalexpansioncoefficient', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('molarmass', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('bulkviscosity', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('thermalexpansioncoefficient', {'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('molarmass', '0.02897[kg/mol]');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('bulkviscosity', 'muB(T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('molarmass_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('bulkviscosity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('relpermeability_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('relpermittivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('dynamicviscosity', 'eta(T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('dynamicviscosity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('ratioofspecificheat', '1.4');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('ratioofspecificheat_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('electricconductivity', {'0[S/m]' '0' '0' '0' '0[S/m]' '0' '0' '0' '0[S/m]'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('electricconductivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('heatcapacity', 'Cp(T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('heatcapacity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('density', 'rho(pA,T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('density_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('thermalconductivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('soundspeed', 'cs(T)');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('soundspeed_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').addInput('temperature');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').addInput('pressure');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('n', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('ki', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('n', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('ki', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('n', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('ki', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').descr('n_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('RefractiveIndex').descr('ki_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('NonlinearModel').set('BA', '(def.gamma+1)/2');
        model.component(comp_tag).material(mat_tag).propertyGroup('NonlinearModel').descr('BA_symmetry', '');

    case 'Steel AISI 4340'
        % Create Features
        model.component(comp_tag).material(mat_tag).propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
        % Define Feature Values and attributes
        model.component(comp_tag).material(mat_tag).label('Steel AISI 4340');
        model.component(comp_tag).material(mat_tag).set('family', 'steel');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('relpermeability_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('electricconductivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('heatcapacity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('relpermittivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('density', '7850[kg/m^3]');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('density_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
        model.component(comp_tag).material(mat_tag).propertyGroup('def').descr('thermalconductivity_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('Enu').set('youngsmodulus', '205e9[Pa]');
        model.component(comp_tag).material(mat_tag).propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
        model.component(comp_tag).material(mat_tag).propertyGroup('Enu').set('poissonsratio', '0.28');
        model.component(comp_tag).material(mat_tag).propertyGroup('Enu').descr('poissonsratio_symmetry', '');
        
end