%% Estimate difference in positions
function calculate_elastic_forces(obj)
%obj.direct_force_type=1; % Type 0: Direct forces in the direction of local_x (1 per way)
% Type 1: Direct forces in the direction of dp (way is shared)
%obj.shear_force_type=0; % Type 0: Elastic Coefficient is independent of ltr or rtl
% Type 1: Elastic coefficient depends on ltr or rtl

%% Compute Local Geomtry and deformations
% Calculate Local Frames of reference
obj.calculate_local_frames(); % Generate local frames and compute deformations
% Calculate Deformation in such axis
obj.calculate_local_deformations();
%  Calculate the angles between elements (May affect shear coefficients)
obj.compute_local_angles();

%% Estimate Elastic Coefficients
obj.compute_elastic_coefficients();
% Calculate elastic Forces

%% Compute Forces

%% Forces from i->ii / Left To Right (ltr)
% Direct Forces from i->ii
if isequal(obj.axial_force_local_direction,'relative x direction')
    % Option 0-> Force in the reltative (ltr) X direction
    obj.f_axial_ltr=-obj.scale_up(obj.local_frame_x_ltr,obj.local_def_x_ltr.*obj.k_axial_vec);
elseif isequal(obj.axial_force_local_direction,'particle to particle')
    % Option 1-> Force in the direction between the particles
    obj.f_axial_ltr= -obj.scale_up(obj.x_rel(:,2:end-1),obj.dp_def.*obj.k_axial_vec);
end

% Transversal/Shear Forces from i->ii
if isequal(obj.shear_coefficient_source,"particles")
    obj.f_trans_ltr=-obj.scale_up(obj.local_frame_y_ltr,obj.local_def_y_ltr.*obj.k_trans_vec(1:end-1));% For angle dependent forces the angle that gives the coefficient is the angle in the left
elseif isequal(obj.shear_coefficient_source,"edges")
    obj.f_trans_ltr=-obj.scale_up(obj.local_frame_y_ltr,obj.local_def_y_ltr.*obj.k_trans_vec);
end
% If needed they can be added later on for analysis
% f_trans_ltr_active=[obj.o obj.f_trans_ltr]
% f_axial_ltr_active=[obj.o obj.f_axial_ltr]
% f_axial_ltr_reactive=[-obj.f_axial_ltr obj.o];
% f_trans_ltr_reactive=[-obj.f_trans_ltr obj.o];

% Overal Forces from i->ii
obj.f_i_ii=[obj.o obj.f_axial_ltr+obj.f_trans_ltr];             % The element in the left doesn't receive an elastic force from left to right, because there's nothingh to its left
obj.f_i_ii_reactive=[-(obj.f_axial_ltr+obj.f_trans_ltr) obj.o]; % However it does receive the reactive force

%% Forces from ii->i/ Right To Left (rtl)
% Direct Forces from ii->i
if isequal(obj.axial_force_local_direction,'relative x direction')
    % Option 0-> Force in the X direction
    obj.f_axial_rtl=obj.scale_up(obj.local_frame_x_rtl,obj.local_def_x_rtl)*obj.k_axial;
elseif isequal(obj.axial_force_local_direction,'particle to particle')
    % Option 1-> Force in the direction to the particle (Already calculated)
    obj.f_axial_rtl= zeros(size(obj.f_axial_ltr));
end
% Transversal/Shear Forces
if isequal(obj.shear_coefficient_source,"particles")
    obj.f_trans_rtl=obj.scale_up(obj.local_frame_y_rtl,obj.local_def_y_rtl.*obj.k_trans_vec(2:end)); % For angle dependent forces the angle that gives the coefficient is the angle in the right
elseif isequal(obj.shear_coefficient_source,"edges")
    obj.f_trans_rtl=obj.scale_up(obj.local_frame_y_rtl,obj.local_def_y_rtl.*obj.k_trans_vec);
end

% If needed they can be added later on for analysis
% f_axial_rtl_active=[obj.o obj.f_trans_ltr]
% f_trans_rtl_active=[obj.o obj.f_axial_ltr]
% f_axial_ltr_reactive=[-obj.f_axial_ltr obj.o];
% f_trans_ltr_reactive=[-obj.f_trans_ltr obj.o];

% Overal Forces from ii->i
obj.f_ii_i=[obj.f_axial_rtl+obj.f_trans_rtl obj.o];% The element in the right doesn't receive an elastic force from right to left, because there's nothingh to its right
obj.f_ii_i_reactive=[obj.o -(obj.f_axial_rtl+obj.f_trans_rtl)];% However it does receive the reactive force

%% Add up all elastic forces
obj.f_elastic=obj.f_i_ii+obj.f_ii_i+obj.f_i_ii_reactive+obj.f_ii_i_reactive;

end