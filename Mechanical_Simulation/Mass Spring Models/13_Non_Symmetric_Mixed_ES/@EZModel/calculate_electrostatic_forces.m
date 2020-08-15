function calculate_electrostatic_forces(obj,force_source)
% calculate_electrostatic_forces(obj)
% 
%
%
%     use_cache=true;
% force_source='Manual_homogeneous_dist_force';

switch force_source
    case 'Manual_homogeneous_dist_force'
        f=[zeros(1,obj.N);ones(1,obj.N)]*obj.voltage*obj.M/obj.N;
        obj.mechanical_model.bottom_plate_ext_f=f;
        obj.mechanical_model.top_plate_ext_f=-f;  
        
    case 'Manual_concentrated_zip_force'
        f=zeros(size(obj.mechanical_model.bottom_plate.p));
        c_ix=obj.mechanical_model.contact_ix;
        f(2,c_ix+1)=obj.voltage*obj.M;
        obj.mechanical_model.bottom_plate_ext_f=f;
        obj.mechanical_model.top_plate_ext_f=-f; 
        
    case 'COMSOL'
        obj.mechanical_model.bottom_plate_ext_f=[];
        obj.mechanical_model.top_plate_ext_f=[];
    case 'Parallel Plate Model'
        obj.mechanical_model.bottom_plate_ext_f=[];
        obj.mechanical_model.top_plate_ext_f=[];
end


end