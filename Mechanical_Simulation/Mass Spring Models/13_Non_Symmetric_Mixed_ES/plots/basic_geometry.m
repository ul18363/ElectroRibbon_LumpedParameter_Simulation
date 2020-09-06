

initial_x=obj.mechanical_model.top_plate.p(1,1);
initial_y=obj.mechanical_model.top_plate.p(2,1);
figure(1)
hold off

% plot(obj.mechanical_model.bottom_plate.p(1,:)-initial_x,obj.mechanical_model.bottom_plate.p(2,:)-initial_y,'b-x')
plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'b-x')

hold on
grid on

plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'b-x')

ref_init_x= com_mech.real_p_tp(1,1);
ref_init_y= com_mech.real_p_tp(2,1);
ref_final_y= com_mech.real_p_tp(2,end);

displacement=0.004;

displacement=0;

plot(com_mech.real_p_tp(1,:)-ref_init_x+displacement,com_mech.real_p_tp(2,:)-ref_init_y+ref_final_y,'r--o')
plot(com_mech.real_p_tp(1,:)-ref_init_x+displacement,-com_mech.real_p_tp(2,:)-ref_init_y+ref_final_y,'r--o')

xlabel('x [m]')
ylabel('y [m]')
title('Deformation profile')
% plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r-o')
% axis('equal')
     