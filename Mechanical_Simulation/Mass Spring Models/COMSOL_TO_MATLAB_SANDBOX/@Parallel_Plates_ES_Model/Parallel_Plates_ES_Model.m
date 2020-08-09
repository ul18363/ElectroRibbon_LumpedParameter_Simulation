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
        eMed
        eAir
        eIns
        tIns
        EMaxMed
        EMaxAir
        dropVolume
        discrete_points
        Fy
        Fx
        cumFy
        cumFx
        xs
        ys
        ds
    end
    methods
        function obj=Parallel_Plates_ES_Model(eMed,eAir,eIns,tIns,EMaxMed,EMaxAir,dropVolume)
            % Constructor
            obj.eMed=eMed;
            obj.eAir=eAir;
            obj.eIns=eIns;
            obj.tIns=tIns;
            obj.EMaxMed=EMaxMed;
            obj.EMaxAir=EMaxAir;
            obj.dropVolume=dropVolume;
            obj.discrete_points=1000;
        end
        
        [xs,Fy]=get_distributed_force(obj,x,y,V)
        
    end
    methods(Access=private)
        calculate_distributed_force(obj,x,y,V)
    end
end