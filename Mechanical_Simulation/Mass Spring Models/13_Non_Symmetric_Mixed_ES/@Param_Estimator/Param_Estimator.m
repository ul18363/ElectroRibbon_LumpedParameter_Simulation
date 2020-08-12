
classdef Param_Estimator < handle
    % Param_Estimator:
    % Validates the results obtained from a stationary solution of a
    %  mechanical model against a source of truth
    %
    % For this application these are:
    %
    % Mechanical Model:  @Mechanical_Model Class (mass_spring_model)
    % Source of Truth Model:  @COMSOL_Mechanical Class (comsol_model)
    properties
        % Parameters
        enable_comsol
        mass_spring_model
        % Sources of Truth
        comsol_model
        % Outputs
        real_static_coeffs
        matrix_sys_A
        independent_forces_b
        real_static_axial_coeffs
        real_static_trans_coeffs
        eqns
        vars
    end
    
    methods
        function obj=Param_Estimator(mass_spring_model,comsol_enabled)   
            obj.mass_spring_model=mass_spring_model;
            if comsol_enabled
                obj.add_or_update_comsol_model();
            end
        end
        add_or_update_comsol_model(obj);
        create_comsol_plot(obj,model);
        obtain_static_coefficients(obj);
        analyze_deflections(obj);
        error_est=estimate_error(obj,error_type);
    end
end

