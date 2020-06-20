function plot_local_frames(obj)
figure 
scale_factor=0.2;
subplot(2,1,1) % Left To Tight Frame
plot(obj.p(1,:),obj.p(2,:),'b--x')
hold on
% quiver(obj.p(1,1:end-1),obj.p(2,1:end-1),obj.local_frame_x_ltr(1,:),obj.local_frame_x_ltr(2,:));%,'AutoScaleFactor',obj.dl/2)
% quiver(obj.p(1,1:end-1),obj.p(2,1:end-1),obj.local_frame_y_ltr(1,:),obj.local_frame_y_ltr(2,:));%,'AutoScaleFactor',obj.dl/2)
quiver(obj.p(1,1:end-1),obj.p(2,1:end-1),obj.local_frame_x_ltr(1,:),obj.local_frame_x_ltr(2,:),'AutoScaleFactor',scale_factor)
quiver(obj.p(1,1:end-1),obj.p(2,1:end-1),obj.local_frame_y_ltr(1,:),obj.local_frame_y_ltr(2,:),'AutoScaleFactor',scale_factor)
grid on
axis 'equal'
title('Left To Right Frames')

subplot(2,1,2) % Left To Tight Frame
plot(obj.p(1,:),obj.p(2,:),'b--x')
hold on
% quiver(obj.p(1,2:end),obj.p(2,2:end),obj.local_frame_x_rtl(1,:),obj.local_frame_x_rtl(2,:));%,'AutoScaleFactor',obj.dl/2)
% quiver(obj.p(1,2:end),obj.p(2,2:end),obj.local_frame_y_rtl(1,:),obj.local_frame_y_rtl(2,:));%,'AutoScaleFactor',obj.dl/2)
quiver(obj.p(1,2:end),obj.p(2,2:end),obj.local_frame_x_rtl(1,:),obj.local_frame_x_rtl(2,:),'AutoScaleFactor',scale_factor)
quiver(obj.p(1,2:end),obj.p(2,2:end),obj.local_frame_y_rtl(1,:),obj.local_frame_y_rtl(2,:),'AutoScaleFactor',scale_factor)
grid on
axis 'equal'
title('Right To Left Frames')
