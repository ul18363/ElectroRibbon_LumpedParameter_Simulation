function entangle_plates(obj,ixs)
% Modifies the forces such that the acceleration over a set of indexes 
% is the same for both plates

%         bottom_plate
%         top_plate

f=(obj.top_plate.f(:,ixs)+obj.bottom_plate.f(:,ixs))/2;
obj.top_plate.f(:,ixs)=f;
obj.bottom_plate.f(:,ixs)=f; % Both ends have equal force and masses thus equal acc,vel & pos

% If by any chance the plates were different we need to equate
% the accelerations of the ends
% f_e=f1_ne+f2_ne->f1_e=f_e*m1/(m1+m2);f2_e=f_e*m2/(m1+m2);
end