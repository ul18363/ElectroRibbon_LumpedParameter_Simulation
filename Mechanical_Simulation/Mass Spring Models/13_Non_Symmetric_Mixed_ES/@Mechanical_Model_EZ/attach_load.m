function attach_load(obj)
% Force of the load
obj.bottom_plate.dm_vec(end)=obj.bottom_plate.dm+obj.M;
end