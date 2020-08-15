function entangle_plates(obj)
% After contact is made it joins the masses toghether as one.

ixs=1:obj.contact_ix;

obj.top_plate.p(:,ixs)=(obj.top_plate.p(:,ixs)+obj.bottom_plate.p(:,ixs))/2;
obj.bottom_plate.p(:,ixs)=obj.top_plate.p(:,ixs);

obj.top_plate.v(:,ixs)=(obj.top_plate.v(:,ixs)+obj.bottom_plate.v(:,ixs))/2;
obj.bottom_plate.v(:,ixs)=obj.top_plate.v(:,ixs);

obj.top_plate.a(:,ixs)=(obj.top_plate.a(:,ixs)+obj.bottom_plate.a(:,ixs))/2;
obj.bottom_plate.a(:,ixs)=obj.top_plate.a(:,ixs);

obj.top_plate.f(:,ixs)=(obj.top_plate.f(:,ixs)+obj.bottom_plate.f(:,ixs))/2;
obj.bottom_plate.f(:,ixs)=obj.top_plate.f(:,ixs);



end