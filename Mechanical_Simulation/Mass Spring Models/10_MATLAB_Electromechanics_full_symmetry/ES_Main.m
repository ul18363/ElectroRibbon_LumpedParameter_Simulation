clear all; clc;
%% Symmetry over X axis main 
bezier_p=[0 0.0154 0.0262 0.0416; 0 -9.3928e-4 -0.0151 -0.016];
thickness=100e-6;
clip_l=1e-2;
base_l=1e-2;
gap=50e-6;
voltage=12e3;
sheet_width=0.0127;
%model= create_X_Symmetry_ES_model(bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage);
 obj=ES_Estimator(bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage);
 %%
 clear bezier_p thickness clip_l base_l gap voltage sheet_width
%%
%update_X_Symmetry_model(model,bezier_p,thickness,sheet_width,clip_l,base_l,gap,voltage)
%%
numpoints=1000;
c=obj.get_x_symmetry_bezier_data('C11',0);
x1=obj.get_x_symmetry_bezier_data('x',numpoints);
y1=obj.get_x_symmetry_bezier_data('y',numpoints);
unTy1=obj.get_x_symmetry_bezier_data('esbe.unTy',numpoints);
unTx1=obj.get_x_symmetry_bezier_data('esbe.unTy',numpoints);
figure
yyaxis left
plot(x1,unTy1,'r-x')
hold on
yyaxis right
plot(x1,y1,'b-o')
%%

x2=obj.get_x_symmetry_plate_data('x','points');
y2=obj.get_x_symmetry_plate_data('y','points');

figure
plot(x1,y1,'b-o')
hold on
plot(x2,y2,'r-x')

%% 
plate_Y_Force=obj.get_x_symmetry_plate_data('esbe.unTy','integral');