function calculate_all_forces(obj,f_ext)
obj.plate.calculate_all_forces(); % Calculate Elastic Forces on the plate
obj.plate.f=obj.plate.f+f_ext;
obj.add_load_forces(); % Calculate forces induced by the hanging mass
end