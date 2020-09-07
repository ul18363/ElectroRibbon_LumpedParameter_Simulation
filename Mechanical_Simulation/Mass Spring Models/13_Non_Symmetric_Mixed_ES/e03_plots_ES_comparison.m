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
files=files';
res=[];

% scale_factor=6.03;
scale_factor=6.03;
scale_by_rel_eps=6.67;
for file_ix=1:n_files
%%
% file_ix=1;

filename=files{file_ix};
load(filename,'obj','mm')
% figure(mm)



heights=obj.electrostatic_model.comsol_EZ_model.hs;
xs=obj.electrostatic_model.comsol_EZ_model.xs;
Fy_dist=obj.electrostatic_model.comsol_EZ_model.Fy_dist;

initial_points=[xs';heights'];
obj.electrostatic_model.add_analytical_model(initial_points')
xs_num=obj.electrostatic_model.numerical_model.xs;
Fy_dist_num=obj.electrostatic_model.numerical_model.Fy_dist;

n_Fy=4*obj.electrostatic_model.numerical_model.cumFy(end);
v=obj.voltage*2/1000;
comsol_Fy=4*obj.electrostatic_model.comsol_EZ_model.cumFy(end);
res_t=[mm,v,comsol_Fy,n_Fy,n_Fy*scale_factor,n_Fy*scale_by_rel_eps];
res(file_ix,:)=res_t;


figure ()
instance_legend=['d: ',num2str(mm),'mm | V: ',num2str(v),'KV'];
plot(xs_num-xs_num(1),Fy_dist_num,'DisplayName',['PP | ',instance_legend])
hold on 
grid on
plot(xs-xs(1),Fy_dist,'DisplayName',['FE | ',instance_legend])
plot(xs_num-xs_num(1),Fy_dist_num*scale_factor,'DisplayName',['PP-Scaled | ',instance_legend])
plot(xs_num-xs_num(1),Fy_dist_num*scale_by_rel_eps,'DisplayName',['PP-Scaled by ',char(949),' | ',instance_legend])
xlabel('Distance to the zipping point [m]')
ylabel('Distributed Force [N/m]')
legend()
title('Comparison of Electrostatic Forces')
export_folder='e03_figures/';
format='%03.f';
output_filename=[export_folder,'e03_comparison_scaled_EF_',num2str(mm,format),'mm_',num2str(v,format),'KV'];
saveas(gcf(),output_filename,'epsc')


end
%%
