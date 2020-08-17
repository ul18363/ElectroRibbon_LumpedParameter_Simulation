function set_computation_definitions(obj,direct_force_type,shear_deformation_definition)
%         axial_type % Determines how the direct elastic coefficient behaves
%         shear_type % Determines how the shear  elastic coefficient behaves
%         direct_force_type            % Defines how the direct force is computated given its coefficient
%         shear_deformation_definition % Defines how the shear  force is computated given its coefficient
        
    obj.bottom_plate.direct_force_type=direct_force_type; 
    obj.top_plate.direct_force_type=direct_force_type; 
    
    obj.bottom_plate.shear_deformation_definition=shear_deformation_definition;
    obj.top_plate.shear_deformation_definition=shear_deformation_definition; 
end