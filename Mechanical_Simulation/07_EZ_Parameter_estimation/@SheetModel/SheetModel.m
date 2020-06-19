classdef SheetModel < handle % "< handle"  allow you to pass the instance as reference
    % SheetModel Summary 
    %   Creates model of the sheet using the mass-spring approach
    
    properties
        A
        count
        dt_st
        f_ii_i_reactive
        local_dp
        p
        x_r0
        E
        damp_factor
        f
        f_trans
        local_dpx
        p_ratio
        x_rel
        G
        %def_i_ii
        f_axial
        g
        local_dpy
        po
        x_rend
        GA
        %def_ii_i
        f_damping
        i
        local_frame_x
        r_dpo
        y_rel
        L
        dl
        f_elastic
        k_axial
        local_frame_y
        rho
        N
        dm
        f_gravity
        k_trans_vec
        local_xo
        R
        dp
        f_i_ii
        l_dpo
        local_yo
        sht_dms
        T
        %dp_f
        f_i_ii_reactive
        local_def_x
        m
        v
        a
        dpo
        f_ii_i
        local_def_y
        o
        x0
        y0
        material
        x
        y
        x_r0_c
        x_rend_c
        f_mask
        dpo_mag
        dp_mag
        dp_def
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
            obj.dm=obj.m/obj.N;     % Mass for individual mass element
            obj.dl=obj.L/(obj.N-1); % Unstrained length of individual segment
            obj.k_axial=obj.E*obj.A/(obj.L*(obj.N-1));
            %disp(obj.GA)
            %disp(obj.dp)
            
            obj.k_trans_vec=(obj.GA)./vecnorm(obj.dp);%%%%%%%%%%%%
            obj.damp_factor=2e2; %Damping Factor
            %obj.k_trans=obj.G*obj.A/obj.dl;
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

        function dp=dp_f(~,p)
            dp=diff(p,1,2);
        end
        function scaled_vect= scale_up(~,vect,scale)
            scaled_vect=vect.*[scale;scale];
        end
        
        calculate_local_frames(obj);
        %obj= perform_timestep()
        
%         scale_up=@  vect.*[scale;scale];
%         dp_f=@(p)diff(p,1,2);
%         def_i_ii = @(dp_v) [o -dp_v]-l_dpo; % Calculates local deformation from particle to the left
%         def_ii_i = @(dp_v) [dp_v o]-r_dpo;  % Calculates local deformation from particle to the right
    end
end

