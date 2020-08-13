
classdef Mechanical_Model_EZ < handle
    properties
        M
        
        bottom_plate
        top_plate
        
        bottom_plate_ext_f
        top_plate_ext_f

    end
    
    methods
        function obj=Mechanical_Model_EZ(sht_dms,N)
            % Mechanical_Model(sht_dms,N,material,base_width)
            %
            % Represents the mechanical model of the Electro-Ribbon actuator
            % Simulates the dynamics of left flexible segment of the bottom sheet (to improve performance)
            % Assumptions:
            %       - Deformation of all sheet segments is symmetrical
            %       - Fix point is the left edge (This is an big error to be fixed!)
            %         Will be fixed by:
            %                           1. Introducing a Top sheet  (Probably more robust)
            %                           2. Adding an overall force component on the left tip (due to the symmetry of deformations) (Probably more efficient,bigger headache)


            obj.M=0;%load mass

            % Bottom plate
            obj.bottom_plate=SheetModel(sht_dms,N,0,0);
            obj.bottom_plate.define_force_bc('r_fix_x');%Right edge slides on "y"
            obj.bottom_plate.define_edges_orientation_bc([1;0],[1;0]); %Left & right edges have horizontal orientation
            % Top Plate
            obj.top_plate=SheetModel(sht_dms,N,0,0);
            obj.top_plate.define_edges_orientation_bc([1;0],[1;0]); %Left & right edges have horizontal orientation
            obj.top_plate.define_force_bc('r_fix');%Right edge is fixed
        end

        calculate_all_forces(obj);
        perform_timestep(obj,dt);
        
        set_elastic_coefficients(obj);
        set_shear_elastic_coefficient(obj,coeff);
        set_direct_elastic_coefficient(obj,coeff);
    end
    
    methods (Access=private)
        entagle_plates(obj,ixs)
    end
end

