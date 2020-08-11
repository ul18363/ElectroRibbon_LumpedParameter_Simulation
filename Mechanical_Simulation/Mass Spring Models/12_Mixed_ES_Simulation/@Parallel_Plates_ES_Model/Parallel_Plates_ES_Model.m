classdef Parallel_Plates_ES_Model < handle
%         eMed = 2.75; 
%         eAir = 1; 
%         eIns = 4.62; 
%         tIns = 130e-6; 
%         EMaxMed = 20e6; 
%         EMaxAir = 3e6;
%         dropVolume = 10;%1e-4;%100*1e-6;
%         pp_model=Parallel_Plates_ES_Model(eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume);
%         pp_model.

    properties
%         L
        %Parameters for model
        points
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
    end
    methods
        function obj=Parallel_Plates_ES_Model(points,voltage,eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume,sheet_width)
            % Constructor
            obj.voltage=voltage;
            obj.points=points;
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
        
%         [xs,Fy]=get_distributed_force(obj,x,y,V)
        
    end
    methods(Access=private)
        calculate_distributed_force(obj)
    end
end