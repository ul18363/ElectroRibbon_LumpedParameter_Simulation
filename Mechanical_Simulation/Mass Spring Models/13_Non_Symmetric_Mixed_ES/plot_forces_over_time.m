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
    file=files{i};
    
    load(file,'t_cells','y_pos_cells','obj','electr_cells')
    V=obj.voltage;
    N=obj.N;
    
    instance_legend=['N:',num2str(N),'|V:',num2str(V)];
    figure(N)
    
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
h =  findobj('type','figure');
export_folder='exportFigures/';
format='%02.f';
for i =1:length(h)
%     padded_Number=num2str(h(i).Number,format); %Pad N
    padded_Number=num2str(h(i).Number/1000,format); % Pad voltage
    filename=[export_folder,'ZippingTime_allV_',padded_Number,'KV.eps'];
    saveas(h(i),filename,'epsc')
end

