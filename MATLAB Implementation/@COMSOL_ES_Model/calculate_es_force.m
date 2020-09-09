function calculate_es_force(obj,points_btm,points_top)
% calculate_es_force(obj,points)
% Given a set of coordinates (points) which belong to the non-zipped left
% half segment of the bottom sheet it returns for each point the arc-length
% of such point as well as the cumulative force up to them.
%
% Since COMSOL opens the possibility to validate the numerical integration
% of the force assignement three scaling methods are envisioned:
%   -'No_scaling': Return the distributed force on the interface as
%                  indicated by comsol without checking for overall
%                  force in the interface coherence
%   -'Scale': Return the distributed force scaling to compensate any
%             deviation from the overall force during the discretization
%   -'Scale_and_add_dielectric': The dielectric suffers a volume force
%       which at 6KV adds up to a 10% of the overall force.
%       The challenge to include this force is to identify this force over
%       the non-zipped region.

method='No_scaling';

%% Calculate Heights between points
obj.xs=points_btm(:,1);
obj.ys=points_btm(:,2);
obj.xs_top=points_top(:,1);
obj.ys_top=points_top(:,2);

y_top_interp=interp1(obj.xs_top,obj.ys_top,obj.xs,'linear','extrap');
y_btm_interp=interp1(obj.xs,obj.ys,obj.xs_top,'linear','extrap');

obj.hs=y_top_interp-obj.ys;
obj.hs_top=obj.ys_top-y_btm_interp;

obj.calculate_distributed_force(points_btm,'bottom');
obj.calculate_distributed_force(points_top,'top');
%%
targets={'bottom','top'};
for target_ix =1:length(targets)
    target=targets{target_ix};
    %% Define inputs of algorithm
    switch target
        case 'bottom'
            xs=obj.xs;
            ys=obj.ys;
            Fy_dist=obj.Fy_dist;
            Fx_dist=obj.Fx_dist;
            
            
        case 'top'
            xs=obj.xs_top;
            ys=obj.ys_top;
            Fy_dist=obj.Fy_dist_top;
            Fx_dist=obj.Fx_dist_top;
    end
    %% Algorithm
    
    dx=diff(xs);
    dy=diff(ys);
    ds=sqrt(dx.^2+dy.^2);
    arc_len=[0 ;cumsum(ds)];
    avg_Fy=(Fy_dist(1:end-1)+Fy_dist(2:end))/2;
    Fy=ds.*avg_Fy;
    cumFy=cumsum(Fy);
    cumFy=[0; cumFy];
    % Fy is the net force accumulated from one point to the next one
    %
    % dFy=obj.Fy./ds';
    % plot(obj.arc_len(2:end),dFy)
    avg_Fx=(Fx_dist(1:end-1)+Fx_dist(2:end))/2;
    Fx=ds.*avg_Fx; %Same with x
    cumFx=cumsum(Fx);
    cumFx=[0;cumFx];
    
    
    switch method
        case 'No_scaling'
            
        case 'Scale' %It scales the force for its numerical integration to
            % take the same value as the value given by COMSOL
            estimated_net_Fy=obj.cumFy(end);
            real_aggregate_Fy=obj.get_interface_force()/2;
            ratio=real_aggregate_Fy/estimated_net_Fy;
            obj.cumFy=cumFy*ratio;
            obj.Fy=Fy*ratio;
        case 'Scale_and_add_dielectric'    % It adds the contribution of the
            % polarization force
            %TODO
        otherwise
            error('Electrostatic force integration method is not valid')
    end
    
    
    %% Define outputs of algorithm
    
    switch target
        case 'bottom'
            obj.ds=ds;
            obj.arc_len=arc_len;
            obj.Fy=Fy;
            obj.Fx=Fx;
            obj.cumFy=cumFy;
            obj.cumFx=cumFx;
        case 'top'
            obj.ds_top=ds;
            obj.arc_len_top=arc_len;
            obj.Fy_top=Fy;
            obj.Fx_top=Fx;
            obj.cumFy_top=cumFy;
            obj.cumFx_top=cumFx;
    end
end


end
