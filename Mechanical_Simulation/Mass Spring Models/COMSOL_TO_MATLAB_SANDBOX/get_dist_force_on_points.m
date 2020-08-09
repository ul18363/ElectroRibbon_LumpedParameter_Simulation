function dist_force=get_dist_force_on_points(~,initial_points)
[fy,fx]=mphinterp(model,{'es.Ey^2*epsilon0_const*es.d','es.Ex^2*epsilon0_const*es.d'},'coord',initial_points','edim','point');
dist_force=[fx;fy];
% points=[x_comsol;y_comsol];
% points=initial_points';
% diff_points=diff(points,1,2);
% arc_len=sqrt([1,1]*(diff_points.^2));
% arc=[0,cumsum(arc_len)];
% plot(arc,dist_force_comsol);
% f_top_interface_num_integrated=trapz(arc,dist_force_comsol)*2; %Integrating over 
% f_top_interface_num_aprox=trapz(initial_points(:,1),dist_force_comsol)*2;
end
