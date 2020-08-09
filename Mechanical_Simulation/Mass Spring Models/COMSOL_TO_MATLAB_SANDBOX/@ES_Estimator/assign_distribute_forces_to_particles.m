function [forcey,forcex,arc_len_sim]=assign_distribute_forces_to_particles(obj,points,source)
% [forcey,forcex]=assign_distribute_forces_to_particles(obj,points,source)
% 
% points: The discrete set of points in which the force is distributed.
%
% source: The model from where the force is extracted prior its
% distribution either 'COMSOL' or 'PPM' (Parallel Plates Model)
%
% distribution_method: Determines how the force is distributed
%       -Sharp_accumulation: The next particle takes all the force
%       accumulated since the previous one. (Not smooth, computationally
%       efficient). Disregards effects coming from curvature mismatchs.
%
%       -Linear: An infinitesimal force in between two points is 
%        distributed to each proportionally to the distance to each point.
%        (Smoother) - TODO /Disregards effects from curvature mismatchs.


distribution_method='Sharp_accumulation';
source;
% We assume that we know the force  
y_sim=points(2,:);
x_sim=points(1,:);
dx_sim=diff(x_sim);
dy_sim=diff(x_sim);

arc_len_sim=sqrt(dx_sim.^2+dy_sim.^2)
arc_len_sim=[0 arc_len_sim]
forcey=zeros(size(y_sim));
forcex=zeros(size(y_sim));
return
% Check that y is strictly decreasing
if any(sign(diff(y_sim))>0)
   error('Y points are not strictly decreasing, force assignement will break.') 
elseif any(y_sim>obj.y(1)) %Check all the y's are less or equal than 0
    y=obj.y;%y_sim;points;
    save('error.mat','y','y_sim','points')
   error('A y position in the simulation exceeds top boundary.') 
end


switch source
    case 'COMSOL'
        cumFy=obj.comsol_model.cumFy;
        arc_len=obj.comsol_model.arc_len;
        
        ys=obj.comsol_model.ys;
        forcey_temp=interp1(obj.y,cumFy,y_sim(ixs));
        forcey_temp=[forcey_temp(1) diff(forcey_temp)];
        forcey(ixs)=forcey_temp;
        forcex_temp=interp1(obj.y,obj.cumFx,y_sim(ixs));
        forcex_temp=[forcex_temp(1) diff(forcex_temp)];
        forcex(ixs)=forcex_temp;
    case 'PPM'   
        cumFy=obj.numerical_model.cumFy;
        
        forcey_temp=interp1(obj.y,obj.cumFy,y_sim(ixs));
        forcey_temp=[forcey_temp(1) diff(forcey_temp)];
        forcey(ixs)=forcey_temp;
        forcex_temp=interp1(obj.y,obj.cumFx,y_sim(ixs));
        forcex_temp=[forcex_temp(1) diff(forcex_temp)];
        forcex(ixs)=forcex_temp;
    otherwise
        error('When specifying the source of the Electrostatic Force an unrecognized source was specified.') 
end
[~,ixs]=find(y_sim>=obj.y(end));

% forcey_temp=interp1(obj.y,obj.cumFy,y_sim(ixs));
% forcey_temp=[forcey_temp(1) diff(forcey_temp)];
forcey(ixs)=forcey_temp;

forcex_temp=interp1(obj.y,obj.cumFx,y_sim(ixs));
forcex_temp=[forcex_temp(1) diff(forcex_temp)];
forcex(ixs)=forcex_temp;
end