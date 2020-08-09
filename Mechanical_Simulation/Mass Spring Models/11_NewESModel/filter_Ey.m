clear;clc;
importey_insulator
n=length(x); %The whole sheet
x=x(1:round(n/2)); %Half a sheet is good enough
Ey=Ey(1:round(n/2)); %Half a sheet is good enough

log10_ey=log10(abs(Ey));
yMedFilt = medfilt1(log10_ey,17,'truncate');
semilogy(x,abs(Ey))
[B,ixs] = rmoutliers(yMedFilt,'movmedian',1000); % B- Data wto oujtliers, ixs- outlier indexes; 
figure
plot(x,log10_ey)
hold on
plot(x,yMedFilt,'g.')
hold on

plot(x(~ixs),B,'rx')
plot(x(ixs),yMedFilt(ixs),'ro')
title('Log 10 Ey')
legend({
    'COMSOL',...
    'Filtered',...
    'Wto Outliers',...
    'Outliers'
    })
xlabel('Arc Length [m]')
ylabel('Electric Field [V/m]')
% figure
%% Polynomial approximation
log10_polyapprox_coeffs=polyfit(x,log10_ey,5);
log10_ey_poly_approx=polyval(log10_polyapprox_coeffs,x);
figure
plot(x,log10_ey,'b')
hold on
plot(x,log10_ey_poly_approx,'r.')

%% Average points and see
% x=[1,2,3,4,5]
x_filtered=x;
ey_filtered=log10_ey;
kernel=[1,1]/2;
figure()

%% Gaussian Filter (Seems to work)!
sigma=0.0001;
log10_ey_filt=gaussfilt(x,log10_ey,sigma);

hold off
plot(x,log10_ey,'b')
hold on
plot(x,log10_ey_filt,'r.')

title(['Gauss Filter with sigma:',num2str(sigma)])
xlabel('Arc Length [m]')
ylabel('Electric Field [V/m]')
%% Reconstruction of Eelctric Field
ey_filt=(ones(size(log10_ey_filt))*10).^(log10_ey_filt);
figure()

hold off
% plot(x,Ey,'b')
hold on
plot(x,ey_filt,'r.')
%% Calculation of Force
epsilon_0=8.85*10^(-12);
er_oil=2.7;
er_insulator=4.7;
force=ey_filt.^2*epsilon_0*er_insulator;


% Net Force calculation
tot_force=trapz(x,force); % N
g_const=9.81;%m/s-2
tot_force_in_grams=1000*tot_force/g_const;

figure
plot(x,force,'r.')

title(['Reconstructed Force, Net Force in grams: ',num2str(round(4*tot_force_in_grams)),'g'])
xlabel('Arc Length [m]')
ylabel('Electrostatic Force [N]')
%% Net Force calculation
tot_force=trapz(x,force); % N
g_const=9.81;%m/s-2
tot_force_in_grams=1000*tot_force/g_const;
%% Filter X
x_filtered=conv(x_filtered,kernel,"same");
x_filtered=x_filtered(2:end-1);
ey_filtered=conv(ey_filtered,kernel,"same");
ey_filtered=ey_filtered(2:end-1);
hold off
plot(x,log10_ey,'b')
hold on
plot(x_filtered,ey_filtered,'r.')


%% Fourier Filtering 
% 
% % clc;
% % clear all
% t=x;
% s=log10_ey;
% % A=0.25;
% % B=1.25;
% % f1=0.5;
% % f2=0.025;
% % s=A*sin(f1*t)+B*cos(f2*t)+randn(size(t));
% figure
% y=tarekLPF(s,1,2);
% plot(t,s,'b',t,y,'r','LineWidth',2)
% legend('original','filtred')
%% Spectral analysis

fs = 10^7;                                % sample frequency (Hz)

t_f=x;
x_f=log10_ey;
y = fft(x_f);
n = length(x);          % number of samples
f = (0:n-1)*(fs/n);     % frequency range
power = abs(y).^2/n;    % power of the DFT

plot(f(10:end),power(10:end))
xlabel('Frequency')
ylabel('Power')