function [Fy,Fx,arc_len_sim]=assign_distribute_forces_to_particles(obj,points,source)
% [forcey,forcex]=assign_distribute_forces_to_particles(obj,points,source)
% 
% points: The discrete set of points in which the force is distributed.
%
% source: The model from where the force is extracted prior its
% distribution either 'COMSOL' or 'PPM' (Parallel Plates Model)
%
% distribution_method: Determines how the force is distributed
%       -Sharp_accumulation_over_arc_length: 
%           The next particle takes all the force
%           accumulated since the previous one. (Not smooth, computationally
%           efficient). Disregards effects coming from curvature mismatchs.
%
%       -Sharp_accumulation_over_y: 
%           A relationship between the y position and the cumulative force
%           is drawn assuming a monotonic growth of y and the cumulative
%           force with respect to the arc length
%           (not smooth, efficient). 
%           Disregards effects coming from curvature mismatchs.
%
%       -Linear: An infinitesimal force in between two points is 
%        distributed to each proportionally to the distance to each point.
%        (Smoother) - TODO /Disregards effects from curvature mismatchs.

%%
% distribution_method='Sharp_accumulation_over_arc_length';
% distribution_method='Sharp_accumulation_over_y';
% distribution_method='Sharp_accumulation_over_y_distance_to_zipping_point';
% distribution_method='Sharp_accumulation_over_height';
distribution_method=obj.distribution_method;
% source;
% We assume that we know the force  
y_sim=points(:,2); %May represent the height or the y position
x_sim=points(:,1);
dx_sim=diff(x_sim);
dy_sim=diff(y_sim);
ds_sim=sqrt(dx_sim.^2+dy_sim.^2);

arc_len_sim=[0 ;cumsum(ds_sim)];
% Fy=zeros(size(y_sim));
% Fx=zeros(size(y_sim));
% return
% Check that y is strictly decreasing
% if any(sign(diff(y_sim))>0)
%    error('Y points are not strictly decreasing, force assignement will break.') 
% elseif any(y_sim>obj.y(1)) %Check all the y's are less or equal than 0
%     y=obj.y;%y_sim;points;
%     save('error.mat','y','y_sim','points')
%    error('A y position in the simulation exceeds top boundary.') 
% end

%%
switch source
    case 'COMSOL_bottom'
        cumFy=obj.comsol_EZ_model.cumFy;
        cumFx=obj.comsol_EZ_model.cumFx;
        arc_len=obj.comsol_EZ_model.arc_len;
        ys=obj.comsol_EZ_model.ys;
        hs=obj.comsol_EZ_model.hs;

    case 'COMSOL_top'
        cumFy=obj.comsol_EZ_model.cumFy_top;
        cumFx=obj.comsol_EZ_model.cumFx_top;
        arc_len=obj.comsol_EZ_model.arc_len_top;
        ys=obj.comsol_EZ_model.ys_top;
        hs=obj.comsol_EZ_model.hs_top;
        
        
        
    case 'COMSOL_Flange'
        cumFy=obj.comsol_flange_model.cumFy;
        cumFx=obj.comsol_flange_model.cumFx;
        arc_len=obj.comsol_flange_model.arc_len;
        ys=obj.comsol_flange_model.ys;

    case 'Analytical_bottom'   
        cumFy=obj.numerical_model.cumFy;
        cumFx=obj.numerical_model.cumFx;
        arc_len=obj.numerical_model.arc_len;
        ys=obj.numerical_model.ys;
        hs=obj.numerical_model.hs;
        
    case 'Analytical_top'   
        cumFy=obj.numerical_model.cumFy_top;
        cumFx=obj.numerical_model.cumFx_top;
        arc_len=obj.numerical_model.arc_len_top;
        ys=obj.numerical_model.ys_top;
        hs=obj.numerical_model.hs_top;
        
    otherwise
        error('When specifying the source of the Electrostatic Force an unrecognized source was specified.') 
end


switch distribution_method
    case 'Sharp_accumulation_over_arc_length'
        Fy=interp1(arc_len,cumFy,arc_len_sim,'linear','extrap');
        Fy=[Fy(1); diff(Fy)];
        Fx=interp1(arc_len,cumFx,arc_len_sim,'linear','extrap');
        Fx=[Fx(1); diff(Fx)];
        
    case 'Sharp_accumulation_over_y'
        %If necessary put something to test y monotonicity
        ts=interp1(ys,arc_len,y_sim,'linear','extrap');
        
        Fy=interp1(arc_len,cumFy,ts,'linear','extrap');
        Fy=[Fy(1); diff(Fy)];
        Fx=interp1(arc_len,cumFx,ts,'linear','extrap');
        Fx=[Fx(1); diff(Fx)];
    case 'Sharp_accumulation_over_height'
        ts=interp1(hs,arc_len,y_sim,'linear','extrap');
        Fy=interp1(arc_len,cumFy,ts,'linear','extrap');
        Fy=[Fy(1); diff(Fy)];
        Fx=interp1(arc_len,cumFx,ts,'linear','extrap');
        Fx=[Fx(1); diff(Fx)];
        
        
    case 'Sharp_accumulation_over_y_distance_to_zipping_point'
        %TODO important!
        % Get Y's zipping points from electrostatic model and current
        % simulation
        zipping_point_y_sim=y_sim(1);
        zipping_point_ys=ys(1);
        % Offset both to match the zipping points
        ys=ys-zipping_point_ys;
        y_sim=y_sim-zipping_point_y_sim;
        ts=interp1(ys,arc_len,y_sim,'linear','extrap');
        
        Fy=interp1(arc_len,cumFy,ts,'linear','extrap');
        Fy=[Fy(1); diff(Fy)];
        Fx=interp1(arc_len,cumFx,ts,'linear','extrap');
        Fx=[Fx(1); diff(Fx)];
               
    case 'Sharp_accumulation_over_x'
        %TODO?
        
        
    case 'Sharp_accumulation_over_h'
        %TODO?
        
    otherwise
        error('Force distribution method is not valid.') 
    
end

% [~,ixs]=find(y_sim>=obj.y(end));

% forcey_temp=interp1(obj.y,obj.cumFy,y_sim(ixs));
% forcey_temp=[forcey_temp(1) diff(forcey_temp)];
% Fy(ixs)=forcey_temp;
% 
% forcex_temp=interp1(obj.y,obj.cumFx,y_sim(ixs));
% forcex_temp=[forcex_temp(1) diff(forcex_temp)];
% Fx(ixs)=forcex_temp;
end