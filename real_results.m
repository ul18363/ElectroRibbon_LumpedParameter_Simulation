close all;
standard_dimensions=[100e-3 127e-3 50e-6]; % Length (l), width(w), thickness(t)

% Maximum Stroke (MS) [mm]
% Maximum Load (ML) [g]
dt=[20 50 100 200 500 1000];
dt_MS=[85 55 29 7 2.1 0.8];
dt_ML=[15 30 50 100 500 1200];

dl=[10 20 50 100 200];
dl_MS=[0.8 3 19 60 120];
dl_ML=[290 110 43 30 9];

dw=[6 12.7 25];
dw_MS=[35 60 55];
dw_ML=[7 30 40];

%% Plots

figure
subplot(1,3,1)
yyaxis left
semilogy(dt,dt_MS,'bo-', 'MarkerFaceColor','blue')
xlabel('Electrode thickness (\mum)')
ylabel('Maxmimum stroke (mm)')
grid on
axis([0 1000 1e-1 1e2])
yyaxis right
semilogy(dt,dt_ML,'rs-', 'MarkerFaceColor','red')
ylabel('Maxmimum load (g)')
axis([0 1000 1e1 1e4])
axis square

subplot(1,3,2)
yyaxis left
semilogy(dl,dl_MS,'bo-', 'MarkerFaceColor','blue')
xlabel('Electrode length (mm)')
ylabel('Maxmimum stroke (mm)')
grid on
axis([0 200 1e-1 1e3])
yyaxis right
semilogy(dl,dl_ML,'rs-', 'MarkerFaceColor','red')
ylabel('Maxmimum load (g)')
axis([0 200 1e0 1e4])
axis square

subplot(1,3,3)
yyaxis left
semilogy(dw,dw_MS,'bo-', 'MarkerFaceColor','blue')
xlabel('Electrode width (mm)')
ylabel('Maxmimum stroke (mm)')
grid on
axis([5 25 1e1 1e3])
yyaxis right
semilogy(dw,dw_ML,'rs-', 'MarkerFaceColor','red')
ylabel('Maxmimum load (g)')
axis([5 25 1e0 1e2])
axis square