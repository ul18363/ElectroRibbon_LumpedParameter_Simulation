function net_f=overall_force(obj,option)
% Determines the overall force of the actuator
% All the forces over the chain needs to be calculated previous to perform
% the timestep

t_plate=obj.mechanical_model.top_plate;
b_plate=obj.mechanical_model.bottom_plate;

% Top Plate Forces
switch option
    case 'all'
        top_f=t_plate.f;
        top_f=top_f.*t_plate.f_mask;
        
        btm_f=b_plate.f;
        btm_f=btm_f.*b_plate.f_mask;
        
    case 'Disregard_drag'
        top_f=t_plate.f-t_plate.f_damping;
        top_f=top_f.*t_plate.f_mask;
        
        btm_f=b_plate.f-b_plate.f_damping;
        btm_f=btm_f.*b_plate.f_mask;
        
    case 'Disregard_drag_and_load'
        net_f=obj.overall_force('Disregard_drag')+obj.M*9.81;
        return
        
    case 'Consider_fixed_points'
        top_f=t_plate.f;
end

net_f=(sum(top_f,2)+sum(btm_f,2));
net_f=net_f(2)*2;


end