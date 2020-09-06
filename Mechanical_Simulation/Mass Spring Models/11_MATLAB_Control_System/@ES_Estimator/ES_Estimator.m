classdef ES_Estimator < handle
    properties
        % Outsourced ES models
        comsol_model
        numerical_model
        
        % Parameters of Model
        % Geometrical parameters
        clip_l
        base_l
        sheet_width
        voltage
        thickness
        insulator_thickness
        dropVolume
        
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
            
            % Initialize parallel plate model parameters
            obj.eMed = 2.75; obj.eAir = 1; obj.eIns = 4.62; 
            obj.EMaxMed = 20e6; obj.EMaxAir = 3e6; obj.dropVolume = 10;

        end
        
        function add_comsol_model(obj,initial_points)
            % Adds COMSOL model
            % It will probably break if all points are aligned
            curve_points= [initial_points(1,:)+[-obj.clip_l 0];...
                initial_points;...
                initial_points(end,:)+[obj.base_l/2 0]];
            
            obj.comsol_model=COMSOL_ES_Model(curve_points,...
                obj.thickness,obj.insulator_thickness,obj.sheet_width,obj.voltage);
            
            obj.comsol_model.calculate_es_force(initial_points)
        end
        
        function add_analytical_model(obj)
            obj.numerical_model=Parallel_Plates_ES_Model(initial_points,...
                obj.voltage,obj.eMed,obj.eAir,obj.eIns,...
                obj.insulator_thickness,...
                obj.EMaxMed,obj.EMaxAir,obj.dropVolume,...
                obj.sheet_width);
            obj.numerical_model.calculate_es_force()
        end
        
        
        [Fy,Fx,arc_len_sim]=assign_distribute_forces_to_particles(obj,points,source)
    end
end