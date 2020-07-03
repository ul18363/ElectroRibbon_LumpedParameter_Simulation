clear all;clc;
%% Create Comsol Model
Bezier_EZ_partial_symmetry_over_x_stupidly_much_better
%% Define points to interpolate
param_points=[0 0.0154 0.0262 0.0416; 0 -9.3928e-4 -0.0151 -0.016];

points=BezierEstimator.interp_by_t(param_points',[0:1e-3:1]); %Use interval [0:scope:1] for full interval 

%%
%pd = mphinterp(model,{'x','y','esbe.unTx','esbe.unTy'},'coord',points');%Seem not to work with multiple expressions %/'edim',1
selection=21;
%selection=2;


x = mphinterp(model,'x','coord',points','selection',selection,'edim',1);
y = mphinterp(model,'y','coord',points','selection',selection,'edim',1);
unTy = mphinterp(model,'esbe.unTy','coord',points','selection',selection,'edim',1);
unTx = mphinterp(model,'esbe.unTx','coord',points','selection',selection,'edim',1);

maxP=max(unTy);
maxPx=max(unTx);
%% Total Force in Y
Fy=diff(x).*(unTy(1:end-1)+diff(unTy)/2);trapz(x,unTy,2); % calculate Force between points in interpolation
Total_Force_y=trapz(x,unTy);
int_vals=interp1(x,unTy,x(2)*[0:0.1:1]); %Interpolated Values
%%
figure
yyaxis left
plot(x,y)
ylabel('y[m]')
xlabel('x[m]')
yyaxis right
plot(x,unTy/maxP,'r-x')
hold on
plot(x,unTx/maxP,'g-x')
ylabel('Electrostatic Pressure [%max]')
legend({'Deformation Profile','Pressure-y','Pressure-x'})
% ylabel('Electrostatic Pressure[Pa]')
%%
figure
yyaxis left
plot(x,y)
ylabel('y[m]')
xlabel('x[m]')
yyaxis right
plot(x(1:end-1),cumsum(Fy)/Total_Force_y)%  
% Cumulative Force up to segment: cumsum(Fy)/Total_Force_y [%Total Force]
% Force in segment over total force: Fy/Total_Force_y [%Total Force]
% Force in each segement: Fy*0.0127%[N]

fprof=cumsum(Fy)/Total_Force_y;
% x_95=x(min(find(fprof>0.95))); %X where cumulative force up to that point exceeds 95% of force in the sheet 
x_95=x(find(fprof>0.95,1,'first'));% Alledgedly faster
x_99=x(find(fprof>0.99,1,'first'));% Alledgedly faster
%%
disp(['95% of the force happens in the first ',num2str(round(100*x_95/max(x),2)),'% of the interval'])
disp(['99% of the force happens in the first ',num2str(round(100*x_99/max(x),2)),'% of the interval'])
ylabel('Electrostatic Force [%Total Force]')
%% Findings
% 1. Roughly 2.5 mm of the sheet are affected by strong electrostatic forces
% 2. Forces in X and Y haveRoughly 2.5 mm of the sheet are affected by strong electrostatic forces
