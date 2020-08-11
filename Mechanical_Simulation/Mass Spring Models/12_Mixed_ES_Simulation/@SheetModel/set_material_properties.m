function set_material_properties(obj)
if isequal(obj.material,'steel') || isequal(obj.material,'Steel AISI 4340')
    %disp('Material is steel')
    obj.rho=7850; %Density [kg/m3]
    obj.E=(190+210)/2 *10^9; %Modulus of Elasticity [GPa -> e9 N/m2]
    obj.p_ratio=(0.27+0.30)/2; %Poission_ratio
    obj.G=obj.E/(2*(1+obj.p_ratio));%Shear Modulus (G also mu)
end
end
