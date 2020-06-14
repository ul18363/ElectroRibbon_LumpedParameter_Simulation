%% Physical & Geometrical parameters
sht_dms=[0.1 0.0127 100e-6];
rho=7850; %Density [kg/m3]
E=(190+210)/2 *10^9; %Modulus of Elasticity [GPa -> e9 N/m2]
p_ratio=(0.27+0.30)/2; %Poission_ratio
G=E/(2*(1+p_ratio));%Shear Modulus (G also mu)
g=-9.81; %Gravity Constant
dt_st=1e-3;
L=sht_dms(1);

A=prod(sht_dms(2:end));% Cross sectional Area [m2]
m=prod(sht_dms)*rho; % Mass of the sheet [Kg]

%% Discretization/mass-spring parameters
if ~exist('N','var')
N=11; % Number of points including edges
end
%k=2e3; %Spring Coefficient
damp_factor=2e2; %Damping Factor
dm=m/N;     % Mass for individual mass element
dl=L/(N-1); % Unstrained length of individual segment
x0=0;

%k_axial=2e3; Random initial value to test model
%k_trans=2e4;

%% K 
k_axial=E*A/(L*(N-1));
GA=G*A;
%k_trans_vec=GA/vecnorm(dp);
k_trans=G*A/dl; %Assuming small deformations,otherwise l changes and k_trans needs to be estimated accrossthe beam)
%F_shear= G*A*dy/dl = (G*A/dl)*dy