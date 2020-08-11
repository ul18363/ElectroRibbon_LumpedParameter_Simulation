% Inputs: sht_dms,N,x0,y0,material
function generate_model(obj)
obj.set_material_properties();
obj.m=prod(obj.sht_dms)*obj.rho; % Mass of the sheet [Kg]
obj.L=obj.sht_dms(1);
obj.A=prod(obj.sht_dms(2:end));% Cross sectional Area [m2]
obj.GA=obj.G*obj.A;
end
