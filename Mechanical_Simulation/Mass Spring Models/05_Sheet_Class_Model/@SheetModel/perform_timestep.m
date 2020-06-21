function perform_timestep(obj)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
    obj.a=obj.f/obj.dm;
    obj.v=obj.v+obj.a*obj.dt_st;
    obj.p=obj.p+obj.v*obj.dt_st;
end