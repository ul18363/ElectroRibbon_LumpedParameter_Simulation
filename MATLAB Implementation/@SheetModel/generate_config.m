function generate_config(obj)
%
obj.o=[0;0];
obj.R=[0 -1; 1 0]; %Rotation Matrix
obj.set_material_properties(); % Set properties as E, G, poisson ratio...
obj.g=-9.81; %Gravity Constant

%Basic Geometry & Geometry settings
obj.L=obj.sht_dms(1);
obj.A=prod(obj.sht_dms(2:end));% Cross sectional Area [m2]
obj.m=prod(obj.sht_dms)*obj.rho; % Mass of the sheet [Kg]
obj.GA=obj.G*obj.A;

obj.x=(0:obj.sht_dms(1)/(obj.N-1):obj.sht_dms(1))+obj.x0;
obj.y=zeros(size(obj.x))+obj.y0;

obj.p=[obj.x;obj.y]; %Position vector
obj.v=zeros(size(obj.p));% Initial Velocity
obj.a=zeros(size(obj.p));% Initial Acceleration
obj.dp=obj.dp_f(obj.p);% Relative difference in position in global coordinates
%Discretization
obj.generate_discrete_model(); % Establish masses, spring constants, damping factor
obj.f_gravity=[zeros(size(obj.x));ones(size(obj.y))*obj.g]*obj.dm; %Define the gravity force
obj.snap_initial_configuration(); % Save initial configuration
obj.define_force_bc('all_free')
end
