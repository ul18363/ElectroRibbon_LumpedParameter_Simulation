

elast_force_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
electr_force_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
damp_force_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
ov_force_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
a_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
v_3d=zeros([length(btm_objs),size(btm_objs{1}.f_elast,2)]);
for i =1:length(btm_objs)
    
    elast_force_3d(i,:)=btm_objs{i}.f_elast(2,:)-top_objs{i}.f_elast(2,:);
    
    electr_force_3d(i,:)=btm_objs{i}.f_electr(2,:)-top_objs{i}.f_electr(2,:);
    
    damp_force_3d(i,:)=btm_objs{i}.f_damp(2,:)-top_objs{i}.f_damp(2,:);
    
    ov_force_3d(i,:)=btm_objs{i}.f(2,:);
    ov_force_3d(i,:)=btm_objs{i}.a(2,:)*obj.mechanical_model.bottom_plate.dm;
    v_3d(i,:)=btm_objs{i}.v(2,:);
    a_3d(i,:)=btm_objs{i}.a(2,:);
end
%%
a_3d_for_plot=log10(abs(a_3d'));

ov_force_3d_for_plot=imgaussfilt(ov_force_3d',10)';
% ov_force_3d=log10(abs(ov_force_3d));
% damp_force_3d_for_plot=log10(abs(damp_force_3d'));
damp_force_3d_for_plot=imgaussfilt(damp_force_3d',10)';
% damp_force_3d=log10(abs(ov_force_3d));
% ov_force_3d=log10(abs(ov_force_3d));
% figure()
% mesh(y_perc,1:61,elast_force_3d')

% title('Force Elastic Force vs Zipping Progress')
% xlabel('Zip Progress [%]')
% ylabel('Particle Number')
% % zlabel('Force Magnitudde [N]')
% colorbar


subplot(2,3,1)
% imagesc(y_perc,1:61,ov_force_3d')
imagesc(y_perc,1:61,imgaussfilt(ov_force_3d_for_plot,0.01))
title('Net Force')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar


subplot(2,3,2)
imagesc(y_perc,1:61,electr_force_3d')
title('Electrostatic Force')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar



subplot(2,3,3)
imagesc(y_perc,1:61,damp_force_3d_for_plot)
title('Damping Force')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar


subplot(2,3,4)
imagesc(y_perc,1:61,elast_force_3d')
title('Elastic Force')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar

subplot(2,3,5)
imagesc(y_perc,1:61,v_3d')
title('Velocity [m/s]')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar


subplot(2,3,6)
imagesc(y_perc,1:61,a_3d_for_plot)
title('Acceleration [m/s2]')
xlabel('Zip Progress [%]')
ylabel('Particle Number')
colorbar
% 
% %%
% figure()
% imagesc(t,1:61,v_3d')
% title('Velocity [m/s]')
% xlabel('T [s]')
% ylabel('Particle Number')
% colorbar
% 
% %%
% figure()
% imagesc(t,1:61,a_3d_for_plot)
% title('Acceleration [m/s2]')
% xlabel('T [s]')
% ylabel('Particle Number')
% colorbar

%%
figure()
imagesc(t,1:61,electr_force_3d')
title('Electrostatic Force')
xlabel('T [s]')
ylabel('Particle Number')
colorbar

