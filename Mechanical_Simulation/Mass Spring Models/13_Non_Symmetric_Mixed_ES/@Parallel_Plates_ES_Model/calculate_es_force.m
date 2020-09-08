function calculate_es_force(obj)
% 
%
%
%
% method='No_scaling';
obj.calculate_distributed_force()



% Bottom Plate
% obj.Fy_dist;
% obj.Fx_dist;
% obj.xs;
% obj.ys;
dx=diff(obj.xs);
dy=diff(obj.ys);
ds=sqrt(dx.^2+dy.^2);
obj.ds=ds;
obj.arc_len=[0 ,cumsum(ds)];
obj.Fy=ds.*(obj.Fy_dist(1:end-1)+obj.Fy_dist(2:end))/2;
cumFy=cumsum(obj.Fy);

obj.cumFy=[0,cumFy];
obj.Fx=ds.*(obj.Fx_dist(1:end-1)+obj.Fx_dist(2:end))/2; %Same with x
cumFx=cumsum(obj.Fx);
obj.cumFx=[0,cumFx];


% Top Plate
dx_top=diff(obj.xs_top);
dy_top=diff(obj.xs_top);
ds_top=sqrt(dx_top.^2+dy_top.^2);
obj.ds_top=ds_top;
obj.arc_len_top=[0 ,cumsum(ds_top)];
obj.Fy_top=ds.*(obj.Fy_dist_top(1:end-1)+obj.Fy_dist_top(2:end))/2;
cumFy_top=cumsum(obj.Fy_top);

obj.cumFy_top=[0,cumFy_top];
obj.Fx_top=ds_top.*(obj.Fx_dist_top(1:end-1)+obj.Fx_dist_top(2:end))/2; %Same with x
cumFx_top=cumsum(obj.Fx_top);
obj.cumFx_top=[0,cumFx_top];


end
