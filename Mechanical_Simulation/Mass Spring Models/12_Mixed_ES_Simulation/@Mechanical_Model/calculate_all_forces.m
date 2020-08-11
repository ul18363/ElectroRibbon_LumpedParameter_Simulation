function calculate_all_forces(obj)

obj.attach_load(); % Add additional Load to actuator before start with any computation 
obj.plate.calculate_all_forces(); % Calculate Elastic Forces on the plate
if isempty(obj.f_ext)
    obj.f_ext=zeros(size(obj.plate.p));
end
obj.plate.f=obj.plate.f+obj.f_ext;
% obj.add_load_forces(); % Calculate forces induced by the hanging mass
end