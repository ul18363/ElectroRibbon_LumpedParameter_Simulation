classdef EZModel < handle
    properties
        sht_dms
        material
        N
        gap
        base_width
        M
        top_plate
        bottom_plate
        f_el_top
        f_el_btm
        g
        f_free_tip
    end
    
    methods
        function obj=EZModel(sht_dms,N,material,base_width,gap)
            obj.sht_dms=sht_dms;
            obj.N=N;
            obj.material=material;
            obj.gap=gap;
            obj.base_width=base_width;
            obj.M=0;%load mass
            obj.g=[0;-9.81];
            %obj.g=[0;-9.81];
            %SheetModel(sht_dms,N,x0,y0,material)
            % We are going to simulate half of the plate and rely on
            % symmetry
            sht_dms(1)=(sht_dms(1)-base_width)/2;
            %Define Bottom plate
            obj.bottom_plate=SheetModel(sht_dms,N,0,0,material);
            obj.bottom_plate.define_force_bc('r_fix_x');%Right edge slides on "y"
            obj.bottom_plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
            
            obj.top_plate=SheetModel(sht_dms,N,0,gap,material);
            obj.top_plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
            obj.top_plate.define_force_bc('r_fix');%Right edge is fixed
            %% The top plate 
        end
        
        function calculate_all_forces(obj)
            obj.bottom_plate.calculate_all_forces(); % Calculate Forces on the bottom plate
            obj.top_plate.calculate_all_forces();    % Calculate Forces on the top plate
            obj.calculate_external_forces();
            obj.entangle_plates();
        end
        function calculate_external_forces(obj)
            % Force of the load
            obj.f_free_tip=obj.bottom_plate.f(:,end);
            dm=obj.bottom_plate.dm;
            f_loaded_tip=(obj.f_free_tip+obj.M*obj.g)*dm/(obj.M+dm);
            obj.bottom_plate.f(:,end)=f_loaded_tip;
            % ES forces
            obj.estimate_electrical_force();
            obj.top_plate.f=obj.top_plate.f+obj.f_el_top;
            obj.bottom_plate.f=obj.bottom_plate.f+obj.f_el_btm;
        end
        function set_damping_factor(obj,damping_factor)
            obj.top_plate.damp_factor=damping_factor; %Damping Factor
            obj.bottom_plate.damp_factor=damping_factor; %Damping Factor
            
        end
        function estimate_electrical_force(obj)
            obj.f_el_top=zeros(size(obj.top_plate.f)); % For now as zeros
            obj.f_el_btm=zeros(size(obj.bottom_plate.f)); % For now as zeros
        end  
        function entangle_plates(obj)
            f=(obj.top_plate.f(:,1)+obj.bottom_plate.f(:,1))/2;
            obj.top_plate.f(:,1)=f;
            obj.bottom_plate.f(:,1)=f; % Both ends have equal force and masses thus equal acc,vel & pos
            % If by any chance the plates were different we need to equate
            % the accelerations of the ends
            % f_e=f1_ne+f2_ne->f1_e=f_e*m1/(m1+m2);f2_e=f_e*m2/(m1+m2);
        end
        %function estimate_parameters(obj)
    end
end

