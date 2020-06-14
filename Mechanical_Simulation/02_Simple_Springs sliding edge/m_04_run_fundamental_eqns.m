

f_damping=scale_up(-v,sqrt(sum(v.^2)))*damp_factor;

f=f_elastic+f_damping+f_gravity;
f(2,[1,end])=[0 0]; %Fixed ends y position (let them move in x)
a=f/dm;
v=v+a*dt_st;
p=p+v*dt_st;
