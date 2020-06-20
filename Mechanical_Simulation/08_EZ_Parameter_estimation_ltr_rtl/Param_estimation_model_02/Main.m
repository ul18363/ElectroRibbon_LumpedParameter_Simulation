clear;clc;
L=0.45;
N=401;
thickness=100e-6;
load=0;
dl=L/(N-1);
x_side=0:dl:L;
mass_load=0.0135;
%hor_1=ones(size(x));
x=[x_side, flip(x_side)];
y=[ones(1,N)*thickness,zeros(1,N)];
edges_coords=[x' y'];
edges=[(1:N)*2;(1:N)*2-1];
solid_simple
% create_model();
%%
raw_data_tp_unT= model.result().numerical('displacements').getData();
res=reshape(raw_data_tp_unT,[4,N*2]);
x=res(3,:);
y=res(4,:);
u=res(1,:);
v=res(2,:);
og_x=x-u;
og_y=y-v;
tp=edges(2,:);
btm=edges(1,:);
%plot(res(3,:),res(2,:),'*')
%plot(res(3,:),res(1,:),'-o')
%%
close all
do_the_comsol_plot
hold on
% plot(x(tp),v(tp)+thickness,'-x')
% plot(x(btm),v(btm),'-o')
plot(x(tp),y(tp),'-x')
plot(x(btm),y(btm),'-o')
%% Calculate inner angles between edge approximation
p_top=[x(tp);y(tp)];
dp_tp=diff(p_top,1,2);
p_tn=normc(p_top);
%dot_prod=col_dot_prod(dp_tn(:,1:end-1),dp_tn(:,2:end));
%in_angles=acos(dot_prod)*180/pi;

%%
close all
p=p_top;
scales=[1,2,4,8,4*5,8*5];
pols=cell(size(scales));
legeneds=cell(size(scales));
for i=1:length(scales)
    step=scales(i)
    y=calculate_angles(p_top(:,1:step:end))/1000; %Degree/mm
    x=linspace(0,L,length(y));
    pol=polyfit(x(2:end-1),y(2:end-1),5)
    pols{i}=pol;
    legends{i}=['N=',num2str(length(y))];
    plot(x,polyval(pol,x))
    hold on
end
title('Beam curvature [deg/mm]')
ylabel('deg[deg/mm]')
xlabel('Arc[m]')
%N_elem=(length(p_top)-1)./[1,2,4,8,16]
legend(legends)

%%
close all
i=16
y=calculate_angles(p_top(:,1:i:end))/1000; %Degree/mm
x=linspace(0,L,length(y));
pol=polyfit(x(2:end-1),y(2:end-1),5)
pol_y=polyval(pol,x);
plot(x,pol_y)
hold on
%% Random stuff
close all
do_the_comsol_plot
hold on
plot(x,(y-min(y))/range(y))
c=range(y)/2;
y2=(y/c)+1;