clear;clc; close all;
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
for i=1:n_files
    file=files{i}    ;
    load(file,'t_cells','y_pos_cells','obj','electr_cells')
    %%
    
    
    V=obj.voltage;
    N=obj.N;
    instance_legend=['N:',num2str(N),'|V:',num2str(V)];
%     legends_names{i}=['N:',num2str(N),'|V:',num2str(V)];
    %     if N==21 || V==3000 %(V==3000 && N==61) ||N==61 ||V==10000||V==12000
    %         legends_names{i}=[];
    %        continue
    %     end
    figure(N)
    % btm_obj_cells{end}=btm_obj_cells{end}(~cellfun('isempty',btm_obj_cells{end}));
    % top_obj_cells{end}=top_obj_cells{end}(~cellfun('isempty',top_obj_cells{end}));
    % electr_cells{end}=electr_cells{end}(~cellfun('isempty',electr_cells{end}));
    %%
    %
    % btm_objs=cat(2,btm_obj_cells{:});
    % top_objs=cat(2,top_obj_cells{:});
    % electr=cat(2,electr_cells{:});
    t=cat(1,t_cells{:});
    y=cat(1,y_pos_cells{:});
    y_perc=(y-min(y))/(0-min(y))*100;
    plot(t,y_perc,'DisplayName',instance_legend)
    
    legend('Location','northeastoutside')
    xlabel('Time [s]')
    ylabel('Zip progress[%]')
    title('Zipping progress against time')
    hold on
    grid on
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
h =  findobj('type','figure');
export_folder='exportFigures/';
format='%02.f';
for i =1:length(h)
    padded_Number=num2str(h(i).Number,format);
    filename=[export_folder,'ZippingTime_allV_',padded_Number,'N.eps'];
    saveas(h(i),filename,'epsc')
end


% legends_names=legends_names(~cellfun('isempty',legends_names));
% 
% xlabel('Time [s]')
% ylabel('Zip progress[%]')
% legend(legends_names)