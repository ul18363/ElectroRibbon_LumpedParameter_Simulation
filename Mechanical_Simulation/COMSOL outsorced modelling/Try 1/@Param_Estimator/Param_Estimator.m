
classdef Param_Estimator < handle
    properties
        A
        b
        approx_coeffs
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
        real_x
        real_y
        real_u
        real_v
        real_p
        real_x_btm
        real_y_btm
        real_u_btm
        real_v_btm
        real_p_btm
        real_x_tp
        real_y_tp
        real_u_tp
        real_v_tp
        real_p_tp
        tp_ixs
        btm_ixs
        real_static_coeffs
        matrix_sys_A
        independent_forces_b
        real_static_axial_coeffs
        real_static_trans_coeffs
        eqns
        vars
        approx_static_axial_coeffs
        approx_static_trans_coeffs
        estimation_type
    end
    
    methods
        function obj=Param_Estimator(sht_dms,N,material,base_width)    
            obj.sht_dms=sht_dms;
            obj.N=N;
            obj.material=material;
            obj.base_width=base_width;
            obj.M=0;%load mass
            sht_dms(1)=(sht_dms(1)-base_width)/2;
            obj.L=sht_dms(1);
            obj.width=sht_dms(2);
            obj.thickness=sht_dms(3);
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
            x=[x_side, flip(x_side)];
            y=[ones(1,N)*obj.thickness,zeros(1,N)];
            obj.og_p=[x' y'];
            obj.model=obj.create_model(obj.og_p,obj.width,obj.M,obj.N);
            obj.estimation_type="Polynomial coefficient estimation";
        end
        create_comsol_plot(obj,model);
        show_comsol_plot(obj);
        function set_damping_factor(obj,damping_factor)
            obj.plate.damp_factor=damping_factor; %Damping Factor
        end
        calculate_all_forces(obj);
        perform_timestep(obj,dt);
        calculate_external_forces(obj);
        obtain_static_coefficients(obj);
        set_elastic_coefficients(obj);
        analyze_deflections(obj);
        obtain_static_polynomial_coefficients(obj,axial_size,trans_size);
        function update_model(obj)
            obj.model.component('comp1').geom('geom1').feature('pol1').set('table', obj.og_p);
            obj.model.component('comp1').physics('solid').prop('d').set('d', obj.width); %Add Sheet width
            obj.model.component('comp1').physics('solid').feature('adm1').set('mTot', obj.M);            
            obj.model.component('comp1').physics('solid').feature('adm1').selection.set(2*obj.N);
            obj.model.component('comp1').physics('solid').feature('rig1').selection.set(2*obj.N);
            obj.model.component('comp1').geom('geom1').run;
            obj.model.sol('sol1').runAll;
        end
        
        %function estimate_parameters(obj)
    end
end

