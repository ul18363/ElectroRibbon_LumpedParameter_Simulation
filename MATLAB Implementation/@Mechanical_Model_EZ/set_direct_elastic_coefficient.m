function set_direct_elastic_coefficient(obj,coeff)
        
    obj.bottom_plate.axial_type='constant';
    obj.top_plate.axial_type='constant';
    
    obj.bottom_plate.k_axial=coeff;
    obj.top_plate.k_axial=coeff;
end