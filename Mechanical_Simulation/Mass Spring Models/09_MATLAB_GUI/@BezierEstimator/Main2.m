close all;
load('/home/bruno/Repositories/Personal/MATLAB_Dissertation/Mechanical_Simulation/Mass Spring Models/09_MATLAB_GUI/status.mat', 'p_bu')
Mat2=p_bu';
[p0mat,p1mat,p2mat,p3mat,fbi]=bzapproxu(Mat2,MxAllowSqD,ibi);
fbi(end)=500;
[MatI]=BezierInterpCPMatSegVec(p0mat,p1mat,p2mat,p3mat,fbi);
figure
plot(MatI(:,1),MatI(:,2),'.')
hold on
plot(Mat2(:,1),Mat2(:,2),'r-x')