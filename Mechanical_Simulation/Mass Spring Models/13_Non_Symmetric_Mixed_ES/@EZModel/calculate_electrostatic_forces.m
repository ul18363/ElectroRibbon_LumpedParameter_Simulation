function calculate_electrostatic_forces(obj,force_source)
% calculate_electrostatic_forces(obj)
% 
%
%
%     use_cache=true;
% force_source='Manual_homogeneous_dist_force';

switch force_source
    case 'SKIP'
        f=[zeros(1,obj.N);ones(1,obj.N)]*0;
        obj.mechanical_model.bottom_plate_ext_f=f;
        obj.mechanical_model.top_plate_ext_f=-f;  
    case 'Manual_homogeneous_dist_force'
        f=[zeros(1,obj.N);ones(1,obj.N)]*obj.voltage*obj.M/obj.N;
        obj.mechanical_model.bottom_plate_ext_f=f;
        obj.mechanical_model.top_plate_ext_f=-f;  
        
    case 'Manual_concentrated_zip_force'
        f=zeros(size(obj.mechanical_model.bottom_plate.p));
        c_ix=obj.mechanical_model.contact_ix;
        f(2,c_ix+1)=obj.voltage*obj.M;
        obj.mechanical_model.bottom_plate_ext_f=f;
        obj.mechanical_model.top_plate_ext_f=-f; 
        
    case 'COMSOL'
        %%
        obj.mechanical_model.bottom_plate_ext_f=zeros([2,obj.N]);
        obj.mechanical_model.top_plate_ext_f=zeros([2,obj.N]);
        
        % Obtain contact index
        contact_ix=obj.mechanical_model.contact_ix;
        % Points to be evaluated (We assume both sheets have the same
        % amount of particles, otherwise a smarter approach to calculate the heigths needs to be implemented)
%         p_btm=obj.mechanical_model.bottom_plate.p(:,contact_ix+1:end);
%         p_top=obj.mechanical_model.top_plate.p(:,contact_ix+1:end);
%         p_btm(:,2)=p_btm(:,2)-obj.electrostatic_model.insulator_thickness;
%         p_top(:,2)=p_top(:,2)+obj.electrostatic_model.insulator_thickness;
        % The force is calculated depending on the vertical distance
        % between particles.
        heights=obj.mechanical_model.top_plate.p(2,:)-obj.mechanical_model.bottom_plate.p(2,:);
        heights=heights(contact_ix+1:end)+2*obj.ins_thickness;
        if any(heights<0)
            error('One of the heights is negative, this shouldnt happen!')
        end
        if any(diff(heights)<0)
           error('Heights are not monotonicly increasing.') 
        end
        heights=[zeros(size(heights));heights];
        
        % Retrieve forces
%         [Fy,Fx,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_btm','COMSOL_bottom');
%         [Fy_top,Fx_top,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_top','COMSOL_top');
        [Fy,Fx,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(heights','COMSOL_bottom');
        [Fy_top,Fx_top,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(heights','COMSOL_top');
       %% 
        Fy_top=-Fy_top;
        if any (isnan(Fy)|isnan(Fx)|isnan(Fx_top)|isnan(Fy_top))
            error('One of the forces returned by COMSOL is not a number')
        end
        % Assign forces to mechanical model
        obj.mechanical_model.top_plate_ext_f(:,contact_ix+1:end)=[Fx_top, Fy_top]';        
        obj.mechanical_model.bottom_plate_ext_f(:,contact_ix+1:end)=[Fx, Fy]';

    case 'Parallel Plate Model'
        obj.mechanical_model.bottom_plate_ext_f=[];
        obj.mechanical_model.top_plate_ext_f=[];
end


end