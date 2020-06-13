
%% Physical & Geometrical parameters
sht_dms=[0.1 0.0127 100e-6];
% Steel parameters (Source: https://www.azom.com/article.aspx?ArticleID=6742)
rho=7850; %Density [kg/m3]
E=(190+210)/2; %Modulus of Elasticity [GPa -> e9 N/m2]
p_ratio=(0.27+0.30)/2; %Poission_ratio

G=E/(2*(1+p_ratio));%Shear Modulus (G also mu)
% G= (F_shear/A)/(dx/l)
% (Source:https://en.wikipedia.org/wiki/Shear_modulus)
%% Discretization/mass-spring parameters
N=11; % Number of points including edges

k=2e3; %Spring Coefficient
d=2e2; %Dampening Factor

x0=0;

R=[0 -1; 1 0]; %Rotation Matrix

x=(0:sht_dms(1)/(N-1):sht_dms(1))+x0;
y=zeros(size(x));
p=[x;y]; %Position vector
dp=diff(p,1,2);% Difference in position
dp_per=R*dp;

%% Plots
% Mid points of p
avg_p=p(:,1:end-1)+dp/2;
quiver(avg_p(1,:),avg_p(2,:),dp_per(1,:),dp_per(2,:))