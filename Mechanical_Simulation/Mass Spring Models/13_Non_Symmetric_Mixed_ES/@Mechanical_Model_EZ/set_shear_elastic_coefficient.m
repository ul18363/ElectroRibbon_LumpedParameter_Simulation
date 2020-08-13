function set_shear_elastic_coefficient(obj,coeff)
    obj.bottom_plate.shear_type='constant';
    obj.top_plate.shear_type='constant';
    
    obj.bottom_plate.k_trans=coeff;
    obj.top_plate.k_trans=coeff;
end