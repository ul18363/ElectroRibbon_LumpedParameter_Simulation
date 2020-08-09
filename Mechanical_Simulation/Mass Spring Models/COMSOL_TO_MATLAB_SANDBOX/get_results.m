function [f_btm_insulator,f_top_insulator,f_top_interface]=get_results(model,initial_points)
%%
f_btm_insulator=mphint2(model,'es.Py*es.Ey','surface','intsurface','on','selection',3);
f_top_insulator=mphint2(model,'es.Py*es.Ey','surface','intsurface','on','selection',4);
f_top_interface=mphint2(model,'es.Ey^2*epsilon0_const*es.d','line','selection','top_interface');
% [x_comsol,y_comsol,dist_force_comsol]=mphinterp(model,{'x','y','es.Ey^2*epsilon0_const*es.d'},'coord',initial_points','edim','point')
dist_force_comsol=mphinterp(model,'es.Ey^2*epsilon0_const*es.d','coord',initial_points','edim','point');
% points=[x_comsol;y_comsol];

% points=[x_comsol;y_comsol];
points=initial_points';
diff_points=diff(points,1,2);
arc_len=sqrt([1,1]*(diff_points.^2));
arc=[0,cumsum(arc_len)];
plot(arc,dist_force_comsol);
f_top_interface_num_integrated=trapz(arc,dist_force_comsol)*2; %Integrating over 
f_top_interface_num_aprox=trapz(initial_points(:,1),dist_force_comsol)*2;
end
