clear;clc;
%% Physical & Geometrical parameters
sht_dms=[0.1 0.0127 100e-6];
% Steel parameters (Source: https://www.azom.com/article.aspx?ArticleID=6742)
rho=7850; %Density [kg/m3]
E=(190+210)/2; %Modulus of Elasticity [GPa -> e9 N/m2]
p_ratio=(0.27+0.30)/2; %Poission_ratio

G=E/(2*(1+p_ratio));%Shear Modulus (G also mu)
g=9.81; %Gravity Constant
% Being 3 points in a beam u,v,w (adjacent left to right to each other.
% G= (F_shear/A)/(dx/l) ->
% F_shear= G*A*dx/l (In this example instad of using dx, as in the source,
% we express dx as dy)
% l been the distance between the adjacent elements in the direction of the tangent of the beam at the point in question.
% dx -> The distance between the elements in the perpendicular direction of the tangent of the beam
% A -> The cross section Area
% F_shear -> The material Force in the perpendicular 
% (Source:https://en.wikipedia.org/wiki/Shear_modulus)
dt0=1e-3;
A=prod(sht_dms(2:end));
%% Discretization/mass-spring parameters
N=11; % Number of points including edges
o=[0;0];
k=2e3; %Spring Coefficient
d=2e2; %Damping Factor

m=prod(sht_dms)*rho; % Mass of the sheet
dm=m/N;              % Mass for individual mass element
x0=0;

R=[0 -1; 1 0]; %Rotation Matrix

x=(0:sht_dms(1)/(N-1):sht_dms(1))+x0;
y=zeros(size(x));
p=[x;y]; %Position vector
v=zeros(size(p));
a=zeros(size(p));
% Notation 
% Prefixes:
   %  l_ -> left, r_:right 
% Suffixes:
% _v: Variable(to be used in anonymous function), _f: Function,_Xo:
% original
%
dp=diff(p,1,2);% Difference in position
r_dp_f=@(dp_v) [dp_v o];    % Relative position of the next element to the right
l_dp_f=@(dp_v) [o -dp_v];   % Relative position of the next element to the left

r_dpo=[dp o];    % Relative position of the next element to the right
l_dpo=[o -dp];   % Relative position of the next element to the left

dp_f=@(p)diff(p,1,2);
dp=dp_f(p);
%% Local displacement
%  A positive l_strain at the position "i", means that the element to the
%  left of "i", got closer to "i", since we take that the direction to the
%  right is positive. (Thus it will tend to pushh the particle i to the
%  its relative right)
%  On the other hand a r_strain at the position "i", means that the element 
%  to the right of "i" got further to the right than its equilibrium
%  position. (Thus it will push it to its relative right)
%% Simple Form
l_deform_f = @(dp_v) [o -dp_v]-l_dpo; % Calculates local deformation from particle to the left
r_deform_f = @(dp_v) [dp_v o]-r_dpo;  % Calculates local deformation from particle to the right

l_deform=l_deform_f(dp);
r_deform=r_deform_f(dp);
%f_strain= E*strain-> f_strain=E*deform/l; 
% strain = deformation/original length=deform/l
f_deform=k*(l_deform+r_deform);

og_dp=dp;       % Original relative difference in position
dp_per=R*dp;    % Perpendicular direction of relative difference in position between elements in the chain
dp_per_norm=normc(R*dp); %Idem. Normalized

%% Complex model
%  The diagram below represents:
%    * as Points
%    ---- as edges
%    // as the beggining and the end of the "real beam"
%  *----------//*------------*------------*------------*------------*------------*------------*//------------*
%  P-1  dp-1    P0  dp0     P1     dp1    P2    dp2    P3    dp3    P4    dp4    P5    dp5    P6    dp5+1   P6+1    
%  P-1  x_r0    P0  x_r1    P1    x_r2    P2    x_r3   P3    x_r4   P4    x_r5   P5    x_r6   P6    x_rend  P6+1 
x_r0=[1;0];
x_rend=[1;0];
x_rel=normc(dp);
x_rel=[x_r0 x_rel x_rend];
y_rel=R*x_rel;


k_long=2e3;
k_trans=3e3;

% Local frames of reference from link in the left
x_rel_l=x_rel(:,3:end);
y_rel_l=y_rel(:,3:end);

%% Forces from "i" to "i+1"
% Local Longitudinal distance between nodes from left to right
r_dp_rel_dx=sum(dp.*x_rel_l);
% Local Transversal distance between nodes from left to right
r_dp_rel_dy=sum(dp.*y_rel_l);
r_dp_rel=[r_dp_rel_dx;r_dp_rel_dy];

r_def_rel=r_deform_f(r_dp_rel); %Relative deformation with respect of the elements to the left 
r_def_rel_active=[o r_def_rel];
r_def_rel_reactive=[-r_def_rel o];
f_i_ii_r=0;


% Local frames of reference from link in the right
x_rel_r=x_rel(:,1:end-2);
y_rel_r=y_rel(:,1:end-2);



%%
f_gravity=[zeros(size(x));ones(size(y))*g]*dm;
%% Eqns of Motion
f=0;
a=f/dm;

%% Plots
% Mid points of p
avg_p=p(:,1:end-1)+dp/2;
quiver(avg_p(1,:),avg_p(2,:),dp_per(1,:),dp_per(2,:))

%% Functions
% function d=disp(p)
%     
%     d=p;
% end