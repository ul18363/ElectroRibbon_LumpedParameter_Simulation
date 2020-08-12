
classdef Mechanical_Model_Flange < handle
    properties
        sht_dms
        material
        N
        gap
        M
        plate
        g
        L
        sheet_width
        thickness
        
        f_ext
    end
    
    methods
        function obj=Mechanical_Model_Flange(sht_dms,N,material)
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

            obj.sht_dms=sht_dms;
            obj.N=N;
            obj.material=material;
            obj.M=0;%load mass
            obj.g=[0;-9.81];
            obj.L=sht_dms(1);
            obj.sheet_width=sht_dms(2);
            obj.thickness=sht_dms(3);

            %Define Bottom plate
            obj.plate=SheetModel(sht_dms,N,0,0,material);
            obj.plate.define_force_bc('l_fix');% Left edge is fix
            obj.plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
        end

        set_damping_factor(obj,damping_factor)
        calculate_all_forces(obj,f_ext);
        perform_timestep(obj,dt);
        calculate_external_forces(obj);
        set_elastic_coefficients(obj);

    end
end

