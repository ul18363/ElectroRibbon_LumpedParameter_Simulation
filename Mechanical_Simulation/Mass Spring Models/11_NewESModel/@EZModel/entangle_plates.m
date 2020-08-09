function entangle_plates(obj)
f=(obj.top_plate.f(:,1)+obj.bottom_plate.f(:,1))/2;
obj.top_plate.f(:,1)=f;
obj.bottom_plate.f(:,1)=f; % Both ends have equal force and masses thus equal acc,vel & pos
% If by any chance the plates were different we need to equate
% the accelerations of the ends
% f_e=f1_ne+f2_ne->f1_e=f_e*m1/(m1+m2);f2_e=f_e*m2/(m1+m2);
end