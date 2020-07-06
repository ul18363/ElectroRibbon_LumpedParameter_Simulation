classdef ES_Estimator < handle
    properties
        bezier_points
        clip_l
        base_l
        sheet_width
        %bE
        gap
        voltage
        thickness
        model
    end
    methods
        function obj=ES_Estimator(bezier_points,thickness,sheet_width,clip_l,base_l,gap,voltage)
            % Constructor
            obj.bezier_points=bezier_points;
            obj.thickness=thickness;
            obj.sheet_width=sheet_width;
            obj.clip_l=clip_l;
            obj.base_l=base_l;
            obj.gap=gap;
            obj.voltage=voltage;
            obj.model=obj.create_X_Symmetry_ES_model();
        end
        update_X_Symmetry_model(obj);
        data=get_x_symmetry_bezier_data(obj,attr,numpoints);
        data=get_x_symmetry_plate_data(obj,attr,type);
        
    end
    methods(Access=private)
        model = create_X_Symmetry_ES_model(obj);
        add_material(~,model,comp_tag,mat_tag,mat);
    end
end