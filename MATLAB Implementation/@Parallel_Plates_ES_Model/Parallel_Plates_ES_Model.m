classdef Parallel_Plates_ES_Model < handle
%         eMed = 2.75; 
%         eAir = 1; 
%         eIns = 4.62; 
%         tIns = 130e-6; 
%         EMaxMed = 20e6; 
%         EMaxAir = 3e6;
%         dropVolume = 10;%1e-4;%100*1e-6;

    properties
%         L
        %Parameters for model
        version
                

        top_points
        btm_points
        
        eMed
        eAir
        eIns
        tIns
        EMaxMed
        EMaxAir
        dropVolume
        sample_size
        voltage
        sheet_width
        
        %Output
        Fy_dist
        Fx_dist
        Fy
        Fx
        cumFy
        cumFx
        xs
        ys
        ds
        arc_len
        hs
        
        Fy_dist_top
        Fx_dist_top
        Fy_top
        Fx_top
        cumFy_top
        cumFx_top
        xs_top
        ys_top
        ds_top
        arc_len_top
        hs_top        



        
        
        
    end
    methods
        function obj=Parallel_Plates_ES_Model(btm_points,top_points,voltage,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume,sheet_width)
            % Parallel_Plates_ES_Model
            % obj=Parallel_Plates_ES_Model(points,voltage,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume,sheet_width)
            %  
            % points: matrix where the first column represents the x position between
            % the sheets and the second column represents the distance
            % bertween each sheet
            %
            
            obj.version=2.0;
            
            % Constructor
            obj.voltage=voltage;
            obj.top_points=top_points;
            obj.btm_points=btm_points;
            obj.eMed=eMed;
            obj.eAir=eAir;
            obj.eIns=eIns;
            obj.tIns=tIns;
            obj.sheet_width=sheet_width;
            obj.EMaxMed=EMaxMed;
            obj.EMaxAir=EMaxAir;
            obj.dropVolume=dropVolume;
            obj.sample_size=1000;
%             obj.L=0.1;
        end
        calculate_es_force(obj)

        
    end
    methods(Access=private)
        calculate_distributed_force(obj)
    end
end