function success_flag=perform_timestep(obj,dt,source_of_es)
% Update acceleration, velocities and position
% All the forces over the chain needs to be calculated previous to perform
% the timestep
% 1. Calculate Mechanical Forces
obj.mechanical_model.calculate_all_forces()
% 2. Calculate Electrostatic Forces & Communicate them to the mechanical model

%     obj.calculate_electrostatic_forces('Manual_homogeneous_dist_force')
% obj.calculate_electrostatic_forces('Manual_concentrated_zip_force')
% obj.calculate_electrostatic_forces('COMSOL')
if obj.voltage>0
    obj.calculate_electrostatic_forces(source_of_es)
else
    obj.mechanical_model.bottom_plate_ext_f=obj.mechanical_model.bottom_plate.p*0;
    obj.mechanical_model.top_plate_ext_f=obj.mechanical_model.top_plate.p*0;
end
if obj.voltage==0
    % This is not strictly correct however is easier than implementing a
    % thorough contact model
    obj.mechanical_model.contact_ix=1;
end
%     'Manual_concentrated_zip_force'

% 3. Advance over timestep (if successful)
obj.mechanical_model.implement_contact_forces()
success_flag=obj.mechanical_model.perform_timestep(dt);
% 4. Check for contact
[contact_flag,contact_dt]=obj.mechanical_model.check_for_new_sequential_contact('Vertical overpass');
%  If contact and voltage are on.
if contact_flag && (obj.voltage>0)
    new_contact_ix=obj.mechanical_model.contact_ix+1;
    disp(['Contact at: ',num2str(new_contact_ix),'| dt:',...
        num2str(dt),'| dt_contact:',num2str(contact_dt)])
    
    
    % 5.1 - Go Back
    obj.mechanical_model.restore_backup()
    % 5.2 - Advance time until contact time
    if contact_dt>dt || contact_dt<0
        error('Something went wrong with the contact time, it should be positive and less than overall interval')
    end
    success_flag=obj.mechanical_model.perform_timestep(contact_dt);
    if ~success_flag
        error('When using contact time it failed, this is unexpected!')
    end
    % 5.3 - Increase point contact index
    obj.mechanical_model.contact_ix=obj.mechanical_model.contact_ix+1;
    obj.mechanical_model.entangle_plates();
    
    % 5.4 - Update Electrostatic Model
    if isequal(source_of_es,'COMSOL')
        obj.update_ES_model('COMSOL')
    end
    %     obj.electrostatic_model.assign_distribute_forces_to_particles(obj.mechanical_model.bottom_plate.p','COMSOL')
    % 5.5 - Perform Timestep with what remains of time original timestep
    remaining_dt=dt-contact_dt;
    % If succeeds keeps returns true, if fails returns false but it has a
    success_flag=obj.perform_timestep(remaining_dt,source_of_es);
    
    
end
% Calculate timestep in which contact is made

% Perform such timestep

% Perform remaining with new configuration

% in timestep & update electrostatic models!
%

end