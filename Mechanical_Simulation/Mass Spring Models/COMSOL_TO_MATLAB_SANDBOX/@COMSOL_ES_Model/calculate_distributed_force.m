function calculate_distributed_force(obj,points)
[fy,fx]=mphinterp(obj.model,...
    {'es.Ey^2*epsilon0_const*es.d*4.65','es.Ex^2*epsilon0_const*es.d*4.65'},...
    'coord',points','edim','point');
obj.Fy_dist=fy;
obj.Fx_dist=fx;
obj.xs=points(:,1);
obj.ys=points(:,2);
end
