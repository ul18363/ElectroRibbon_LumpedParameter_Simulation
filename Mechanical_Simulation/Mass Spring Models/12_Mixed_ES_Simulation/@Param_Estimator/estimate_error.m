function error_est=estimate_error(obj,error_type)
error_est=NaN;
if ~obj.comsol_enabled || isempty(obj.comsol_model)
    disp('No COMSOL model detected/enabled, results may be incomplete!')
end

if ~(~obj.comsol_enabled || isempty(obj.comsol_model))
    switch error_type
        case 'SE'
            error_est=sqrt(sum((obj.mass_spring_model.plate.p-...
                obj.comsol_model.real_p_btm).^2,'all'));
            return
        case 'MSE'
            error_est=obj.estimate_error('SE')/obj.mass_spring_model.N;
            return
        case 'MaxSE'
            error_est=max(sqrt(sum((obj.mass_spring_model.plate.p-...
                obj.comsol_model.real_p_btm).^2)));
            return
        case 'RelMax'
            error_est=obj.estimate_error('MaxSE')/obj.mass_spring_model.plate.dl;
            return
    end
end
end