function calculate_es_force(obj,points)
% 
%
%
%
method='No_scaling';
obj.calculate_distributed_force(points)
obj.Fy_dist;
obj.Fx_dist;
obj.xs;
obj.ys;
dx=diff(obj.xs);
dy=diff(obj.ys);
ds=sqrt(dx.^2+dy.^2);
% ds=[0;ds];
obj.ds=ds;
obj.arc_len=[0 ;cumsum(ds)];


obj.Fy=ds'.*(obj.Fy_dist(1:end-1)+obj.Fy_dist(2:end))/2;
cumFy=cumsum(obj.Fy);
obj.cumFy=[0,cumFy]';
% Fy is the net force accumulated from one point to the next one
%
% dFy=obj.Fy./ds';
% plot(obj.arc_len(2:end),dFy)

obj.Fx=ds'.*(obj.Fx_dist(1:end-1)+obj.Fx_dist(2:end))/2; %Same with x
cumFx=cumsum(obj.Fx);
obj.cumFx=[0,cumFx]';

switch method 
    case 'No_scaling'
        
    case 'Scale' %It scales the force for its numerical integration to 
        % take the same value as the value given by COMSOL
        estimated_net_Fy=obj.cumFy(end);
        real_aggregate_Fy=obj.get_interface_force()/2;
        ratio=real_aggregate_Fy/estimated_net_Fy;
        obj.cumFy=obj.cumFy*ratio;
        obj.Fy=obj.Fy*ratio;
    case 'Scale_and_add_dielectric'    % It adds the contribution of the 
        % polarization force 
    %TODO
    otherwise 
        error('Electrostatic force integration method is not valid')
end

end
