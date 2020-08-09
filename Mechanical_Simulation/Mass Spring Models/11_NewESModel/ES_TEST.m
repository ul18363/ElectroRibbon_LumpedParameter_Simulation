DLZModel_ElectrostaticForce_whenKnowingShapeDeformation
base_l=1e-2;
clip_l=1e-2;
gap=50e-6;
numpoints=1000;
sheet_width=12.7e-3;
thickness=100e-6;
Vs=[2,4,8,10,24,36,120]*1e3;
legends={'2','4','8','10','24','36','120'};
points=[x,y]';
b_points=BezierEstimator.obtain_qubic_bezier_points(points')';
V=0;
obj_es=ES_Estimator(b_points,thickness,sheet_width,clip_l,base_l,gap,V,numpoints);
for i =1:length(Vs)
V =Vs(i) ;%10e3; % V     V = 10000; % V    
obj_es.voltage=V;
%obj_es=ES_Estimator(b_points,thickness,sheet_width,clip_l,base_l,gap,V,numpoints);
obj_es.update_X_Symmetry_model(); %Run COMSOL Model
obj_es.x_sym_update_force_distribution();% Extract Data from COMSOL
[force_y,force_x]=obj_es.x_sym_assign_force_to_points(points);
f_el=[force_x;force_y];
semilogy(x,f_el(2,:))
hold on
end
grid on
legend(legends)

%%
% x2=obj_es.x;
% y2=obj_es.y;
% obj_es.unTx
%dl=
plot(xs,initialWes);
ylabel('W_{es} /Nm^{-1}');
xlabel('X [m]');
title('Electrostatic force applied')
hold on 
plot(obj_es.x,obj_es.unTy*sheet_width)

legend({'Parallel Plate Model','Fully Immersed COMSOL Model'})
grid on