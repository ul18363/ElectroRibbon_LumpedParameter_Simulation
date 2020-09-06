

initial_x=obj.mechanical_model.top_plate.p(1,1);
initial_y=obj.mechanical_model.top_plate.p(2,1);

plot(obj.mechanical_model.bottom_plate.p(1,:)-initial_x,obj.mechanical_model.bottom_plate.p(2,:)-initial_y,'b-x')
hold on
grid on

ref_init_x= com_mech.real_p_tp(1,1);
ref_init_y= com_mech.real_p_tp(2,1);

plot(com_mech.real_p_tp(1,:)-ref_init_x,com_mech.real_p_tp(2,:)-ref_init_y,'r--o')
xlabel('x [m]')
ylabel('y [m]')
title('Deformation profile')
% plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r-o')
axis('equal')
     