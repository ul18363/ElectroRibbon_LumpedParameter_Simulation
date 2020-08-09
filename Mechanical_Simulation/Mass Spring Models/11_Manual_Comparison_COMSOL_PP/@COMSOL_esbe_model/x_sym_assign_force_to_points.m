function [forcey,forcex]=x_sym_assign_force_to_points(obj,points)
% We assume that we know the force  
y_sim=points(2,:);
forcey=zeros(size(y_sim));
forcex=zeros(size(y_sim));

% Check that y is strictly decreasing
if any(sign(diff(y_sim))>0)
   error('Y points are not strictly decreasing, force assignement will break.') 
elseif any(y_sim>obj.y(1)) %Check all the y's are less or equal than 0
    y=obj.y;y_sim;points;
    save('error.mat','y','y_sim','points')
   error('A y position in the simulation exceeds top boundary.') 
end
[~,ixs]=find(y_sim>=obj.y(end));

forcey_temp=interp1(obj.y,obj.cumFy,y_sim(ixs));
forcey_temp=[forcey_temp(1) diff(forcey_temp)];
forcey(ixs)=forcey_temp;

forcex_temp=interp1(obj.y,obj.cumFx,y_sim(ixs));
forcex_temp=[forcex_temp(1) diff(forcex_temp)];
forcex(ixs)=forcex_temp;
end