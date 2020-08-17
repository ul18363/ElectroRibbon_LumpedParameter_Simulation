cont_ix=obj.mechanical_model.contact_ix;
z_p=obj.mechanical_model.bottom_plate.p(2,cont_ix);
ixs=cont_ix:cont_ix+3;
dispT=T+refresh_t;
plot(obj.mechanical_model.bottom_plate.p(1,ixs),obj.mechanical_model.bottom_plate.p(2,ixs)-z_p,'b-x')
hold on
grid on
plot(obj.mechanical_model.top_plate.p(1,ixs),obj.mechanical_model.top_plate.p(2,ixs)-z_p,'r-o')
