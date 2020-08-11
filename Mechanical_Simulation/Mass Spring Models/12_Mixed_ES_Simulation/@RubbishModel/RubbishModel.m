classdef RubbishModel < handle
    properties
        sht_dms
        N
        M
        
        mechanical_unit
        
        electrostatic_unit
        f_el
        
    end
    
    methods
        function obj=RubbishModel()
            %% Constructor with Default Parameters
            % Model Geometry
            obj.sht_dms=[0.1 0.0127 100e-6];
%             L=obj.sht_dms(2);
%             sheet_width=obj.sht_dms(2);
%             thickness=obj.sht_dms(3);
%             
%             
%             insulator_thickness=130e-6;
%             clip_l=0.01;base_l=0.01;voltage=0;
            
            %Discretization parameters
            obj.N=11;
            
            %Mechanical Physical Parameters
%             damp_factor=200;
%             k_trans=3410;
%             k_axial=5.6444e+05;
            
            % Electrostatics physical parameters
%             obj.eMed = 2.75; obj.eAir = 1; obj.eIns = 4.62; 
%             obj.EMaxMed = 20e6; obj.EMaxAir = 3e6;
            
            % Configuration Settings
%             dropVolume = 10;
            obj.M=0.06; % 60 grams mass
%             voltage=6000;
            
            
        end
        % TBD
        f_el=estimate_electrical_forces(obj) % Compute Electrostatic Forces
        update_ES_Estimator(obj) %Update Model of Electrostatics
        define_new_ES_Estimator(obj,b_points,thickness,sheet_width,clip_l,base_l,gap,Voltage,numpoints) %Generate Object to estimate ES Field
        define_new_Param_Estimator(obj,sht_dms,N,M,base_l) % Generate Object to estimate accuracy of discrete parameters
        %%
        calculate_all_forces(obj);
        calculate_external_forces(obj);
        set_damping_factor(obj,damping_factor);
        estimate_electrical_force(obj);
%         entangle_plates(obj); %Is the shitty model so no need man
    end
end

