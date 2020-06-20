function compute_elastic_coefficients(obj)
% estimate_elastic_coefficients(obj)
% Estimates the 
dims=[1,length(obj.dp)];
%obj.axial_type='constant';
switch obj.axial_type
    case 'constant'
        obj.k_axial_vec=ones(dims)*obj.k_axial;
    case 'symbolic'
        obj.k_axial_vec=sym('Ka',dims);
    case 'manual'
    
    case 'deformation_dependent'
    obj.k_axial_vec=polyval(obj.pol_axial,dp_def);
end
%shear_type='inverse_to_length';
switch obj.shear_type
    case 'constant'
        obj.k_trans_vec=ones(dims)*obj.k_trans;
    case 'inverse_to_length'
        obj.k_trans_vec=(obj.GA)./vecnorm(obj.dp);
    case 'symbolic'
        obj.k_trans_vec=sym('Kt',dims);
    case 'manual'
        
    case 'angle_dependent'
        obj.k_trans_vec=polyval(obj.pol_trans,obj.angles);
end
end

