clear;clc;close all;

file='data2/results_N61_2020_08_31_17_40_54.mat';
% file=files{file_ix}    ;
load(file,'obj')

V=obj.voltage;
N=obj.N;
instance_legend=['N:',num2str(N),'|V:',num2str(V)];
disp(instance_legend)

load(file)

btm_obj_cells{end}=btm_obj_cells{end}(~cellfun('isempty',btm_obj_cells{end}));
top_obj_cells{end}=top_obj_cells{end}(~cellfun('isempty',top_obj_cells{end}));
electr_cells{end}=electr_cells{end}(~cellfun('isempty',electr_cells{end}));

y=cat(1,y_pos_cells{:});
y_perc=(y-min(y))/(0-min(y))*100;

electr=cat(2,electr_cells{:});
btm_objs=cat(2,btm_obj_cells{:});
top_objs=cat(2,top_obj_cells{:});

net_felec=zeros(size(electr));
t=cat(1,t_cells{:});
n_timesteps=length(t);

for j=1:length(electr)
    net_felec(j)=2*sum(electr{j}.f_btm.*electr{j}.arclen_btm,1);
    net_discrete_felec=
end

res.net_felec=net_felec;
res.y_perc=y_perc;
filtered_net_felec=gaussfilt(res.y_perc,res.net_felec',0.8);
x_data=res.y_perc;
y_data=filtered_net_felec;



figure(V)

% figure(N)
plot(res.y_perc,filtered_net_felec,'DisplayName',instance_legend)
axs=gca();
axs_s=max([axs.XLim,axs.YLim],[0,max(x_data),0,max(res.net_felec)]);
axs_s=min([0 Inf 0 Inf],axs_s);
hold on
grid on
xlabel('Zipping progress [%]')
ylabel('Electrostatic force[N]')
title('Electrostatic force Vs Zipping progress')
legend('Location','northeastoutside')
axis(axs_s)
drawnow()