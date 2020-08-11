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
            %% Constructor
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
            % Bottom plate
            obj.bottom_plate=SheetModel(sht_dms,N,0,0,material);
            obj.bottom_plate.define_force_bc('r_fix_x');%Right edge slides on "y"
            obj.bottom_plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
            % Top Plate
            obj.top_plate=SheetModel(sht_dms,N,0,gap,material);
            obj.top_plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
            obj.top_plate.define_force_bc('r_fix');%Right edge is fixed
            
        end
        calculate_all_forces(obj);
        calculate_external_forces(obj);
        set_damping_factor(obj,damping_factor);
        estimate_electrical_force(obj);
        entangle_plates(obj);
    end
end

