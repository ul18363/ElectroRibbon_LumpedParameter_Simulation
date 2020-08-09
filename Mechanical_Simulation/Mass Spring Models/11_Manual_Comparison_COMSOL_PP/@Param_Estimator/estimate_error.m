function error_est=estimate_error(obj,error_type)
error_est=NaN;
switch error_type
    case 'SE'
        error_est=sqrt(sum((obj.plate.p-obj.real_p_btm).^2,'all'));
        return 
    case 'MSE'
        error_est=obj.estimate_error('SE')/obj.N;
        return 
    case 'MaxSE'
        error_est=max(sqrt(sum((obj.plate.p-obj.real_p_btm).^2)));
        return
    case 'RelMax'
        error_est=obj.estimate_error('MaxSE')/obj.plate.dl;
        return
end
end