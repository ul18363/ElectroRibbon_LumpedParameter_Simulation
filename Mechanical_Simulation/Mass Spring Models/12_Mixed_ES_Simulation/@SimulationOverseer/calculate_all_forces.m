function calculate_all_forces(obj)
obj.bottom_plate.calculate_all_forces(); % Calculate Forces on the bottom plate
obj.top_plate.calculate_all_forces();    % Calculate Forces on the top plate
obj.calculate_external_forces();
obj.entangle_plates();
end