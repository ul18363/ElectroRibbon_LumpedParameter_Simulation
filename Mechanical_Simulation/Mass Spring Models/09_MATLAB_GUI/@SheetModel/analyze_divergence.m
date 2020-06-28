function reco_dt=analyze_divergence(obj,dt)
%reco_dt=dt;
reco_dt1=dt;
reco_dt2=dt;
reco_dt3_ltr=dt;
reco_dt3_rtl=dt;
%% 1. Divergence from damping oscillations
% This comes when the damping force, generates bigger velocities (with
% opposite sign) and thus increasingly stronger oscillations

% The damping force will always be against the velocity.
%ixs=abs(sqrt(sum(obj.v.^2)))>0; %Sometimes squaring the value exceeds the maximum value allowed by matlab, using sum(abs(v)) is more robust and conservative

ixs=sum(abs(obj.v))>0;
if any(ixs) % If all particles are still, there is no risk of this kind of oscillation
    v=sum(abs(obj.v(:,ixs)));
    c=obj.damp_factor;
    dm=obj.dm;
    dts=2*(dm./v)/c;
    reco_dt1=min(dts);
%     if reco_dt1<dt
%         disp('Risk of oscillation class 1')
%     end
end
%% 2. Divergence from Direct oscillations
% This comes when direct forces oscillations become bigger and bigger.
dp_def=obj.dp_def;
dp_x=obj.x_rel(:,2:end-1);
dp_v=diff(obj.v,1,2); % Vi-Vii
dp_v_rel=sum(dp_x.*dp_v);
ixs=(abs(dp_v_rel)>0)&(sign(dp_v_rel)~=sign(dp_def))& (abs(dp_def)>0); %Velocity needs to be bigger than 0 and of different sign of deformation. And deformation needs to be bigger than 0 too
if any(ixs) % Velocity goes against deformation, necessary condition for divergence
    reco_dt2=min(2* abs(dp_def(ixs))./abs(dp_v_rel(ixs)));
%     if dt>reco_dt2
%         disp('Risk of oscillation class 2')
%     end
end
%% 3. Divergence from Shear oscillations
% This oscillation comes to be when the shear forces cause ever increasing
% oscillations in the deformation in the y relative axis. This is measured
% by an increase in the y_relative deformation magnitude, when the velocity
% is opposite to the current y_relative deformation.

% However this phenomenon needs to be measured both left to right and right
% to left

% The frame is the one of the particle to the left, and the velocity is the
% relative velocity of the particle to the right

% Check for LTR
y_ltr=obj.local_frame_y_ltr;
dp_v=-diff(obj.v,1,2); % -(Vi-Vii) % I really need to check the signs here, it makes the world of a difference.
y_def=obj.local_def_y_ltr;
dp_v_rel=sum(y_ltr.*dp_v);
ixs=(abs(dp_v_rel)>0)&(sign(dp_v_rel)~=sign(y_def))& (abs(y_def)>0) ; %Velocity needs to be bigger than 0 and of different sign of deformation. And deformation needs to be bigger than 0
if any(ixs)
    reco_dt3_ltr=min(2* abs(y_def(ixs))./abs(dp_v_rel(ixs)));
%     if dt>reco_dt3_ltr
%     disp('Risk of oscillation class 3 LTR')
%     end
end

%Check for RTL
y_rtl=obj.local_frame_y_rtl;
dp_v=diff(obj.v,1,2); % (Vi-Vii) % I really need to check the signs here, it makes the world of a difference.
y_def=obj.local_def_y_rtl;
dp_v_rel=sum(y_rtl.*dp_v);
ixs=(abs(dp_v_rel)>0)&(sign(dp_v_rel)~=sign(y_def))& (abs(y_def)>0) ; %Velocity needs to be bigger than 0 and of different sign of deformation. And deformation needs to be bigger than 0
if any(ixs)
    reco_dt3_rtl=min(2* abs(y_def(ixs))./abs(dp_v_rel(ixs)));
%     if dt>reco_dt3_rtl
%     disp('Risk of oscillation class 3 rtl')
%     end
end
reco_dt3=min([reco_dt3_ltr reco_dt3_rtl]);
%%

reco_dt=min([reco_dt1,reco_dt2,reco_dt3,dt]);
positive_action=true;
if positive_action && (reco_dt<dt)
   obj.v=0*obj.v; 
end
end