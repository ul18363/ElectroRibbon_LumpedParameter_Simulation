clear;clc; close all;
folder_name='e02_data';
extension='.mat';
listing=dir(folder_name);

% S = dir(...);
listing= listing(~[listing.isdir]);
[~,idx] = sort([listing.datenum]);
listing = listing(idx);
files={};
for i=1:length(listing)
    if endsWith(listing(i).name,extension)
        files{end+1}=[folder_name,'/',listing(i).name];
    end
end

legends_names=files;
n_files=length(files);

error_table=zeros([n_files,11]);%[N,M,extension,ER_Stroke,btm_palte_stroke,real_comsol_stroke,profile_e]
%%
for i=1:n_files
    file=files{i};
%     load(file,'t_cells','y_pos_cells','obj')
    load(file,'obj','com_mech')
    %%
    N=obj.N;
    M=obj.M*1000;
    instance_legend=['N:',num2str(N),'|M:',num2str(M)];

    btm_sheet_pts=obj.mechanical_model.bottom_plate.p;
    comsol_pts=com_mech.real_p_tp;
    
    ez_stroke=btm_sheet_pts(2,end);
    btm_sheet_stroke=-(btm_sheet_pts(2,end)-btm_sheet_pts(2,1));
    
    comsol_sheet_stroke=-com_mech.real_p_tp(2,end);
    
    
    btm_sht_err=abs(comsol_sheet_stroke-btm_sheet_stroke);
    btm_sht_rel_err=btm_sht_err/abs(btm_sheet_stroke);
    ER_err=abs(comsol_sheet_stroke-ez_stroke*2);
    ER_rel_err=100*ER_err/abs(btm_sheet_stroke);
%     res_temp=[N,M,ez_stroke,btm_sheet_stroke,comsol_sheet_stroke,...
%         btm_sht_err,btm_sht_rel_err,ER_err,ER_rel_err];
    
    %% Area Error
    samples=1001;
    x_comsol=comsol_pts(1,:);
    x0_comsol=x_comsol(1);
    x_comsol=x_comsol-x0_comsol;
    y_comsol=comsol_pts(2,:);
    y0_comsol=y_comsol(1);
    y_comsol=y_comsol-y0_comsol;
    
    x_LM=btm_sheet_pts(1,:);
    x0_LM=x_LM(1);
    x_LM=x_LM-x0_LM;
    y_LM=btm_sheet_pts(2,:);
    y0_LM=y_LM(1);
    y_LM=y_LM-y0_LM;
    
    min_x=min(x_LM(1),x_comsol(1));
    max_x=max(x_LM(end),x_comsol(end));
    x_interval= linspace( min_x,max_x,samples); 
    y_LM_interps=interp1(x_LM,y_LM,x_interval,'linear','extrap');
    y_comsol_interps=interp1(x_comsol,y_comsol,x_interval,'linear','extrap');
    dys=(y_LM_interps-y_comsol_interps);
    dys=(dys(1:end-1)+dys(2:end))/2;
    avg_h_comsol=(y_comsol_interps(1:end-1)+y_comsol_interps(2:end))/2;
    dxs=diff(x_interval);
    a_error=abs(dxs*dys');
    a_comsol=abs(dxs*avg_h_comsol');
    a_error_rel=100*a_error/a_comsol;
    
    %%
    res_temp=[N,M,ez_stroke,btm_sheet_stroke,comsol_sheet_stroke,...
        btm_sht_err,btm_sht_rel_err,ER_err,ER_rel_err,a_error,a_error_rel];
    
    error_table(i,:)=res_temp;
    %%
    figure(N)
%     error_table(i,:)=[]
%     t=cat(1,t_cells{:});
%     y=cat(1,y_pos_cells{:});
%     y_perc=(y-min(y))/(0-min(y))*100;
    plot(x_interval,y_comsol_interps,':','DisplayName',[instance_legend,'-COMSOL'])
    hold on
    plot(x_interval,y_LM_interps,'DisplayName',instance_legend)
    
    legend('Location','northeastoutside')
    xlabel('x[m]')
    ylabel('y[m]')
    title('Profile comparison')
    hold on
    grid on
    drawnow()
end

%%
pause(0.1)
%%
% h =  findobj('type','figure');
% export_folder='exportFigures/';
% format='%02.f';
% for i =1:length(h)
%     padded_Number=num2str(h(i).Number/1000,format);
%     filename=[export_folder,'ZippingTime_allN_',padded_Number,'KV.eps'];
%     saveas(h(i),filename,'epsc')
% end


% Iterate over all figures and save
h =  findobj('type','figure');
export_folder='exportFigures/';
format='%03.f';
for i =1:length(h)
    
    padded_Number=num2str(h(i).Number,format);
    filename=[export_folder,'e02_V1_expansion_N_',padded_Number,'N.eps'];
    saveas(h(i),filename,'epsc')
end
