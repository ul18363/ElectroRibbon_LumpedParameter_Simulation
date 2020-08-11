function set_elastic_coefficients(obj)
    obj.plate.axial_type='manual';
    obj.plate.shear_type='manual';
    obj.plate.k_axial_vec=obj.real_static_axial_coeffs';
    obj.plate.k_trans_vec=obj.real_static_trans_coeffs';
end