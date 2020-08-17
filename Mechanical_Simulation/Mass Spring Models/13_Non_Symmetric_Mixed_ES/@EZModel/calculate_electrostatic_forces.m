function calculate_electrostatic_forces(obj,force_source)
% calculate_electrostatic_forces(obj)
% 
%
%
%     use_cache=true;
% force_source='Manual_homogeneous_dist_force';

switch force_source
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
        obj.mechanical_model.bottom_plate_ext_f=zeros([2,obj.N]);
        obj.mechanical_model.top_plate_ext_f=zeros([2,obj.N]);
        
        % Obtain contact index
        contact_ix=obj.mechanical_model.contact_ix;
        % Points to be evaluated
        p_btm=obj.mechanical_model.bottom_plate.p(:,contact_ix:end);
        p_top=obj.mechanical_model.top_plate.p(:,contact_ix:end);
        % Retrieve forces
        [Fy,Fx,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_btm','COMSOL_bottom');
        [Fy_top,Fx_top,~]=obj.electrostatic_model.assign_distribute_forces_to_particles(p_top','COMSOL_top');
        Fy_top=-Fy_top;
        if any (isnan(Fy)|isnan(Fx)|isnan(Fx_top)|isnan(Fy_top))
            error('One of the forces returned by COMSOL is not a number')
            
        end
        % Assign forces to mechanical model
        obj.mechanical_model.top_plate_ext_f(:,contact_ix:end)=[Fy_top, Fx_top]';        
        obj.mechanical_model.bottom_plate_ext_f(:,contact_ix:end)=[Fy, Fx]';

    case 'Parallel Plate Model'
        obj.mechanical_model.bottom_plate_ext_f=[];
        obj.mechanical_model.top_plate_ext_f=[];
end


end