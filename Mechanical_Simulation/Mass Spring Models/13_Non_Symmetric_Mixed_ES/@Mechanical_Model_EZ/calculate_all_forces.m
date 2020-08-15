function calculate_all_forces(obj)
%         bottom_plate
%         top_plate
%
%         bottom_plate_ext_f
%         top_plate_ext_f

% 1. Add load
obj.attach_load(); % Add Load to actuator before start with any computation

% 2. Calculate Elastic Forces
obj.bottom_plate.calculate_all_forces(); % Calculate Elastic Forces on the bottom plate
obj.top_plate.calculate_all_forces(); % Calculate Elastic Forces on the plate


% 3. Add external forces
if ~isempty(obj.bottom_plate_ext_f)
    obj.bottom_plate.f=obj.bottom_plate.f+obj.bottom_plate_ext_f;
end

if ~isempty(obj.top_plate_ext_f)
    obj.top_plate.f=obj.top_plate.f+obj.top_plate_ext_f;
end

% 4. Contact points travel toghether
% Implement contact forces so that contact points move toghether
% obj.implement_contact_forces();
end