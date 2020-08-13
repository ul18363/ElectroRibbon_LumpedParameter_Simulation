classdef SheetModel < handle % "< handle"  allow you to pass the instance as reference
    % SheetModel Summary
    %   Creates model of the sheet using the mass-spring approach
    
    properties
        %def_i_ii
        %def_ii_i
        %dp_f
        
        %Geometry
        sht_dms
        L
        x0    % Original left corner x position of the sheet
        y0    % Original left corner y position of the sheet
        A %Area
        
        %Physical attributes
        material
        p_ratio % Poisson Ratio
        E % Young's Modulus
        G % Shear Modulus constant
        GA
        T % Non Existent (Deprecate!)
        count % Non Existent (Deprecate!)
        damp_factor
        rho
        
        dt_st % Timestep size (Obsolete)
        
        %Discrete parameters
        dl
        N
        
        % Model Configuration Option
        axial_type
        shear_type
        
        % Mass
        m
        dm
        dm_vec
        
        % Aboslute Displacements
        dp
        dp_def
        dp_mag
        
        
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
        
        % Constants
        g % [0 ;-9.81] - Gravitational acceleration at Earth surface
        i % Non Existent (Deprecate!)
        o % [0;0] - shortcut for a 2D zero vector 
        R % Rotation Matrix (used to get perpendicular vectors fast)
        
        % Elastic Coefficients 
        k_axial
        k_axial_vec
        k_trans
        k_trans_vec
        
        %Local displacements and reference frames
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
        
        y_rel %Relative frame y axis in global coordinates
        x_rel %Relative frame x axis in global coordinates
        
        
        % Initial Configurations
        po      % Original Position
        r_dpo   % Original relative position of the next element to the right
        dpo
        dpo_mag
        local_xo
        local_yo
        
        % Absolute coordinate state description
        p %Position
        v %Velocity
        a %Acceleration
        
        x % Position x component (To be Deprecated, not widely used)
        y % Position y component (To be Deprecated, not widely used)
        
        % End conditions for orientation
        x_r0
        x_r0_c
        x_rend
        x_rend_c
        
        
        %Back_up_Conditions
        p_bu
        v_bu
        a_bu
        
    end
    
    methods
        %obj= SheetModel([0.1 0.0127 100e-6],11,0,0,'steel');
        function obj = SheetModel(sht_dms,N,x0,y0) %Generate Default model
            
            obj.x0=x0;
            obj.y0=y0;
            obj.material='steel'; %Before a parameter
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
        perform_pseudostatic_timestep(obj,dt);
        
        define_edges_orientation_bc(obj,x_r0_c,x_rend_c);
        calculate_acceleration(obj);
                
        do_a_backup(obj);
        restore_backup(obj);
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

