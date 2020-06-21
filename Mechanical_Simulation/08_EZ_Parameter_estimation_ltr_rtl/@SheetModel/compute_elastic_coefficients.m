function compute_elastic_coefficients(obj)

% Direct/Axial Elastic coefficients
switch obj.axial_type
    case 'constant'
        obj.k_axial_vec=ones(dims)*obj.k_axial;
    case 'symbolic' %Usually used for parameter estimation, not to be used in loop
        dims=[1,length(obj.dp)];% One coefficient per edge
        obj.k_axial_vec=sym('Ka',dims);
    case 'manual'
        
    case 'deformation_dependent' %Usually used for parameter estimation, not to be used in loopA
        obj.k_axial_vec=create_symbolic_polynomial('Ka',obj.dp_def,length(obj.pol_axial));
end

% Transversal/Shear Elastic coefficients
switch obj.shear_type
    case 'constant'
        obj.k_trans_vec=ones(dims)*obj.k_trans;
    case 'inverse_to_length'
        obj.k_trans_vec=(obj.GA)./vecnorm(obj.dp);
    case 'symbolic' %Usually used for parameter estimation, not to be used in loop
        dims=[1,length(obj.dp)]; % One coefficient per edge
        obj.k_trans_vec=sym('Kt',dims);
    case 'manual'
        
    case 'angle_dependent'
        % obj.pol_trans: The polynomial coefficients need to be real
        obj.k_trans_vec=polyval(obj.pol_trans,obj.angles);
        
    case 'symbolic_polynomial' %Usually used for parameter estimation, not to be used in loop
        obj.k_trans_vec=create_symbolic_polynomial('Kt',obj.angles,length(obj.pol_trans)); %The Elastic coefficient is the polynomial & The order of the polynomial is unchanged
end
end

function sym_pol=create_symbolic_polynomial(coeffs_label,variable,degree)
pol_coeffs=sym(coeffs_label,[1,degree]);%Create symbolic coefficients
mat_of_powers=ones([size(variable,1) degree]).^repmat(variable,degree-1,0); % Create matrix with variable at different powers
sym_pol=(mat_of_powers*pol_coeffs')'; %The Elastic coefficient is the polynomial
end