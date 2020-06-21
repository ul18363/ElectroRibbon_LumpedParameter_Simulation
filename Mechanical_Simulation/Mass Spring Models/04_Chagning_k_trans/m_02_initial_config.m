
R=[0 -1; 1 0]; %Rotation Matrix

x=(0:sht_dms(1)/(N-1):sht_dms(1))+x0;
y=zeros(size(x));

p=[x;y]; %Position vector
po=p;
v=zeros(size(p));% Initial Velocity
a=zeros(size(p));% Initial Acceleration

%% Initial Relative difference in Poisition between nodes

dp=dp_f(p);% Relative difference in position in global coordinates
%% Original Configuration
dpo=dp;
local_xo=dpo(1,:);
local_yo=dpo(2,:);

r_dpo=[dp o];    % Relative position of the next element to the right 
l_dpo=[o -dp];   % Relative position of the next element to the left
% (In global coordinates which match local coordinates for this case at t=0)
%% Calculate gravity forces (which are is constant throghout the script)
f_gravity=[zeros(size(x));ones(size(y))*g]*dm;

clear x y;