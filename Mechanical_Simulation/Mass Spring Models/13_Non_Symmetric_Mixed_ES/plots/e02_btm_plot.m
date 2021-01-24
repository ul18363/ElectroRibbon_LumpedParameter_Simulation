

initial_x=obj.mechanical_model.bottom_plate.p(1,1);
initial_y=obj.mechanical_model.bottom_plate.p(2,1);

figure(1)
hold off

plot(obj.mechanical_model.bottom_plate.p(1,:)-initial_x,obj.mechanical_model.bottom_plate.p(2,:)-initial_y,'b-x')

hold on
grid on

xlabel('x [m]')
ylabel('y [m]')
title('Deformation profile')