function attach_load(obj)
% Force of the load
obj.plate.dm_vec(end)=obj.plate.dm+obj.M;
end