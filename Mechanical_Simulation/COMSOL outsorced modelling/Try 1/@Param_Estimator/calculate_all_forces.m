function calculate_all_forces(obj)
obj.plate.calculate_all_forces(); % Calculate Forces on the plate
obj.calculate_external_forces(); % Calculate forces induced by the hanging mass
end