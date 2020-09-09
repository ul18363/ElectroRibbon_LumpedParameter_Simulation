function attach_load(obj)
% Adds an additional mass to the midpoint of the bottom plate.
%
% Remember that the model simulates half the actuator thus the added mass 
% is the load over 2. And that the attachment point is the end of the sheet.

obj.bottom_plate.dm_vec(end)=obj.bottom_plate.dm+obj.M/2;
end