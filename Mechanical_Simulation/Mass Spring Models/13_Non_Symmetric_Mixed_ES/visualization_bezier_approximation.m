contact_ix=obj.mechanical_model.contact_ix;

top_points=obj.mechanical_model.top_plate.p;
btm_points=obj.mechanical_model.bottom_plate.p;

top_p_flex=obj.mechanical_model.top_plate.p(:,contact_ix:end)';
btm_p_flex=obj.mechanical_model.bottom_plate.p(:,contact_ix:end)';
% Obtain Bezier points
top_b_points= BezierEstimator.obtain_qubic_bezier_points(top_p_flex);
btm_b_points= BezierEstimator.obtain_qubic_bezier_points(btm_p_flex);
og_top_b_points=top_b_points;
og_btm_b_points=btm_b_points;

voltage=obj.voltage;
obj.electrostatic_model.voltage=voltage;
% Apply tangent angle correction
apply_angle_corrections=true;
% if apply_angle_corrections

% Angle Correction Type: All Horizontal orientation
top_b_points(3,2)=top_b_points(4,2);% Horizontal orientation of Right end
btm_b_points(3,2)=btm_b_points(4,2);% Horizontal orientation of Right end
top_b_points(2,2)=top_b_points(1,2);% Horizontal orientation of left end
btm_b_points(2,2)=btm_b_points(1,2);% Horizontal orientation of left end
all_horizontal_btm_b_points=btm_b_points;
all_horizontal_top_b_points=top_b_points;

% Angle Correction Type: All Continuining direction aka. "Continuity"
top_b_points=og_top_b_points;
btm_b_points=og_btm_b_points;

top_b_points(3,2)=top_b_points(4,2);% Horizontal orientation of Right end
btm_b_points(3,2)=btm_b_points(4,2);% Horizontal orientation of Right end
if contact_ix==1
    top_b_points(2,2)=top_b_points(1,2);% Horizontal orientation of left end
    btm_b_points(2,2)=btm_b_points(1,2);% Horizontal orientation of left end
else
    direction=obj.mechanical_model.top_plate.p(:,contact_ix)'-obj.mechanical_model.top_plate.p(:,contact_ix-1)';
    direction=normr(direction);
    
    dir_top=top_b_points(2,:)-top_b_points(1,:);
    dir_btm=btm_b_points(2,:)-btm_b_points(1,:);
    
    dir_btm=direction*(direction*dir_btm');
    dir_top=direction*(direction*dir_top');
    
    btm_b_points(2,:)=btm_b_points(1,:)+dir_btm;
    top_b_points(2,:)=top_b_points(1,:)+dir_top;
    %normr(dir_btm)
end
continuity_btm_b_points=btm_b_points;
continuity_top_b_points=top_b_points;

% Angle Correction Type: Middle ground between top and bottom plate aka. Midway
top_b_points=og_top_b_points;
btm_b_points=og_btm_b_points;

top_b_points(3,2)=top_b_points(4,2);% Horizontal orientation of Right end
btm_b_points(3,2)=btm_b_points(4,2);% Horizontal orientation of Right end
if contact_ix==1
    top_b_points(2,2)=top_b_points(1,2);% Horizontal orientation of left end
    btm_b_points(2,2)=btm_b_points(1,2);% Horizontal orientation of left end
else
%     direction=obj.mechanical_model.top_plate.p(:,contact_ix)'-obj.mechanical_model.top_plate.p(:,contact_ix-1)';
    
    
    dir_top=top_b_points(2,:)-top_b_points(1,:);
    dir_btm=btm_b_points(2,:)-btm_b_points(1,:);
    
    direction=normr(normr(dir_top)+normr(dir_btm)); %Bizecting direction by the parallelogram rule
    
    dir_btm=direction*(direction*dir_btm');
    dir_top=direction*(direction*dir_top');
    
    btm_b_points(2,:)=btm_b_points(1,:)+dir_btm;
    top_b_points(2,:)=top_b_points(1,:)+dir_top;
    %normr(dir_btm)
end


midway_btm_b_points=btm_b_points;
midway_top_b_points=top_b_points;
% end





%%
HD=-4;
t=10.^(HD:0.02:0);
t=[0 t];
% 
% top_points_bc= BezierEstimator.bezierInterp2(top_b_points',t);
% bottom_points_bc= BezierEstimator.bezierInterp2(btm_b_points',t);

og_curve_btm= BezierEstimator.bezierInterp2(og_btm_b_points',t);
all_horziontal_curve_btm= BezierEstimator.bezierInterp2(all_horizontal_btm_b_points',t);
continuity_curve_btm= BezierEstimator.bezierInterp2(continuity_btm_b_points',t);
midway_curve_btm= BezierEstimator.bezierInterp2(midway_btm_b_points',t);

og_curve_top= BezierEstimator.bezierInterp2(og_top_b_points',t);
all_horziontal_curve_top= BezierEstimator.bezierInterp2(all_horizontal_top_b_points',t);
continuity_curve_top= BezierEstimator.bezierInterp2(continuity_top_b_points',t);
midway_curve_top= BezierEstimator.bezierInterp2(midway_top_b_points',t);

%% bottom plate plots
close all
figure()
plot(btm_points(1,1:contact_ix),btm_points(2,1:contact_ix),'g--s')
hold on
plot(btm_points(1,contact_ix:end),btm_points(2,contact_ix:end),'b--x')
grid on
plot(og_btm_b_points(:,1),og_btm_b_points(:,2),'ko','LineWidth',2)
plot(all_horizontal_btm_b_points(2:3,1),all_horizontal_btm_b_points(2:3,2),'r.','LineWidth',2,'MarkerSize',25)
plot(continuity_btm_b_points(2:3,1),continuity_btm_b_points(2:3,2),'mo','LineWidth',2)
plot(midway_btm_b_points(2:3,1),midway_btm_b_points(2:3,2),'gx','LineWidth',2)

plot(og_curve_btm(1,:),og_curve_btm(2,:),'k:')
plot(all_horziontal_curve_btm(1,:),all_horziontal_curve_btm(2,:),'r:')
plot(continuity_curve_btm(1,:),continuity_curve_btm(2,:),'m:')
plot(midway_curve_btm(1,:),midway_curve_btm(2,:),'g:')
legend({'Before contact','After contact','Bezier Points','Modified AllHorizontal','Modified Continuity','Modified Midway'})
% axis equal