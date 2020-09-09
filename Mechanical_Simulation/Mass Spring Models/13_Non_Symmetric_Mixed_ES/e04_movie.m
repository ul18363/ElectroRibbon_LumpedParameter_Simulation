clear;clc; close all;
% folder_name='e04_results_data_scaled';
% folder_name='e04_zipping_data';

% folder_names={'e04_results_data_scaled' ,'e04_zipping_data'};
% folder_names={'e04_old_results_High_voltage'};.
% folder_names={'e04_results_HL'};
folder_names={'e04_results_HL_succesfull'};


for folder_ix=1:length(folder_names)
    folder_name=folder_names{folder_ix};
    
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
    %%
    for i=1:n_files
        file=files{i}    ;
        %     load(file,'t_cells','y_pos_cells','obj','electr_cells')
        %         file='e04_results_HL/e04_results_scaled_HL_N61_m61_V6000_2020_09_08_15_49_26';
        %         file='e04_results_HL_succesfull/e04_results_scaled_HL_N61_m61_V6000_2020_09_08_15_49_26.mat';
        %         file='e04_results_data_scaled/e04_results_scaled_N61_m8_V6000_2020_09_08_10_10_46';

%         file='e04_results_HL/e04_results_scaled_HL_N61_m61_V5000_2020_09_08_15_00_17.mat';
        file='e04_zipping_data/e04_results_N61_m8_V6000_2020_09_08_05_47_10.mat';
        
        
        load(file,'t_cells','y_pos_cells','obj','top_obj_cells','btm_obj_cells','electr_cells')
        %
        N=obj.N;
        V=obj.voltage;
        for j=1:length(btm_obj_cells)
            %         electr_cells{j}=electr_cells{j}(~cellfun('isempty',electr_cells{j}));
            btm_obj_cells{j}=btm_obj_cells{j}(~cellfun('isempty',btm_obj_cells{j}));
            top_obj_cells{j}=top_obj_cells{j}(~cellfun('isempty',top_obj_cells{j}));
        end
        %%
        for j=1:length(electr_cells)
                    electr_cells{j}=electr_cells{j}(~cellfun('isempty',electr_cells{j}));
%             btm_obj_cells{j}=btm_obj_cells{j}(~cellfun('isempty',btm_obj_cells{j}));
%             top_obj_cells{j}=top_obj_cells{j}(~cellfun('isempty',top_obj_cells{j}));
        end
        %%
        %
        %
        btm_obj_cells=cat(2,btm_obj_cells{:});
        top_obj_cells=cat(2,top_obj_cells{:});
        electr_cells=cat(2,electr_cells{:});
        %         btm_x's
        
        %
        t=cat(1,t_cells{:});
        y=cat(1,y_pos_cells{:});
        %
        btm_x=zeros([length(t) obj.N]);
        btm_y=zeros([length(t) obj.N]);
        top_x=zeros([length(t) obj.N]);
        top_y=zeros([length(t) obj.N]);
        %
        for j =1:length(t)
            btm_x(j,:)= btm_obj_cells{j}.p(1,:);
            btm_y(j,:)=btm_obj_cells{j}.p(2,:);
            top_x(j,:)=top_obj_cells{j}.p(1,:);
            top_y(j,:)=top_obj_cells{j}.p(2,:);
        end
        %
        axes_lims=[min(min(btm_x(:)),min(top_x(:))) max(max(btm_x(:)),max(top_x(:)))  min(min(btm_y(:)),min(top_y(:))) max(max(btm_y(:)),max(top_y(:)))];
        %%
        
        y_perc=(y-y(1))/(0-min(y))*100;
        
        %         for j=1:500:length(t)
        %%
        frames=(0:1:5)/5;
        frames= round(length(t)*frames);
        frames(1)=1;
        %             j=59889
        
        %             j=50000
        for frame_n=1:6
            j=frames(frame_n);
            subplot(3,2,frame_n)
            %
            hold off
            plot(btm_x(j,:),btm_y(j,:),'b-x')
            hold on
            grid on
            plot( top_x(j,:),top_y(j,:),'b-x')
            
            axis(axes_lims)
            xlabel('x [m]')
            ylabel('y [m]')
            title(['T=',num2str(round(t(j),2)),'| Zip: ',num2str(round(y_perc(j),0)),'%'])
            drawnow()
        end
        %%
        
        if y_perc(end)<90
            
            continue
        end
        plot(t,y_perc,format_plot,'DisplayName',instance_legend,'LineWidth',2)
        
        legend('Location','northeastoutside')
        xlabel('Time [s]')
        ylabel('Zip progress[%]')
        title('Zipping progress against time')
        hold on
        grid on
    end
end
export_folder='e04_movies';
%
% %%
% pause(0.1)
% %%
% % h =  findobj('type','figure');
% % export_folder='exportFigures/';
% % format='%02.f';
% % for i =1:length(h)
% %     padded_Number=num2str(h(i).Number/1000,format);
% %     filename=[export_folder,'ZippingTime_allN_',padded_Number,'KV.eps'];
% %     saveas(h(i),filename,'epsc')
% % end
% h =  findobj('type','figure');
% export_folder='exportFigures/';
% format='%02.f';
% for i =1:length(h)
%     padded_Number=num2str(h(i).Number,format);
%     filename=[export_folder,'ZippingTime_allV_',padded_Number,'N.eps'];
%     saveas(h(i),filename,'epsc')
% end
%

% legends_names=legends_names(~cellfun('isempty',legends_names));
%
% xlabel('Time [s]')
% ylabel('Zip progress[%]')
% legend(legends_names)