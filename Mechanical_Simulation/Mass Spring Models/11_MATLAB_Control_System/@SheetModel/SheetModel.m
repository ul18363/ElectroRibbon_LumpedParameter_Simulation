classdef SheetModel < handle % "< handle"  allow you to pass the instance as reference
    % SheetModel Summary
    %   Creates model of the sheet using the mass-spring approach
    
    properties
        %def_i_ii
        %def_ii_i
        %dp_f
        A
        E
        G
        GA
        L
        N
        R
        T
        a
        axial_type
        count
        damp_factor
        dl
        dm
        dm_vec
        dp
        dp_def
        dp_mag
        dpo
        dpo_mag
        
        dt_st
        
        %Forces Variables
        f
        f_axial_ltr
        f_axial_rtl
        f_damping
        f_elastic
        f_gravity
        f_i_ii
        f_i_ii_reactive
        f_ii_i
        f_ii_i_reactive
        f_mask
        f_trans_ltr
        f_trans_rtl
        g
        i
        k_axial
        k_axial_vec
        k_trans
        k_trans_vec
        l_dpo
        local_def_x_ltr
        local_def_x_rtl
        local_def_y_ltr
        local_def_y_rtl
        local_dp
        local_dpx_ltr
        local_dpx_rtl
        local_dpy_ltr
        local_dpy_rtl
        local_frame_x_ltr
        local_frame_x_rtl
        local_frame_y_ltr
        local_frame_y_rtl
        local_xo
        local_yo
        m
        material
        o
        p
        p_ratio
        po
        r_dpo
        rho
        shear_type
        sht_dms
        v
        x
        x0
        x_r0
        x_r0_c
        x_rel
        x_rend
        x_rend_c
        y
        y0
        y_rel
        
        %Back_up_Conditions
        p_bu
        v_bu
        a_bu
    end
    
    methods
        %obj= SheetModel([0.1 0.0127 100e-6],11,0,0,'steel');
        function obj = SheetModel(sht_dms,N,x0,y0,material) %Generate Default model
            obj.x0=x0;
            obj.y0=y0;
            obj.material=material;
            obj.N=N;
            obj.sht_dms=sht_dms;
            obj.dt_st=1e-7;  %Timestep size (1e-7 is stable for a range of configs.)
            obj.generate_config();
        end
      
        plot_local_frames(obj);
        calculate_local_frames(obj);
        reco_dt=analyze_divergence(obj,dt);
        reset_sheet_to_initial_conditions(obj);
        perform_timestep(obj,dt);
        define_edges_orientation_bc(obj,x_r0_c,x_rend_c);
        
    end
    
    methods(Access=private)
        dp=dp_f(~,p);
        generate_config(obj);
        generate_model(obj);
        generate_discrete_model(obj);
        set_material_properties(obj);
        snap_initial_configuration(obj);
        scaled_vect= scale_up(~,vect,scale);
    end
end

