subplot(2,2,1)


axs=gca();
old_axs_s=[axs.XLim,axs.YLim];

% axs_s=max(old_axs_s,[0,max(x_data),0,max(res.net_felec)]);
% 
% min_y=obj.mechanical_model.bottom_plate.p(2,end);
 min_y=min(obj.mechanical_model.bottom_plate.p(2,end));
 
 max_y= max(obj.mechanical_model.top_plate.p(2,:));
 max_x=max(obj.mechanical_model.bottom_plate.p(1,:));
 min_x=min(obj.mechanical_model.bottom_plate.p(1,:));
 
axs_s= [ min(old_axs_s(1),min_x),...
         max_x,...
         min(old_axs_s(3),min_y),...
         max_y];
            



hold off
plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r-s')
hold on
plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'b-s')
xlabel('Position')
%         plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'r-x')
%         hold on
%         grid on
%         plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-o')
%         axis('equal')
%         net_f_top=sum(obj.mechanical_model.top_plate.f,2);
%         net_f_btm=sum(obj.mechanical_model.bottom_plate.f,2);
%         %         disp([num2str(T),': Fy_btm[',num2str(net_f_btm(2)),'] Fy_top[',num2str(net_f_top(2)),']'])
axis(axs_s)
grid on
subplot(2,2,2)
hold off
if false
    %         plot(obj.mechanical_model.top_plate.f(2,:),'r')
    
    
    
    
    plot(obj.mechanical_model.top_plate.f(2,:),'r-s')
    hold on
    %         plot(obj.mechanical_model.bottom_plate.f(2,:),'b')
    plot(obj.mechanical_model.bottom_plate.f(2,:),'b-s')
end
if false
    plot(obj.mechanical_model.top_plate.f_internal_damping(2,:),'r-x')
    hold on
    plot(obj.mechanical_model.bottom_plate.f_internal_damping(2,:),'b-x')
end
if true
    plot(obj.mechanical_model.top_plate.f_damping(2,:),'r-o')
    hold on
    plot(obj.mechanical_model.bottom_plate.f_damping(2,:),'b-o')
end
if true
    plot(obj.mechanical_model.top_plate.f_gravity(2,:),'r-v')
    hold on
    plot(obj.mechanical_model.bottom_plate.f_gravity(2,:),'b-v')
end
if true
    plot(obj.mechanical_model.top_plate.f_elastic(2,:),'r-v')
    hold on
    plot(obj.mechanical_model.bottom_plate.f_elastic(2,:),'b-v')
end
if ~isempty(obj.mechanical_model.top_plate_ext_f)
    plot(obj.mechanical_model.top_plate_ext_f(2,:),'r-x')
    hold on
    plot(obj.mechanical_model.bottom_plate_ext_f(2,:),'b-x')
end
xlabel('Forces')

subplot(2,2,3)
hold off
plot(obj.mechanical_model.top_plate.a(2,:),'r--x')
hold on
plot(obj.mechanical_model.bottom_plate.a(2,:),'b--x')
% plot(filt_a_top,'r--o')
% hold on
% plot(filt_a_btm,'b--o')
xlabel('Acceleration')

subplot(2,2,4)
hold off
plot(obj.mechanical_model.top_plate.v(2,:),'r--x')
hold on
plot(obj.mechanical_model.bottom_plate.v(2,:),'b--x')
% plot(filt_v_top,'r--o')
% plot(filt_v_btm,'b--o')

xlabel('Velocity')
sgtitle(['Analysis at T:', num2str(T),' s'])
