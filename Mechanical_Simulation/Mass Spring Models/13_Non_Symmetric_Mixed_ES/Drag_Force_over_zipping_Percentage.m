clear;clc;
folder_name='data2';
extension='.mat';
listing=dir(folder_name);
files={};
for i=1:length(listing)
    if endsWith(listing(i).name,extension)
        files{end+1}=[folder_name,'/',listing(i).name];
    end
end

legends_names=files;
n_files=length(files);

% file_ix=2;
%%
close all;
for file_ix=1:n_files
    file=files{file_ix}    ;
    load(file,'obj')
    
    V=obj.voltage;
    N=obj.N;
    instance_legend=['N:',num2str(N),'|V:',num2str(V)];
    legends_names{file_ix}=instance_legend;
    disp(legends_names{file_ix})
    %     if N==21 || V==3000 %(V==3000 && N==61) ||N==61 ||V==10000||V==12000
    %     if  V~=6000 %(V==3000 && N==61) ||N==61 ||V==10000||V==12000
    %         legends_names{file_ix}=[];
    %        continue
    %     end
    %     figure(V)
    load(file,'t_cells','y_pos_cells','obj','electr_cells','btm_obj_cells','top_obj_cells')
    btm_obj_cells{end}=btm_obj_cells{end}(~cellfun('isempty',btm_obj_cells{end}));
    top_obj_cells{end}=top_obj_cells{end}(~cellfun('isempty',top_obj_cells{end}));
    electr_cells{end}=electr_cells{end}(~cellfun('isempty',electr_cells{end}));
    f_ax=obj.mechanical_model.bottom_plate.f_axial_ltr;
    %
    %
    y=cat(1,y_pos_cells{:});
    y_perc=(y-min(y))/(0-min(y))*100;
    
    electr=cat(2,electr_cells{:});
    btm_objs=cat(2,btm_obj_cells{:});
    top_objs=cat(2,top_obj_cells{:});
    
    net_felec=zeros(size(electr));
    net_fdrag=zeros(size(electr));
    net_felast=zeros(size(electr));
    net_felec_integrated=zeros(size(electr));
    t=cat(1,t_cells{:});
    n_timesteps=length(t);
    
    
    %%

    %%
    
    %     %
    for j=1:length(electr)
        
        int_domain=diff(electr{j}.arclen_btm);
        dist_f=(electr{j}.f_btm(1:end-1)+electr{j}.f_btm(2:end))/2;
        net_felec_integrated(j)=2*(dist_f'*int_domain);
        f=sum(btm_objs{j}.f_electr,2);
        f_drag=sum(btm_objs{j}.f_damp,2);
        sum(btm_objs{j}.f_elast.*obj.mechanical_model.bottom_plate.f_mask+...
            top_objs{j}.f_elast.*obj.mechanical_model.top_plate.f_mask,2)
        f_elast=btm_objs{j}.f_elast(:,end);% The elastic force is just the force at the end effector
        %Something more refined can be done though
        net_felec(j)=2*f(2);
        net_felast(j)=f_elast(2);
        
        net_fdrag(j)=f_drag(2);
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
    %     for i=1:length(ts_samples)
    %         curT=ts_samples(i);
    %         ix=ts_samples_ixs(i);
    %         plot(electr{ix}.arclen_btm,electr{ix}.f_btm,'Color',[curT/maxT 0 0])
    %         plot(electr{ix}.arclen_btm,electr{ix}.f_btm,'Color',[curT/maxT 0 0])
    %         hold on
    %     end
    %
    %     filtered_net_felec=gaussfilt(res.y_perc,net_felec',0.1);
    filtered_net_felec=net_felec;
    x_data=y_perc;
    y_data=filtered_net_felec;
    
    % figure(V)
    figure(N+V)
    
    %     plot(y_perc,filtered_net_felec,'LineWidth',2,'DisplayName',instance_legend)
    %     plot(y_perc,net_felec_integrated,'--','LineWidth',2,'DisplayName',[instance_legend,'-integrated'])
    plot(y_perc,net_felec,'-','LineWidth',2,'DisplayName',[instance_legend,':Electric Force'])
    hold on
    plot(y_perc,net_felast,'-','LineWidth',2,'DisplayName',[instance_legend,':Elastic Force'])
    plot(y_perc,net_fdrag,'-','LineWidth',2,'DisplayName',[instance_legend,':Drag Force'])
    axs=gca();
    axs_s=max([axs.XLim,axs.YLim],[-Inf,max(x_data),-Inf,max(res.net_felec)]);
    
    axs_s=min([0 Inf 0 Inf],axs_s);
    grid on
    xlabel('Zipping progress [%]')
    ylabel('Electrostatic force[N]')
    title('Forces Vs Zipping progress')
    legend('Location','northeastoutside')
    axis(axs_s)
    drawnow()
    %     break
end

h =  findobj('type','figure');
export_folder='exportFigures/';
format='%02.f';
for i =1:length(h)
    N=rem(h(i).Number,1000);
    V=h(i).Number-N;
    padded_V=num2str(V,format);
    padded_Number=num2str(N,format);
    %     padded_Number=num2str(h(i).Number,format);
    filename=[export_folder,'allForces_N',padded_Number,'_',padded_V,'KV.eps'];
    saveas(h(i),filename,'epsc')
end

% legends_names=legends_names(~cellfun('isempty',legends_names));
% legend(legends_names)
%     axis()
%%
%     y=cat(1,y_pos_cells{:});
%     y_perc=(y-min(y))/(0-min(y))*100;
%     plot(t,y_perc)
%     hold on
%     grid on
% % end
%
% legends_names=legends_names(~cellfun('isempty',legends_names));
%
% xlabel('Time [s]')
% ylabel('Zip progress[%]')
% legend(legends_names)