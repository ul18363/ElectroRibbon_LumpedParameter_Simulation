%% Code Information
%
%   This is to simulate electrostatic force when knowing the deflection of the beam
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear; clc;
function calculate_distributed_force(obj)
% Fy=parallel_sheet_model_ES(x,dy)
% Returns the electrostatic force between two sheets assuming a "parallel 
% sheet" model. Using the following parameters
% 
% Backing material:
% Consider in the configuration of a simply supported beam
% t = 100e-6;% t height (thickness) of backing material /m
% d = 0.0127;% d depth (width) of backing material /m
% L = 0.1;% L length of backing material /m
% dL = 1e-4;% dL length of backing material's element /m
% discrete_points =1000;% discrete_points: number of backing material's elements /unit   
% E = 10e9;% E young's modulus /N/(m^2)
% % Electrical properties
% eMed = 2.75;    % eMed relative medium permittivity (silicone oil) % silicone oil http://www.clearcoproducts.com/pdf/puresilicone/Dielectric_Properties_Pure_Silicone_Fluids.pdf
% eAir = 1; % air % eAir relative air permittivity
% eIns = 4.62; % eIns relative insulator permittivity (PVC tape)
% % eIns = eMed; % assume medium is everywhere and electrodes are kept away by other means
% tIns = 130e-6;% tIns insulator thickness /m
% % EMaxMed = 3e6; % air % EMaxMed dielectric breakdown strength of medium
% EMaxMed = 20e6; % silicone oil
% EMaxAir = 3e6; % air % EMaxAir dielectric breakdown strength of air
%
% Droplet volume and mass options:
% dropVolume = 100*1e-6; % m^3 = 1e6 ml
% V = 10000; % V    

dropVolume=obj.dropVolume;
d=obj.sheet_width;
% L=obj.L;
eMed=obj.eMed;
eAir=obj.eAir;
eIns=obj.eIns;
tIns=obj.tIns;
EMaxMed=obj.EMaxMed;
EMaxAir=obj.EMaxAir;
V=obj.voltage;
% discrete_points=obj.points;
x=obj.points(:,1);
h=obj.points(:,2);
% y=2*(dy+tIns);
% close all;
%% input options
simulateBreakdown = 1;
simulatePartialBreakdown = 1;
%% Electrical properties
e0 = 8.85e-12;% e0 vacuum permittivity /F/m

%% interporation
xs = linspace(x(1),x(end),obj.sample_size); % Divide homogeneously the range in x
dL = xs(2);
hs = interp1(x,h,xs);

%% calculate medium breakdown height for medium and air
tMinMed = (V/EMaxMed - (eMed*tIns)/eIns);
tMinAir = (V/EMaxAir - (eAir*tIns)/eIns);

%% calculate Wes for zipped elements (t_medium << t_insulator)
% zippedWes = 0.5*(eIns*e0*d*V^2)/(tIns^2);    

%% Initial Volume: calculate cumulative volume at each node
volumes = zeros(1,length(xs));
for i = 1:length(xs)
    volumes(i) = -dL*trapz(2.*hs(1:i))*d; % 2.* = top and bottom sides
end
    
%% INITIAL: determine loaded simply-supported sheet shape w/ electrostatic force applied
% determine electrostatic distributed load at each element based upon
% current beam deflection N.B. use -ve value of ysMass since deflection
% away from other electrode is negative in this simulation.
initialWes = zeros(1,length(xs));
%     fprintf('~~~ Droplet volume is %10.8f ml and voltage is %d V ~~~\n', 1e6*dropVolume, V);
dropW = max(xs(volumes < dropVolume/2)); % maximum length that contains droplet
if isempty(dropW)
    dropW = 0;
end    
%     fprintf('~~~ Length which contains droplet is %2.3f m ~~~\n', dropW);
for i = 1:length(xs)
    if xs(i) < dropW %|| xs(i) > L-dropW (Only Simulating on one half)
        if simulateBreakdown == 0 || abs(hs(i)) > tMinMed
            initialWes(i) = 0.5*(eMed*e0*d*V^2)/(((eMed/eIns)*tIns - hs(i))^2); % DLZ eq. 1
            % WHY: - initialYsMass(i) because initialYsMass(i) is negative
        elseif simulatePartialBreakdown == 1
            initialWes(i) = 0.5*eMed*e0*d*EMaxMed^2;
        end
    else
        if simulateBreakdown == 0 || abs(hs(i)) > tMinAir
            initialWes(i) = 0.5*(eAir*e0*d*V^2)/(((eAir/eIns)*tIns - hs(i))^2);
        elseif simulatePartialBreakdown == 1
            initialWes(i) = 0.5*eAir*e0*d*EMaxAir^2;
        end
    end
end
Fy_dist=initialWes;

obj.Fy_dist=Fy_dist;
obj.Fx_dist=zeros(size(Fy_dist));
% obj.cumFy=cumsum(Fy);
% obj.cumFx=cumsum(Fx);
obj.xs=xs;
obj.ys=hs;
return 

