function calculate_all_forces(obj,f_ext)
obj.attach_load(); % Add additional Load to actuator before start with any computation 
obj.plate.calculate_all_forces(); % Calculate Elastic Forces on the plate
obj.plate.f=obj.plate.f+f_ext;
% obj.add_load_forces(); % Calculate forces induced by the hanging mass
end