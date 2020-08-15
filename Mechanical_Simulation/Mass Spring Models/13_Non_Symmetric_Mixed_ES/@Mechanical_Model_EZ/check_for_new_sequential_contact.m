function [new_contact_flag,contact_dt]=check_for_new_sequential_contact(obj,contact_definition)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep

%Check for contact indexes


last_contact_ix=obj.contact_ix;
ix_to_check=last_contact_ix+1;
% contact_definition='';

new_contact_flag=false;
contact_dt=[];

switch contact_definition
    case 'Vertical overpass'
        % We consider contact if the bottom particle overpass the top particle
        % vertical position. Hopefully we won't have to go deeper than this
        % However if the position in x doen't match some disturbances in the
        % force may be observed, however for highly non-strechable materials
        % this shouldn't be a big concern

        y_btm=obj.bottom_plate.p(2,ix_to_check);
        y_top=obj.top_plate.p(2,ix_to_check);
        if y_btm>= y_top
            new_contact_flag=true;
            y_btm_prev=obj.bottom_plate.p_bu(2,ix_to_check);
            y_top_prev=obj.top_plate.p_bu(2,ix_to_check);
%             
%             vy_top=obj.top_plate.v_bu(2,ix_to_check);
%             vy_btm=obj.bottom_plate.v_bu(2,ix_to_check);
            vy_top=obj.top_plate.v(2,ix_to_check);
            vy_btm=obj.bottom_plate.v(2,ix_to_check);
            net_d=y_top_prev-y_btm_prev;
            net_v=vy_btm-vy_top;
            % Find dt such that y positions match:
            % y_collision=y_btm_prev+dt*vy_btm=y_top_prev+dt*vy_top;
            %  y_btm_prev-y_top_prev =dt(vy_btm-vy_top)
            contact_dt= net_d/net_v;
            % dy_btm=y_btm-y_btm_prev;
            % dy_top=y_top-y_top_prev;
            % obj.contact_ix=obj.contact_ix+1;
            
            
        end
        
    case 'Spatial vecinity'
        
    case 'Colinearity overpass'
end


end