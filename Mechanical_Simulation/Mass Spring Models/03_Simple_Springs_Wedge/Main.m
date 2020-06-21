clear; clc;
N=10
m_00_global_parameters;
m_01_set_parameters;
m_02_initial_config;
%dt_st=1e-5; %1e-6 is stable % With physicly based parameters 1e-7 is stable
dt_st=1e-6;
T=5;
count=0;
%% Override Coefficients

damp_factor=10;
%k_axial=2e3; %2.54e6 (N/m) (both calculated with N=11) scale k_axial(N2)=k_axial(N1)*((N2-1)/(N1-1))
%k_trans=2e3; %9.8833e6 (N/m) scale k_trans(N2)=k_trans(N1)*(N2/N1)
%k_trans=0;%Remove transversal forces (I expect to see a sharper slope);

%% Simulation Loop
tic
for i=0:dt_st:T   
    m_03_calculate_elastic_forces;
    m_04_run_fundamental_eqns;
    if (any(isnan(p(:)))) %|| i>1e-2
        break
    end
    count=count+1;
    if rem(i,1e-2)==0 % Plot every 0.1ms
        toc
        plot(10^3*p(1,:),10^3*p(2,:),'ro')
        title(['model t:',num2str(i)])
        %axis([0 0.1 -1e-8 0])
        grid on
        drawnow
        %pause(0.5)
        %break
        tic
    end
end