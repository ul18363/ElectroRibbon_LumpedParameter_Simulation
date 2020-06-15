classdef Dummy
    %DICT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        important_prop1
        prop2
        %content
        %size
        
    end
    properties (Access = private)
        extra_props
        important_prop_list
    end
    methods
        
        output= helloworld(obj)
        output= get_properties(obj)
        
        function obj = Dummy(inputArg1)
            %DICT Construct an instance of this class
            %   Detailed explanation goes here
            disp(inputArg1)
            extra_props=py.dict();
            important_prop_list=
            %obj.Property1 = inputArg1 + inputArg2;
        end
        function add_property(obj,cell_prop)
            nmel=size(cell_prop,1);
            keys=cell_prop(:,1);
            
            for i =1:nmel
               key=keys{i}; 
            end
            vals
            %DICT Construct an instance of this class
            %   Detailed explanation goes here
            disp(inputArg1)
            %obj.Property1 = inputArg1 + inputArg2;
        end
    end
end

