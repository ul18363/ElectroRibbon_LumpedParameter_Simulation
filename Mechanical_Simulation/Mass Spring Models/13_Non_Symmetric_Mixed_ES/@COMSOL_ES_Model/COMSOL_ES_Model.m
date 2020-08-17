classdef COMSOL_ES_Model < handle
    properties
        %Parameters for Model
        bottom_points
        top_points
        sheet_width
        voltage
        thickness
        insulator_thickness
        
        % Back up
        bottom_points_bu
        top_points_bu
        sheet_width_bu
        voltage_bu
        thickness_bu
        insulator_thickness_bu
        
        %Model
        model
        
        
        % Output Bottom Sheet
        xs
        ys
        ds
        arc_len
        Fy
        Fx
        cumFy
        cumFx
        Fy_dist
        Fx_dist
        
        
        % Output Top Sheet
        xs_top
        ys_top
        ds_top
        arc_len_top
        Fy_top
        Fx_top
        cumFy_top
        cumFx_top
        Fy_dist_top
        Fx_dist_top
        
    end
    properties (Access=private)
%        Fy_dist
%        Fx_dist
    end
    methods
        function obj=COMSOL_ES_Model(bottom_points,top_points,thickness,insulator_thickness,sheet_width,voltage)
            % Constructor
            obj.bottom_points=bottom_points; %Remember that COMSOL is columnar!
            obj.top_points=top_points; %Remember that COMSOL is columnar!
            obj.thickness=thickness;
            obj.sheet_width=sheet_width;
            obj.insulator_thickness=insulator_thickness;
            obj.voltage=voltage;
            obj.model=obj.generate_model();
        end
        insulator_force_y=get_insulator_force(obj);
        interface_force_y=get_interface_force(obj);
        calculate_es_force(obj,points,target);
        update_model(obj);
        do_a_backup(obj);
        restore_backup(obj);
    end
    methods(Access=private)
        calculate_distributed_force(obj,points,target);
        model = generate_model(obj);
        generate_selections(~,model)
        generate_mesh(~,model);
        generate_geometry(~,model,input_points,ins_thickness,thickness)
        generate_phyisics(~,model,initial_V,width)
        add_material(~,model,comp_tag,mat_tag,mat);
        update_model_private(obj,model)
        update_geometry_private(obj,model)
    end
end