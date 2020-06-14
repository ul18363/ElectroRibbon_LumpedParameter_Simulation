%% Estimate difference in positions
function obj=calculate_elastic_forces(obj)
obj.dp=dp_f(p);% Relative difference in position in global coordinates
%obj.x_r0=[1;0];
%obj.x_rend=[1;0];
obj.x_rel=normc(dp);
%obj.x_rend=x_rel(:,end);%[1;0];
obj=obj.apply_edges_orientation_bc(obj);

obj.x_rel=[x_r0 x_rel x_rend]; % Basically dp, normalized, and shifted one to the right, and at each edge column a vector [1;0] (x in global coordinates)
obj.y_rel=R*x_rel;
obj.k_trans_vec=GA./vecnorm(dp);
obj.local_frame_x=x_rel(:,1:end-2);
obj.local_frame_y=y_rel(:,1:end-2);
obj.local_dpx=sum(dp.*local_frame_x);
obj.local_dpy=sum(dp.*local_frame_y);
obj.local_dp=[local_dpx;local_dpy];
obj.local_def_x=local_dpx-local_xo;
obj.local_def_y=local_dpy-local_yo;
obj.f_axial=-scale_up(local_frame_x,local_def_x)*k_axial;
obj.f_trans=-scale_up(local_frame_y,local_def_y.*k_trans_vec);
obj.f_i_ii=[o f_axial+f_trans];
obj.f_i_ii_reactive=[-(f_axial+f_trans) o];
obj.local_frame_x=x_rel(:,3:end);
obj.local_frame_y=y_rel(:,3:end);
obj.local_dpx=sum(dp.*local_frame_x);
obj.local_dpy=sum(dp.*local_frame_y);
obj.local_def_x=local_dpx-local_xo; %If this value is positive means that the distance between i+1 and i gets bigger 
obj.local_def_y=local_dpy-local_yo; %If this value is positive means that the  
obj.f_axial=scale_up(local_frame_x,local_def_x)*k_axial;
obj.f_trans=scale_up(local_frame_y,local_def_y.*k_trans_vec);
obj.f_ii_i=[f_axial+f_trans o];
obj.f_ii_i_reactive=[o -(f_axial+f_trans)];
obj.f_elastic=f_i_ii+f_ii_i+f_i_ii_reactive+f_ii_i_reactive;
end