ps_mag{length(ps)}=[];
for i=1:length(fs)
%    plot(ps{1}(1,:),ps{1}(2,:)) 
%    hold on
ps_mag{i}=sqrt(sum(ps{i}.^2));
vs_mag{i}=sqrt(sum(vs{i}.^2));
vs_phase{i}=atan2d(vs{i}(2,:),vs{i}(1,:));
end

[ps_mag_mat,~]=mag_and_phase_mats_from_cell(ps);

vs_mag_mat=reshape(cell2mat(vs_mag),[21,length(vs_mag)])';
vs_pha_mat=reshape(cell2mat(vs_phase),[21,length(vs_phase)])';
v_pha_bounce=diff(vs_pha_mat,1,1);
v_bounce_flag= abs(v_pha_bounce)>175; %If the change of direction in velocity is bigger than 175 degrees then it has probably bounced
%%
%% DpDt
dp_dt=cell_diff(ps);
[dp_dt_mag_mat,dp_dt_phase_mat]=mag_and_phase_mats_from_cell(dp_dt);
dp_dt_phase_change=diff(dp_dt_phase_mat,1,1);
%%
%[mag_local_y_def_ltr_mat,phase_local_y_def_ltr]=mag_and_phase_mats_from_cell(local_y_def_ltr_s);
local_y_def_ltr_mat=reshape(cell2mat(local_y_def_ltr_s),[size(local_y_def_ltr_s{1},2),length(local_y_def_ltr_s)])';
local_y_def_rtl_mat=reshape(cell2mat(local_y_def_rtl_s),[size(local_y_def_rtl_s{1},2),length(local_y_def_rtl_s)])';

%%
figure
for i=1:length(fs)
   %plot(log10(ps_mag{i}))
   plot(vs_mag{i}) 
   hold on
end
grid on
%%
% 
% figure
% for i=1:length(fs)
%    plot(ps{i}(1,:),ps{i}(2,:),'r-x') 
%    hold on
% end
% grid on
