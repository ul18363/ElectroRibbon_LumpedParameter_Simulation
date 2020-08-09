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
        
        [f_btm_insulator,f_top_insulator,f_top_interface]=get_results(model,initial_points);
        insulator_force_y=get_insulator_force(obj)
    end
    methods(Access=private)
        model = generate_model(obj);
        generate_selections(~,model)
        generate_mesh(~,model);
        generate_geometry(~,model,input_points,ins_thickness,thickness)
        generate_phyisics(~,model,initial_V,width)
        add_material(~,model,comp_tag,mat_tag,mat);
    end
end