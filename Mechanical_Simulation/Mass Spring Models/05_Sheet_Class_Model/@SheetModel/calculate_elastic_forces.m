%% Estimate difference in positions
function calculate_elastic_forces(obj)
obj.dp=obj.dp_f(obj.p);% Relative difference in position in global coordinates
%obj.x_r0=[1;0];
%obj.x_rend=[1;0];
obj.x_rel=normc(obj.dp);
%obj.x_rend=x_rel(:,end);%[1;0];
obj=obj.apply_edges_orientation_bc();

obj.x_rel=[obj.x_r0 obj.x_rel obj.x_rend]; % Basically dp, normalized, and shifted one to the right
obj.y_rel=obj.R*obj.x_rel;

obj.k_trans_vec=obj.GA./vecnorm(obj.dp);

obj.local_frame_x=obj.x_rel(:,1:end-2);
obj.local_frame_y=obj.y_rel(:,1:end-2);
obj.local_dpx=sum(obj.dp.*obj.local_frame_x);
obj.local_dpy=sum(obj.dp.*obj.local_frame_y);
obj.local_dp=[obj.local_dpx;obj.local_dpy];
obj.local_def_x=obj.local_dpx-obj.local_xo;
obj.local_def_y=obj.local_dpy-obj.local_yo;
% Scale up the 
obj.f_axial=-obj.scale_up(obj.local_frame_x,obj.local_def_x)*obj.k_axial;
obj.f_trans=-obj.scale_up(obj.local_frame_y,obj.local_def_y.*obj.k_trans_vec);

obj.f_i_ii=[obj.o obj.f_axial+obj.f_trans];
obj.f_i_ii_reactive=[-(obj.f_axial+obj.f_trans) obj.o];
obj.local_frame_x=obj.x_rel(:,3:end);
obj.local_frame_y=obj.y_rel(:,3:end);
obj.local_dpx=sum(obj.dp.*obj.local_frame_x);
obj.local_dpy=sum(obj.dp.*obj.local_frame_y);
obj.local_def_x=obj.local_dpx-obj.local_xo; %If this value is positive means that the distance between i+1 and i gets bigger 
obj.local_def_y=obj.local_dpy-obj.local_yo; %If this value is positive means that the  
obj.f_axial=obj.scale_up(obj.local_frame_x,obj.local_def_x)*obj.k_axial;
obj.f_trans=obj.scale_up(obj.local_frame_y,obj.local_def_y.*obj.k_trans_vec);
obj.f_ii_i=[obj.f_axial+obj.f_trans obj.o];
obj.f_ii_i_reactive=[obj.o -(obj.f_axial+obj.f_trans)];
obj.f_elastic=obj.f_i_ii+obj.f_ii_i+obj.f_i_ii_reactive+obj.f_ii_i_reactive;
end