function set_internal_damping_factor(obj,coeff)
    obj.bottom_plate.internal_damp_factor=coeff; %Damping Factor
    obj.top_plate.internal_damp_factor=coeff; %Damping Factor
end