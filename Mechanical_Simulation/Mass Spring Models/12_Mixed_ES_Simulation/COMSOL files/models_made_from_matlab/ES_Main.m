clear all; clc;

%% Symmetry over X axis main 
bezier_p=[0 0.0154 0.0262 0.0416; 0 -9.3928e-4 -0.0151 -0.016];
thickness=100e-6;
clip_l=1e-2;
base_l=1e-2;
gap=50e-6;
voltage=12e3;
sheet_width=0.0127;
numpoints=1000;
%model= create_X_Symmetry_ES_model(bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage);
 obj_es=ES_Estimator(bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage,numpoints);
 load('config_N130_2020_07_05_18_42_24.mat', 'obj')
b_points=BezierEstimator.obtain_qubic_bezier_points(obj.plate.p');
obj_es.bezier_points=b_points';
obj_es.update_X_Symmetry_model();
 %obj_es.bezier_points=b_points;
 %%
 obj_es.x_sym_update_force_distribution()
 points=obj.plate.p;
 [forcey,forcex]=obj_es.x_sym_assign_force_to_points(points);
 
 
 %%
 clear bezier_p thickness clip_l base_l gap voltage sheet_width
%%
load('config_N130_2020_07_05_18_42_24.mat', 'obj')
b_points=BezierEstimator.obtain_qubic_bezier_points(obj.plate.p');
obj_es.bezier_points=b_points';
obj_es.update_X_Symmetry_model();
%%
%update_X_Symmetry_model(model,bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage)
%%
%numpoints=1000;
c=obj_es.get_x_symmetry_bezier_data('C11',0);
x1=obj_es.get_x_symmetry_bezier_data('x');
y1=obj_es.get_x_symmetry_bezier_data('y');
unTy1=obj_es.get_x_symmetry_bezier_data('esbe.unTy');
unTx1=obj_es.get_x_symmetry_bezier_data('esbe.unTx');
figure
yyaxis left
plot(x1,unTy1,'r-x')
hold on
yyaxis right
plot(obj.plate.p(1,:),obj.plate.p(2,:),'b-o')
hold on
plot(x1,y1,'b-')
%%

x2=obj_es.get_x_symmetry_plate_data('x','points');
y2=obj_es.get_x_symmetry_plate_data('y','points');

figure
plot(x1,y1,'b-o')
hold on
plot(x2,y2,'r-x')

%% 
plate_Y_Force=obj_es.get_x_symmetry_plate_data('esbe.unTy','integral');

%%

da=sqrt(diff(x1).^2+diff(y1).^2)*obj.width;
dFy=da.*(unTy1(1:end-1)+unTy1(2:end))/2;
intFy= cumsum(dFy);

y_sim=obj.plate.p(2,:);
x_sim=obj.plate.p(1,:);
intFy_sim=interp1(y1(2:end),intFy,y_sim(2:end-1));
Fy_sim=[intFy_sim(1) diff(intFy_sim)];
interp1(y1(2:end),intFy,y_sim(2:end-1))
%%
figure;
%plot(y_sim(2:end-1),intFy_sim)

yyaxis left
%plot(x_sim(2:end-1),intFy_sim,'r-x')
plot(x_sim(2:end-1),Fy_sim,'r-x')
%Fy_sim
hold on
yyaxis right
plot(x_sim(2:end-1),y_sim(2:end-1),'b-o')
%%
figure
yyaxis left
%plot(x_sim(2:end-1),intFy_sim,'r-x')
plot(x_sim(1:end-1),[0,Fy_sim],'b-x')
%Fy_sim
hold on
yyaxis right
plot(x1,unTy1,'r-')