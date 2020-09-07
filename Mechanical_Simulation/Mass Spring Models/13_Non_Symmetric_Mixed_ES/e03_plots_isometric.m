clear;clc; close all;
% calibration_files_folder='e02_calibration';

output_path='e03_figures/';
folder_name='e03_data';
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
files=files'
res=[];
for file_ix=1:n_files
%%
% file_ix=1;

filename=files{file_ix};
load(filename,'obj','mm')
% figure(mm)

V=obj.electrostatic_model.voltage;
N=obj.N;

net_e_force=obj.electrostatic_model.comsol_EZ_model.cumFy(end)+...
    obj.electrostatic_model.comsol_EZ_model.cumFy_top(end);
net_e_force=2*net_e_force;
f_elast=2*obj.mechanical_model.bottom_plate.f_elastic(2,end);
temp_res=[N,mm,V*2,net_e_force,f_elast,f_elast+net_e_force];
res(file_ix,:)=temp_res;
end

%%
mm_set=unique(res(:,2));
Volt_sets=unique(res(:,3))/1000;
figure()
for mm_ix=1:length(mm_set)
   mm=mm_set(mm_ix)
   
   instance_legend=['Separation: ',num2str(mm),'mm'];
   
   ixs=res(:,2)==mm;
   res_t=res(ixs,:);
   [~,sort_ix]=sort(res_t(:,3));
   res_t=res_t(sort_ix,:);
   ixs=res_t(:,3)<=6000;
   res_t=res_t(ixs,:);
%    plot(res_t(:,3)/1000,res_t(:,4)+res_t(:,5),'-s','DisplayName',instance_legend)
   plot(res_t(:,3)/1000,res_t(:,5)*2,'-s','DisplayName',instance_legend)
   hold on
   drawnow()
   legend
end
%
grid on
xlabel('Voltage [KV]')
ylabel('Net force [N]')
title('Isometric test up to 6 KV')
% saveas(gcf(),'')
filename=[output_path,'e03_isometric_less_6KV.eps'];
saveas(gcf(),filename,'epsc')
%%
%%
mm_set=unique(res(:,2));
Volt_sets=unique(res(:,3))/1000;
figure()
for mm_ix=1:length(mm_set)
   mm=mm_set(mm_ix)
   
   instance_legend=['Separation: ',num2str(mm),'mm'];
   
   ixs=res(:,2)==mm;
   res_t=res(ixs,:);
   [~,sort_ix]=sort(res_t(:,3));
   res_t=res_t(sort_ix,:);
%    ixs=res_t(:,3)<=6000;
%    res_t=res_t(ixs,:);
%    plot(res_t(:,3)/1000,res_t(:,4)+f_elast,'-s','DisplayName',instance_legend)
   plot(res_t(:,3)/1000,res_t(:,5)*2,'-s','DisplayName',instance_legend)
   hold on
   drawnow()
   legend
end
%
grid on
xlabel('Voltage [KV]')
ylabel('Net force [N]')
title('Isometric test up to 12 KV')
% saveas(gcf(),'')
filename=[output_path,'e03_isometric_less_12KV.eps'];
saveas(gcf(),filename,'epsc')

%%

mm_set=unique(res(:,2));
Volt_sets=unique(res(:,3))/1000;
figure()
for Volt_ix=1:length(Volt_sets)
   v=Volt_sets(Volt_ix);
%    mm=mm_set(mm_ix)
   
   instance_legend=['Voltage: ',num2str(v),'KV'];
   
   ixs=(res(:,3)==v*1000);
   res_t=res(ixs,:);
   [~,sort_ix]=sort(res_t(:,2));
   res_t=res_t(sort_ix,:);
   
   plot(res_t(:,2),res_t(:,5)*2,'-s','DisplayName',instance_legend)
   hold on
   drawnow()
   legend
end
%
grid on
xlabel('Displacement [mm]')
ylabel('Net force [N]')
title('Isotonic test up to 12 KV')
% saveas(gcf(),'')
filename=[output_path,'e03_isotonic.eps'];
saveas(gcf(),filename,'epsc')

%%

mm_set=unique(res(:,2));
Volt_sets=unique(res(:,3))/1000;
figure()
for Volt_ix=1:length(Volt_sets)
   v=Volt_sets(Volt_ix);
%    mm=mm_set(mm_ix)
   if v>6
      continue 
   end
   instance_legend=['Voltage: ',num2str(v),'KV'];
   
   ixs=(res(:,3)==v*1000);
   res_t=res(ixs,:);
   [~,sort_ix]=sort(res_t(:,2));
   res_t=res_t(sort_ix,:);
   
   plot(res_t(:,2),res_t(:,5)*2,'-s','DisplayName',instance_legend)
   hold on
   drawnow()
   legend
end
%
grid on
xlabel('Displacement [mm]')
ylabel('Net force [N]')
title('Isotonic test up to 6 KV')
% saveas(gcf(),'')
filename=[output_path,'e03_isotonic_less_6KV.eps'];
saveas(gcf(),filename,'epsc')

%%
