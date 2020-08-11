
classdef COMSOL_Mechanical < handle
    properties
        % Input for model 
        sht_dms
        N
        M
        L
        sheet_width
        thickness
        og_p % Points of polygons (which are tracked)

        % COMSOL object
        model
        
        %Output
        real_x
        real_y
        real_u
        real_v
        real_p
        real_x_btm
        real_y_btm
        real_u_btm
        real_v_btm
        real_p_btm
        real_x_tp
        real_y_tp
        real_u_tp
        real_v_tp
        real_p_tp
        tp_ixs
        btm_ixs
    end
    
    methods
        function obj=COMSOL_Mechanical(sht_dms,N)    
            obj.sht_dms=sht_dms;
            obj.N=N;
            obj.M=0;%load mass
            obj.L=sht_dms(1);
            obj.sheet_width=sht_dms(2);
            obj.thickness=sht_dms(3);

            dl=obj.L/(N-1);
            x_side=0:dl:obj.L;
            x=[x_side, flip(x_side)];
            y=[ones(1,N)*obj.thickness,zeros(1,N)];
            obj.og_p=[x' y'];
            obj.connect_to_comsol()
            obj.model=obj.create_model(obj.og_p,obj.sheet_width,obj.M,obj.N);
        end
        
        create_comsol_plot(obj,model);
        show_comsol_plot(obj);
        set_elastic_coefficients(obj);
        connect_to_comsol(obj);
        run_solver_static_conditions(obj);
        update_model(obj);
        retrieve_real_final_position(obj)

    end
end

