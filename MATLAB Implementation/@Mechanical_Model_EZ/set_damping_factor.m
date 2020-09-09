function set_damping_factor(obj,damping_factor)
    obj.bottom_plate.damp_factor=damping_factor; %Damping Factor
    obj.top_plate.damp_factor=damping_factor; %Damping Factor
end