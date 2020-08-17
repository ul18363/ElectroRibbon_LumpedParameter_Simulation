
dispT=T+refresh_t;
plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'b-x')
hold on
grid on
plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'r-o')
axis('equal')
     