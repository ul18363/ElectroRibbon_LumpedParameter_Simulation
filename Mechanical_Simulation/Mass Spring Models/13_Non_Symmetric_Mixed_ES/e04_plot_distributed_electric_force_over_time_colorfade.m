clear;clc;

% file=files{file_ix}    ;
file='e04_zipping_data/e04_results_N61_m8_V2000_2020_09_08_08_00_06.mat';
        
load(file,'obj')

V=obj.voltage;
N=obj.N;
instance_legend=['N:',num2str(N),'|V:',num2str(V)];
% legends_names{file_ix}=instance_legend;
% disp(legends_names{file_ix})
%     if N==21 || V==3000 %(V==3000 && N==61) ||N==61 ||V==10000||V==12000
%     if  V~=6000 %(V==3000 && N==61) ||N==61 ||V==10000||V==12000
%         legends_names{file_ix}=[];
%        continue
%     end
%     figure(V)
load(file,'t_cells','y_pos_cells','obj','electr_cells','btm_obj_cells')
% btm_obj_cells{end}=btm_obj_cells{end}(~cellfun('isempty',btm_obj_cells{end}));
% top_obj_cells{end}=top_obj_cells{end}(~cellfun('isempty',top_obj_cells{end}));
electr_cells{end}=electr_cells{end}(~cellfun('isempty',electr_cells{end}));

%
%
y=cat(1,y_pos_cells{:});
y_perc=(y-y(1))/(0-y(1))*100;

electr=cat(2,electr_cells{:});
btm_objs=cat(2,btm_obj_cells{:});
%     top_objs=cat(2,top_obj_cells{:});

net_felec=zeros(size(electr));
net_felec_integrated=zeros(size(electr));
t=cat(1,t_cells{:});
n_timesteps=length(t);




%     %
for j=1:length(electr)
    
    int_domain=diff(electr{j}.arclen_btm);
    dist_f=(electr{j}.f_btm(1:end-1)+electr{j}.f_btm(2:end))/2;
    net_felec_integrated(j)=2*(dist_f'*int_domain);
    f=sum(btm_objs{j}.f_electr,2);
    net_felec(j)=2*f(2);
    
end
%
%     res.V=V;
%     res.N=N;
%     res.electr=electr;
%     res.t=t;
res.net_felec=net_felec;
res.y_perc=y_perc;
%
%

ts_samples_ixs=round(1:n_timesteps/n_timesteps:n_timesteps);
ts_samples=t(ts_samples_ixs);
maxT=t(end);
%How electric force distribution changes over time
%
%%
% Ts=[];
% Xs=[];
% Fs=[];
n=0;
for i=1:length(ts_samples)
    ix=ts_samples_ixs(i);
    n=n+ length(electr{ix}.arclen_btm);
end
Ts=zeros([1 n]);
Xs=zeros([1 n]);
Fs=zeros([1 n]);
Zip_p=zeros([1 n]);
ix_cnt=1;
for i=1:length(ts_samples)
    n=n+ length(electr{ix}.arclen_btm);
    
    curT=ts_samples(i);
    ix=ts_samples_ixs(i);
    
    ixs=(ix_cnt:ix_cnt+length(electr{ix}.arclen_btm)-1);
    
    Xs(ixs)=electr{ix}.arclen_btm;
    Ts(ixs)=ones(size(electr{ix}.f_btm))*curT;
    Zip_p(ixs)=ones(size(electr{ix}.f_btm))*y_perc(i);
    Fs(ixs)=electr{ix}.f_btm;
    ix_cnt=ix_cnt+length(electr{ix}.arclen_btm);
    
end


%%
% legends_names=legends_names(~cellfun('isempty',legends_names));
% legend(legends_names)
%     axis()%%
%     y=cat(1,y_pos_cells{:});
%     y_perc=(y-min(y))/(0-min(y))*100;
%     plot(t,y_perc)
%     hold on
%     grid on
% % end
%
% legends_names=legends_names(~cellfun('isempty',legends_names));
%

% for i=1:length(ts_samples)
%     n=n+
%     curT=ts_samples(i);
%     ix=ts_samples_ixs(i);
%     plot3(electr{ix}.arclen_btm,ones(size(electr{ix}.f_btm))*curT,electr{ix}.f_btm,'Color',[curT/maxT 0 0])
% %     plot(electr{ix}.arclen_btm,electr{ix}.f_btm,'Color',[curT/maxT 0 0])
% %     plot(electr{ix}.arclen_btm,electr{ix}.f_btm,'Color',[curT/maxT 0 0])
%     hold on
% end
%%
scatter3(Xs(:),Zip_p(:),Fs(:),50,Fs(:),'filled')
title('Distributed Force over time')
xlabel('Distance to Zipping Point [m]')
ylabel('Time [s]')
ylabel('Zipping Progress [%]')
zlabel('Distributed Force [N/m]')
colorbar
% legend(legends_names)

%%
tq=0:0.01:max(Ts);
xq=0:0.0001:max(Xs);
zq=min(Zip_p):0.1:max(Zip_p);
fq=0:0.1:max(Fs);
