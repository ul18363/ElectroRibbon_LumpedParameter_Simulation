classdef Simulator < handle
    % Interface between the Graphical User Interface and the Model
    % It contains simulation steps & Logic
    
    properties
        object_to_simulate
    end
    
    methods
        function obj=Simulator(object_to_simulate)
            
            
            %% Constructor
            obj.object_to_simulate=object_to_simulate;
            
            
            
            
        end
        perform_simulation_step(obj);
    end
end

