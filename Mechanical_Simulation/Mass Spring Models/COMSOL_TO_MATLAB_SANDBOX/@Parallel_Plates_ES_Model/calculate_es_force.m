function calculate_es_force(obj)
% 
%
%
%
% method='No_scaling';
obj.calculate_distributed_force()
obj.Fy_dist;
obj.Fx_dist;
obj.xs;
obj.ys;
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



end
