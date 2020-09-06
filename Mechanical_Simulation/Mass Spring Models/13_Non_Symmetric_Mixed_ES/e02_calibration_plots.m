clear;clc; close all;
% calibration_files_folder='e02_calibration';


folder_name='e02_calibration';
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

%%


for i=1:n_files
    file=files{i};
%     load(file,'t_cells','y_pos_cells','obj')
    load(file,'obj2','com_mech')
    %%
    obj=obj2;
    N=obj.N;
    M=obj.M*1000;
    instance_legend=['N:',num2str(N),'|M:',num2str(M)];

    btm_sheet_pts=obj.mechanical_model.bottom_plate.p;
    
    L=0.1; sheet_width=0.0127; thickness=100e-6; %thickness=50e-6;
    base_l=0.01;clip_l=0.01;
    ins_thickness=130e-6;
    sht_dms=[L sheet_width thickness];
    sht_dms_for_comsol_mech=[(sht_dms(1)-base_l)/2 sht_dms(2) sht_dms(3)];
    com_mech=COMSOL_Mechanical(sht_dms_for_comsol_mech,130);
    com_mech.M=M/1000;
    com_mech.update_model();
    com_mech.run_solver_static_conditions();
    com_mech.retrieve_real_final_position();
    final_p=com_mech.real_p_tp(:,end);

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
    shear_elastic_coeff=obj.mechanical_model.bottom_plate.k_trans;
    res_temp=[N,M,ez_stroke,btm_sheet_stroke,comsol_sheet_stroke,...
        btm_sht_err,btm_sht_rel_err,ER_err,ER_rel_err,a_error,a_error_rel,...
        shear_elastic_coeff];
    
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

h =  findobj('type','figure');
export_folder='exportFigures/';
format='%03.f';
for i =1:length(h)
    
    padded_Number=num2str(h(i).Number,format);
    filename=[export_folder,'e02_V2_calibration_N_',padded_Number,'N.eps'];
    saveas(h(i),filename,'epsc')
end