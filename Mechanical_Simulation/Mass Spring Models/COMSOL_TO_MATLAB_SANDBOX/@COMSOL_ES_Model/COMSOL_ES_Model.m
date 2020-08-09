classdef COMSOL_ES_Model < handle
    properties
        points
        clip_l
        base_l
        sheet_width
        %bE
        gap
        voltage
        thickness
        insulator_thickness
        model
        x
        y
        unTy
        unTx
        dFy
        dFx
        da
        cumFy
        cumFx
        numpoints
    end
    methods
        function obj=COMSOL_ES_Model(initial_points,thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage)
            % Constructor
            obj.points=initial_points;
            obj.thickness=thickness;
            obj.sheet_width=sheet_width;
            obj.insulator_thickness=insulator_thickness;
            obj.clip_l=clip_l;
            obj.base_l=base_l;
            obj.voltage=voltage;
            obj.model=obj.generate_model();
        end
        update_X_Symmetry_model(obj);
        data=get_x_symmetry_bezier_data(obj,attr);
        data=get_x_symmetry_plate_data(obj,attr,type);
        run_solver(obj);
        [forcey,forcex]=x_sym_assign_force_to_points(obj,points);
        x_sym_update_force_distribution(obj);
        
    end
    methods(Access=private)
        model = generate_model(obj);
        add_material(~,model,comp_tag,mat_tag,mat);
    end
end