link=N;
p=obj.plate.p(:,link);
if link==1
    f_axial_ltr_active=obj.plate.o;
    f_trans_ltr_active=obj.plate.o;
    f_axial_rtl_reactive=obj.plate.o;
    f_trans_rtl_reactive=obj.plate.o;
    
else
    f_axial_ltr_active=obj.plate.f_axial_ltr(:,link-1);
    f_trans_ltr_active=obj.plate.f_trans_ltr(:,link-1);
    
    f_axial_rtl_reactive=-obj.plate.f_axial_rtl(:,link-1);
    f_trans_rtl_reactive=-obj.plate.f_trans_rtl(:,link-1);
    
end

if link==N
    f_axial_rtl_active=obj.plate.o;
    f_trans_rtl_active=obj.plate.o;
    f_axial_ltr_reactive=obj.plate.o;
    f_trans_ltr_reactive=obj.plate.o;

    f_external=obj.M*obj.g;
    
else
    f_axial_rtl_active=obj.plate.f_axial_rtl(:,link);
    f_trans_rtl_active=obj.plate.f_trans_rtl(:,link);
    
    f_external=obj.plate.o;
    f_axial_ltr_reactive=-obj.plate.f_axial_ltr(:,link);
    f_trans_ltr_reactive=-obj.plate.f_trans_ltr(:,link);
end
f_gravity=obj.plate.f_gravity(:,link);
%% Legends
%close all
legends={'f axial ltr active','f trans ltr active','f axial rtl reactive','f trans rtl reactive','f axial rtl active','f trans rtl active','f axial ltr reactive','f trans ltr reactive','f external','f gravity'};

vecs=[f_axial_ltr_active,f_trans_ltr_active,f_axial_rtl_reactive,f_trans_rtl_reactive,f_axial_rtl_active,f_trans_rtl_active,f_axial_ltr_reactive,f_trans_ltr_reactive,f_external,f_gravity];
mags=[1 1]*vecs.^2;
vecs_ne=vecs(:,mags~=0);
legends_ne=legends(mags~=0);
%% Plot geometry
x_max=0.1;
plot(obj.real_x_tp,obj.real_y_tp,'rx')
hold on
plot(obj.plate.p(1,:),(obj.plate.p(2,:)),'b.')
title(['model t:',num2str(i)])
xlabel('x [mm]')
ylabel('y [mm]')
leg_basic ={'real geometry' 'aproximation'};
% Plot forces
for fi=1:length(vecs_ne)
quiver(p(1),p(2),vecs_ne(1,fi),vecs_ne(2,fi),'AutoScaleFactor',0.01);
end
legend([leg_basic legends_ne])

quiver(obj.plate.p(1,N-1),obj.plate.p(2,N-1),obj.plate.dp(1,N-1),obj.plate.dp(2,N-1),'AutoScale','off')
axis 'equal'
