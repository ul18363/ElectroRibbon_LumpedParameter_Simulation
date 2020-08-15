classdef EZModel < handle
    properties
        % Underlying Models
        mechanical_model
        electrostatic_model
        
        % Parameters
        sht_dms
        base_l
        clip_l
        ins_thickness
        N
        M
        voltage
    end
    
    methods
        function obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M)
            % EZModel
            %
            % obj=EZModel(sht_dms,N,base_l,clip_l,ins_thickness,M)
            %
            % Class that simulates the Electro-Ribbon actuator
            % electro-mechanical behaviour. It combines and coordinates
            % the Mechanical model with the Electrostatic Model.
            %
            % Inputs:
            % sht_dms - (sheet dimensions)[m] : The dimensions of the
            % region within the clipping area as [lenght, width, thickness]            
            %
            % N: The number of masses in the mass-spring model
            %
            % base_l: The length in [m] of the platforms in the actuator
            % where the load is attached (and the length the platform that
            % fixes the actuator to the ceiling.
            %
            % clip_l: The length of the clips used to attach the plates to
            % each other
            %
            % ins_thickness: Thickness of the insulator layer (assumed the
            % same for each sheet).
            %
            % M: Attached load in [kg].
            
            
            %% Constructor
            obj.sht_dms=sht_dms; %[ Length between clips, width, thickness]
            obj.N=N;
            obj.base_l=base_l;
            obj.M=M;%load mass
            obj.clip_l=clip_l;
            obj.ins_thickness=ins_thickness;
            obj.voltage=0;
            flexible_segment_dimensions=[(sht_dms(1)-base_l)/2 sht_dms(2) sht_dms(3)];
%             sht_dms(1)=(sht_dms(1)-base_l)/2;
            
            obj.mechanical_model=Mechanical_Model_EZ(...
                flexible_segment_dimensions,N);
            obj.mechanical_model.M=M/2; 
            obj.electrostatic_model=ES_Estimator(sht_dms(3),...
                ins_thickness,sht_dms(2),clip_l,base_l,obj.voltage);
            
        end
        
        update_electrostatic_forces(obj);
        success_flag=perform_timestep(obj,dt);
        calculate_electrostatic_forces(obj,force_source);
        net_f=overall_force(obj,option);
        update_ES_model(obj,source);
    end
    
    methods (Access=private)
%         calculate_electrostatic_forces(obj)
    end
end

