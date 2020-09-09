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
        load(file,'t_cells','y_pos_cells','obj')
        %%
        
        
        V=obj.voltage;
        N=obj.N;
        if isequal(folder_name,'e04_zipping_data') ||isequal(folder_name,'e04_old_results_High_voltage')
            es_source='FE COMSOL';
            format_plot=':';
        elseif isequal(folder_name,'e04_results_data_scaled')||isequal(folder_name,'e04_results_HL') ||isequal(folder_name,'e04_results_HL_succesfull') 
            es_source='PP Scaled';
            format_plot='-';
        end
        if 2*V==6000
        continue
        end
        instance_legend=['|V:',num2str(V*2),'| ',es_source]; %'N:',num2str(N),
        
        figure(N)
        
        t=cat(1,t_cells{:});
        y=cat(1,y_pos_cells{:});
        y_perc=(y-y(1))/(0-min(y))*100;
%         if y_perc(end)<90
%             
%             continue
%         end
        plot(t,y_perc,format_plot,'DisplayName',instance_legend,'LineWidth',2)
        
%         legend('Location','northeastoutside')
        xlabel('Time [s]')
        ylabel('Zip progress[%]')
        title('Zipping progress against time')
        hold on
        grid on
    end
end
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