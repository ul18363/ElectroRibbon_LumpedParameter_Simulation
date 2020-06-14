%% Estimate difference in positions

dp=dp_f(p);% Relative difference in position in global coordinates
%% Local Frames orientations
x_r0=[1;0];
x_rend=[1;0];
x_rel=normc(dp);
x_rend=x_rel(:,end);%[1;0];
x_rel=[x_r0 x_rel x_rend]; % Basically dp, normalized, and shifted one to the right, and at each edge column a vector [1;0] (x in global coordinates)
y_rel=R*x_rel;
%% Estimate Transversal coefficients
k_trans_vec=GA./vecnorm(dp);
%% Forces from "i" to "i+1" (The first node doesn't have an "active" force)

% Local frames of reference
local_frame_x=x_rel(:,1:end-2);
local_frame_y=y_rel(:,1:end-2);

% Distance of node "i" to "i+1" in the x direction of the local frame 
local_dpx=sum(dp.*local_frame_x);
% Distance of node "i" to "i+1" in the y direction of the local frame 
local_dpy=sum(dp.*local_frame_y);
local_dp=[local_dpx;local_dpy];
%local_def=[local_dpx;local_dpy];
local_def_x=local_dpx-local_xo;
local_def_y=local_dpy-local_yo;

%%  3.a Axial & Transversal Forces from "i" to "i+1"(aka. ii)
    f_axial=-scale_up(local_frame_x,local_def_x)*k_axial;
    f_trans=-scale_up(local_frame_y,local_def_y.*k_trans_vec);
    f_i_ii=[o f_axial+f_trans];
    f_i_ii_reactive=[-(f_axial+f_trans) o];
%% Forces from "i+1" to "i" (The last node doesn't have an "active" force)

% Local frames of reference
local_frame_x=x_rel(:,3:end);
local_frame_y=y_rel(:,3:end);

% Distance of node "i" to "i+1" in the x direction of the local frame 
local_dpx=sum(dp.*local_frame_x);
% Distance of node "i" to "i+1" in the y direction of the local frame 
local_dpy=sum(dp.*local_frame_y);



local_def_x=local_dpx-local_xo; %If this value is positive means that the distance between i+1 and i gets bigger 
% node "i", get's "more to the left" in the relative coordinates with
% center in "i+1" and the diraction of "i+1" and "i+2", thus the
% restauration force is to the right
local_def_y=local_dpy-local_yo; %If this value is positive means that the  
% relative y position of "i" is below of the one "i+1", thus the
% restauration force is upwards

%%  3.a Axial & Transversal Forces from "i+1" to "i"
    f_axial=scale_up(local_frame_x,local_def_x)*k_axial;
    f_trans=scale_up(local_frame_y,local_def_y.*k_trans_vec);
    f_ii_i=[f_axial+f_trans o];
    f_ii_i_reactive=[o -(f_axial+f_trans)];

f_elastic=f_i_ii+f_ii_i+f_i_ii_reactive+f_ii_i_reactive;
