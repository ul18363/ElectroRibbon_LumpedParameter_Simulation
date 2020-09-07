

plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'b-x')
hold on
grid on
plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-x')


xlabel('x [m]')
ylabel('y [m]')
title('Deformation profile')
% plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r-o')
% axis('equal')
     