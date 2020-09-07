classdef ES_Estimator < handle
    properties
        % Outsourced ES models
        comsol_EZ_model
        numerical_model
        comsol_flange_model
        
        % Parameters of Model
        % Geometrical parameters
        clip_l
        base_l
        sheet_width
        voltage
        thickness
        insulator_thickness
        dropVolume
        distribution_method
        % Physical parameters
        eMed
        eAir
        eIns
        EMaxMed 
        EMaxAir
    end
    methods
        function obj=ES_Estimator(thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage)
            % Constructor with general guidelines
            obj.thickness=thickness;
            obj.sheet_width=sheet_width;
            obj.clip_l=clip_l;
            obj.base_l=base_l;
            obj.voltage=voltage;
            obj.insulator_thickness=insulator_thickness;
            obj.distribution_method='Sharp_accumulation_over_height';
            % Initialize parallel plate model parameters
            obj.eMed = 2.75; obj.eAir = 1; obj.eIns = 4.62; 
            obj.EMaxMed = 20e6; obj.EMaxAir = 3e6; obj.dropVolume = 10;

        end

        
        add_analytical_model(obj,initial_points);
        add_comsol_model(obj,bottom_points,top_points);
        add_comsol_flange_model(obj,initial_points);
        
        remove_comsol_model(obj);
        refresh_comsol_forces(obj);
        update_comsol_model(obj,bottom_points,top_points);
        [Fy,Fx,arc_len_sim]=assign_distribute_forces_to_particles(obj,points,source)
    end
end