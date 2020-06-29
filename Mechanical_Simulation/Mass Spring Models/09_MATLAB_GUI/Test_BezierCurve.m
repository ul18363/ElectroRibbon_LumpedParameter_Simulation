close all;
load('/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/Mass Spring Models/09_MATLAB_GUI/status.mat', 'p_bu')

bezier_points=BezierEstimator.obtain_qubic_bezier_points(p_bu');
BezierEstimator.interpolate_qubic_bezier_points(bezier_points,50); %Calculate 50 equally distributed points "in t" (the variable that goes from 0 to 1) along the bezier curve
BezierEstimator.plot_visualize_estimation(p_bu',300); % Plot the estimation of the bezier curve against the real points

%% Generate sample points for the other plate
%new_p_bu =[p_bu(1,:);-p_bu(2,:)];
%new_p_bu=[p_bu(1,:);-p_bu(2,:)+50e-6];
%BezierEstimator.obtain_qubic_bezier_points(new_p_bu')