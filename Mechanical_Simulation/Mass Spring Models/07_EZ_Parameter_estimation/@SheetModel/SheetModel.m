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
        dp
        dp_def
        dp_mag
        dpo
        dpo_mag
        dt_st
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
        
        function generate_config(obj)
            %
            obj.o=[0;0];
            obj.R=[0 -1; 1 0]; %Rotation Matrix
            obj.set_material_properties(); % Set properties as E, G, poisson ratio...
            obj.g=-9.81; %Gravity Constant
            
            %Basic Geometry & Geometry settings
            obj.L=obj.sht_dms(1);
            obj.A=prod(obj.sht_dms(2:end));% Cross sectional Area [m2]
            obj.m=prod(obj.sht_dms)*obj.rho; % Mass of the sheet [Kg]
            obj.GA=obj.G*obj.A;
            
            obj.x=(0:obj.sht_dms(1)/(obj.N-1):obj.sht_dms(1))+obj.x0;
            obj.y=zeros(size(obj.x))+obj.y0;
            
            obj.p=[obj.x;obj.y]; %Position vector
            obj.v=zeros(size(obj.p));% Initial Velocity
            obj.a=zeros(size(obj.p));% Initial Acceleration
            obj.dp=obj.dp_f(obj.p);% Relative difference in position in global coordinates
            %Discretization
            obj.generate_discrete_model(); % Establish masses, spring constants, damping factor
            obj.f_gravity=[zeros(size(obj.x));ones(size(obj.y))*obj.g]*obj.dm; %Define the gravity force
            obj.snap_initial_configuration(); % Save initial configuration
            obj.define_force_bc('all_free')
        end
        % Inputs: sht_dms,N,x0,y0,material
        function generate_model(obj)
            obj.set_material_properties();
            obj.m=prod(obj.sht_dms)*obj.rho; % Mass of the sheet [Kg]
            obj.L=obj.sht_dms(1);
            obj.A=prod(obj.sht_dms(2:end));% Cross sectional Area [m2]
            obj.GA=obj.G*obj.A;
        end
        
        function define_edges_orientation_bc(obj,x_r0_c,x_rend_c)
            obj.x_r0_c=x_r0_c;
            obj.x_rend_c=x_rend_c;
            obj.x_r0=obj.x_r0_c;
            obj.x_rend=obj.x_rend_c;
        end
        
        function generate_discrete_model(obj)
            obj.axial_type='constant'; % Axial elastic coefficient is constant
            obj.shear_type='inverse_to_length'; %Transverse/Shear elastic coefficient is inverse to length
            obj.dm=obj.m/obj.N;     % Mass for individual mass element
            obj.dl=obj.L/(obj.N-1); % Unstrained length of individual segment
            obj.k_axial=obj.E*obj.A/(obj.L*(obj.N-1)); %Constant coefficient by material properties
            obj.k_trans=obj.G*obj.A/obj.dl; % Constant shear coefficient by material coefficient (Doesn't take into account beam profile)
            obj.k_trans_vec=(obj.GA)./vecnorm(obj.dp);%Shear coefficient Formula (Doesn't take into account beam profile)
            obj.damp_factor=2e2; %Damping Factor
        end
        
        function set_material_properties(obj)
            if isequal(obj.material,'steel') || isequal(obj.material,'Steel AISI 4340')
                %disp('Material is steel')
                obj.rho=7850; %Density [kg/m3]
                obj.E=(190+210)/2 *10^9; %Modulus of Elasticity [GPa -> e9 N/m2]
                obj.p_ratio=(0.27+0.30)/2; %Poission_ratio
                obj.G=obj.E/(2*(1+obj.p_ratio));%Shear Modulus (G also mu)
            end
        end
        
        function snap_initial_configuration(obj)
            obj.po=obj.p;
            obj.dpo=obj.dp;
            obj.local_xo=obj.dpo(1,:);
            obj.local_yo=obj.dpo(2,:);
            obj.dpo_mag=sqrt([1 1]*obj.dpo.^2);
            obj.r_dpo=[obj.dp obj.o];    % Relative position of the next element to the right
            obj.l_dpo=[obj.o -obj.dp];   % Relative position of the next element to the left
        end
        function reset_state(obj)
            obj.p=obj.po;
            obj.dp=obj.dpo;
            obj.a=zeros(size(obj.a));
            obj.v=zeros(size(obj.v));
        end
        function dp=dp_f(~,p)
            dp=diff(p,1,2);
        end
        function scaled_vect= scale_up(~,vect,scale)
            scaled_vect=vect.*[scale;scale];
        end
        plot_local_frames(obj);
        calculate_local_frames(obj);
        %obj= perform_timestep()
        
        %         scale_up=@  vect.*[scale;scale];
        %         dp_f=@(p)diff(p,1,2);
        %         def_i_ii = @(dp_v) [o -dp_v]-l_dpo; % Calculates local deformation from particle to the left
        %         def_ii_i = @(dp_v) [dp_v o]-r_dpo;  % Calculates local deformation from particle to the right
    end
end

