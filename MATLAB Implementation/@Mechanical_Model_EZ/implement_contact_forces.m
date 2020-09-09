function implement_contact_forces(obj)
% Modifies the forces such that the acceleration over a set of indexes 
% is the same for both plates

%         bottom_plate
%         top_plate
ixs=1:obj.contact_ix;

% We assume the mass is the same for each plate, otherwise some further 
% weigthting needs to be done.
obj.top_plate.f(:,ixs)=(obj.top_plate.f(:,ixs)+obj.bottom_plate.f(:,ixs))/2;
obj.bottom_plate.f(:,ixs)=obj.top_plate.f(:,ixs);
% If by any chance the plates were different we need to equate
% the accelerations of the ends
% f_e=f1_ne+f2_ne->f1_e=f_e*m1/(m1+m2);f2_e=f_e*m2/(m1+m2);
end