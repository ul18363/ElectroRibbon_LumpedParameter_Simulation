
classdef Param_Estimator < handle
    properties
        sht_dms
        material
        N
        gap
        base_width
        M
        plate
        f_el_top
        f_el_btm
        g
        model
        L
        width
        thickness
        mass_load
        og_p
    end
    
    methods
        function obj=Param_Estimator(sht_dms,N,material,base_width)    
            obj.sht_dms=sht_dms;
            obj.N=N;
            obj.material=material;
            obj.base_width=base_width;
            obj.M=0;%load mass
            obj.g=[0;-9.81];
            sht_dms(1)=(sht_dms(1)-base_width)/2;
            obj.L=sht_dms(1);
            obj.width=sht_dms(2);
            obj.thickness=sht_dms(3);
            %Define Bottom plate
            obj.plate=SheetModel(sht_dms,N,0,0,material);
            obj.plate.define_force_bc('l_fix');% Left edge is fix
            obj.plate.define_edges_orientation_bc([1;0],[1;0]); %Left edge has horizontal orientation
            %% Connect to COMSOL
            try
                mphstart
            catch exception_caught
                msgText=getReport(exception_caught);
                if ~contains(msgText,'Already connected to a server')
                    error('Unexpected when trying to connect to COMSOL server')
                end
            end
            
            dl=obj.L/(N-1);
            x_side=0:dl:obj.L;
            %obj.mass_load=0.0135;
            %hor_1=ones(size(x));
            x=[x_side, flip(x_side)];
            y=[ones(1,N)*obj.thickness,zeros(1,N)];
            obj.og_p=[x' y'];
            obj.model=obj.create_model(obj.og_p,obj.width,obj.M,N);
        end
        
        function set_damping_factor(obj,damping_factor)
            obj.plate.damp_factor=damping_factor; %Damping Factor
        end
        function calculate_all_forces(obj)
            obj.plate.calculate_all_forces(); % Calculate Forces on the plate
            obj.calculate_external_forces(); % Calculate forces induced by the hanging mass
        end
        perform_timestep(obj,dt);
        function calculate_external_forces(obj)
            % Force of the load
            f_free_tip=obj.plate.f(:,end);
            dm=obj.plate.dm;
            % Add Additionl Mass
            f_loaded_tip=(f_free_tip+obj.M*obj.g)*dm/(obj.M+dm);
            % Replace resulting force
            obj.plate.f(:,end)=f_loaded_tip;
        end
        %function estimate_parameters(obj)
    end
end

