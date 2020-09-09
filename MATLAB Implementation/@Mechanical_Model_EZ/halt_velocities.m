function halt_velocities(obj)
    obj.bottom_plate.v=obj.top_plate.v*0; %Damping Factor
    obj.top_plate.v=obj.top_plate.v*0; %Damping Factor
end