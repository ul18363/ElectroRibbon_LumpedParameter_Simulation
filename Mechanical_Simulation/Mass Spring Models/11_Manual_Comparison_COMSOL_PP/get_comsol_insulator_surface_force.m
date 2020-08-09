function [x,force,Ey,ey_filt]=get_comsol_insulator_surface_force(width,filename)
[x,Ey]=importey_insulator(filename);

% importey_interface
% n=length(x); %The whole sheet
% x=x(1:round(n/2)); %Half a sheet is good enough
% Ey=Ey(1:round(n/2)); %Half a sheet is good enough
log10_ey=log10(abs(Ey));

% Gaussian Filter (Seems to work)!
sigma=0.0001;
log10_ey_filt=gaussfilt(x,log10_ey,sigma);

% Reconstruction of Eelctric Field
ey_filt=(ones(size(log10_ey_filt))*10).^(log10_ey_filt);

% Calculation of Force
epsilon_0=8.85*10^(-12);
er_insulator=4.7;
er_oil=2.7;
force=(ey_filt.^2)*(epsilon_0*er_insulator*width);

return