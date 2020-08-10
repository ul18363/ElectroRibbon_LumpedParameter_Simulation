classdef ES_Estimator < handle
    properties
        comsol_model
        numerical_model
%         bezier_points
        clip_l
        base_l
        sheet_width
        %bE
        gap
        voltage
        thickness
%         model
%         x
%         y
%         unTy
%         unTx
%         dFy
%         dFx
%         da
%         cumFy
%         cumFx
%         numpoints
    end
    methods
        function obj=ES_Estimator(initial_points,thickness,insulator_thickness,sheet_width,clip_l,base_l,voltage)
            % Constructor
%             obj.bezier_points=bezier_points;
            obj.thickness=thickness;
            obj.sheet_width=sheet_width;
            obj.clip_l=clip_l;
            obj.base_l=base_l;
            obj.voltage=voltage;
            curve_points= [initial_points(1,:)+[-clip_l 0];...
                initial_points;...
                initial_points(end,:)+[base_l/2 0]];
            obj.comsol_model=COMSOL_ES_Model(curve_points,...
                thickness,insulator_thickness,sheet_width,voltage);
            obj.comsol_model.calculate_es_force(initial_points)
            % Initialize parallel plate model
            eMed = 2.75; eAir = 1; eIns = 4.62; 
            tIns = 130e-6; EMaxMed = 20e6; EMaxAir = 3e6; dropVolume = 10;
            obj.numerical_model=Parallel_Plates_ES_Model(initial_points,...
                voltage,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume,...
                sheet_width);
            obj.numerical_model.calculate_es_force()
        end
        
        [Fy,Fx,arc_len_sim]=assign_distribute_forces_to_particles(obj,points,source)
    end
end