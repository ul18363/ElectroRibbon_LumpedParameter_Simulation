function calculate_local_frames(obj)

obj.dp=obj.dp_f(obj.p);  % Relative difference in position in global coordinates

obj.x_rel=normc(obj.dp); % Obtain the direction of "x_relative", going from "i->ii"
obj.apply_edges_orientation_bc();


obj.x_rel=[obj.x_r0 obj.x_rel obj.x_rend]; % Basically dp, normalized, and shifted one to the right

obj.y_rel=obj.R*obj.x_rel;

%The shear force depends on the distance between the mass elements
obj.k_trans_vec=obj.GA./vecnorm(obj.dp);
%% Calculate Frames Left To Right (ltr) / i->ii
%Establish the orientation of the local frame of reference (i->ii)
obj.local_frame_x_ltr=obj.x_rel(:,1:end-2);
obj.local_frame_y_ltr=obj.y_rel(:,1:end-2);
obj.local_dpx_ltr=sum(obj.dp.*obj.local_frame_x);
obj.local_dpy_ltr=sum(obj.dp.*obj.local_frame_y);
%% Calculate Frames Right To Left (rtl)/ i<-ii
obj.local_frame_x_rtl=obj.x_rel(:,3:end);
obj.local_frame_y_rtl=obj.y_rel(:,3:end);
obj.local_dpx_rtl=sum(obj.dp.*obj.local_frame_x);
obj.local_dpy_rtl=sum(obj.dp.*obj.local_frame_y);
end