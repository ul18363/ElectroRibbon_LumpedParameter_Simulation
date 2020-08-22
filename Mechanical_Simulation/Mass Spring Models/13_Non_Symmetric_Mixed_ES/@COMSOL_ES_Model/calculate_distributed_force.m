function calculate_distributed_force(obj,points,target)
switch target
    case 'bottom'
        [fy,fx]=mphinterp(obj.model,...
            {'es.Ey^2*epsilon0_const*es.d*4.65','es.Ex^2*epsilon0_const*es.d*4.65'},...
            'coord',points','edim','point');
        ixs=~(isnan(fy)| isnan(fx));
        if sum(ixs)<10
           error ('The estimation of distributed force failed.')
        end
        obj.Fy_dist=fy(ixs)';
        obj.Fx_dist=fx(ixs)';
        obj.xs=obj.xs(ixs);
        obj.ys=obj.ys(ixs);
        obj.hs=obj.hs(ixs);
        
    case 'top'
        [fy,fx]=mphinterp(obj.model,...
            {'es.Ey^2*epsilon0_const*es.d*4.65','es.Ex^2*epsilon0_const*es.d*4.65'},...
            'coord',points','edim','point');
%         disp(fy)
%         disp(fx)
%         bad_ixs_y=isnan(Fy_dist);
%         bad_ixs_x=isnan(Fx_dist);
        ixs=~(isnan(fy)| isnan(fx));
        if sum(ixs)<10
           error ('The estimation of distributed force failed.')
        end
        obj.Fy_dist_top=fy(ixs)';
        obj.Fx_dist_top=fx(ixs)';
        obj.xs_top=obj.xs_top(ixs);
        obj.ys_top=obj.ys_top(ixs);
        obj.hs_top=obj.hs_top(ixs);
    otherwise
        error('Target of force estimation in COMSOL model is not valid, try top or bottom please.')
        
end
end
