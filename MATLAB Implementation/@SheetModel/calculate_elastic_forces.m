%% Estimate difference in positions
function calculate_elastic_forces(obj)
direct_force_type=obj.direct_force_type; % Type 0: Direct forces in the direction of local_x (1 per way)
% Type 1: Direct forces in the direction of dp (way is shared)
shear_deformation_definition=obj.shear_deformation_definition;

% Calculate Local Frames of reference
obj.calculate_local_frames(); % Generate local frames and compute deformations
% Calculate Deformation in such axis
obj.calculate_local_deformations();
% Estimate Elastic Coefficients
obj.compute_elastic_coefficients();
% Calculate elastic Forces
%% Overal Forces
% Overal Forces from i->ii
% Reset Forces
obj.f_i_ii=zeros(size(obj.p));
obj.f_i_ii_reactive=zeros(size(obj.p));
obj.f_ii_i=zeros(size(obj.p));
obj.f_ii_i_reactive=zeros(size(obj.p));

%% Calculation of Direct Forces
switch direct_force_type
    case 0 % Option 0-> Force in the reltative (ltr/rtl) X direction
        obj.f_axial_ltr=-obj.scale_up(obj.local_frame_x_ltr,obj.local_def_x_ltr.*obj.k_axial_vec);
        obj.f_axial_rtl=obj.scale_up(obj.local_frame_x_rtl,obj.local_def_x_rtl)*obj.k_axial;
        % Add to forces overall forces
        obj.f_i_ii=obj.f_i_ii+[obj.o obj.f_axial_ltr];  % The element in the left doesn't receive an elastic force from left to right, because there's nothingh to its left
        obj.f_i_ii_reactive=obj.f_i_ii_reactive+[-obj.f_axial_ltr obj.o];   % However it does receive the reactive force
        obj.f_ii_i=obj.f_ii_i+[obj.f_axial_rtl obj.o];             % The element in the right doesn't receive an elastic force from right to left, because there's nothingh to its right
        obj.f_ii_i_reactive=obj.f_ii_i_reactive+[obj.o -obj.f_axial_rtl];   % However it does receive the reactive force
        
    case 1 % Option 1-> Force in the direction between the particles
        obj.f_axial_ltr= -obj.scale_up(obj.x_rel(:,2:end-1),obj.dp_def.*obj.k_axial_vec);
        %         obj.f_axial_rtl= zeros(size(obj.f_axial_ltr)); % Could divide by
        %         2 but when direct_force_type is 1 f_axial_ltr and f_axial_rtl are
        %         identical so no need to have them both.
        
        % Add to forces overall forces
        obj.f_i_ii=obj.f_i_ii+[obj.o obj.f_axial_ltr];  % The element in the left doesn't receive an elastic force from left to right, because there's nothingh to its left
        obj.f_i_ii_reactive=obj.f_i_ii_reactive+[-obj.f_axial_ltr obj.o];   % However it does receive the reactive force
        %         obj.f_ii_i=obj.f_ii_i+[obj.f_axial_rtl obj.o];             % The element in the right doesn't receive an elastic force from right to left, because there's nothingh to its right
        %         obj.f_ii_i_reactive=obj.f_ii_i_reactive+[obj.o -obj.f_axial_rtl];   % However it does receive the reactive force
        
end
%% Forces from i->ii / Left To Right (ltr)
% Direct Forces from i->ii
% if direct_force_type==0
%     % Option 0-> Force in the reltative (ltr) X direction
%     obj.f_axial_ltr=-obj.scale_up(obj.local_frame_x_ltr,obj.local_def_x_ltr.*obj.k_axial_vec);
% elseif direct_force_type==1
%     % Option 1-> Force in the direction between the particles
%     obj.f_axial_ltr= -obj.scale_up(obj.x_rel(:,2:end-1),obj.dp_def.*obj.k_axial_vec);
% end
% Transversal/Shear Forces from i->ii
switch shear_deformation_definition
    case 0  % Using local frames of references that indicate the direction of the beam
        obj.f_trans_ltr=-obj.scale_up(obj.local_frame_y_ltr,obj.local_def_y_ltr.*obj.k_trans_vec);
        obj.f_trans_rtl=obj.scale_up(obj.local_frame_y_rtl,obj.local_def_y_rtl.*obj.k_trans_vec);
        %% Add to forces overall forces
        obj.f_i_ii=obj.f_i_ii+[obj.o obj.f_trans_ltr];             % The element in the left doesn't receive an elastic force from left to right, because there's nothingh to its left
        obj.f_i_ii_reactive=obj.f_i_ii_reactive+[-obj.f_trans_ltr obj.o]; % However it does receive the reactive force
        obj.f_ii_i=obj.f_ii_i+[obj.f_trans_rtl obj.o];% The element in the right doesn't receive an elastic force from right to left, because there's nothingh to its right
        obj.f_ii_i_reactive=obj.f_ii_i_reactive+[obj.o -obj.f_trans_rtl];% However it does receive the reactive force
        
    case 1 %  Deformation as the median of the triangle formed by 3 consecutive particles
        % (Only works for unstressed equidistant particles)
        %         dp2=obj.p(:,3:end)-obj.p(:,1:end-2);
%         dp2=obj.p(:,3:end)-obj.p(:,1:end-2);
%         dp2=obj.dp(:,1:end-1)+obj.dp(:,2:end); %Same as above but with
%         higher dependency
%         dp2=obj.dp(:,1:end-1)-obj.dp(:,3:end);
        % TODO Calculate height
        %h = height of triangle formed  by 3 consecutive particles / h(i)=
        %distance of p(i) with segment formed by particles (i-1,i+1)
        obj.f_trans_ltr=zeros(size(obj.f_axial_ltr));
        obj.f_trans_rtl=zeros(size(obj.f_trans_ltr));
        
    case 2 % Deformation as the median of the triangle formed by 3 consecutive particles
        dp2=obj.p(:,3:end)-obj.p(:,1:end-2);
        dp1=obj.dp(:,1:end-1); %
        median=dp1-(dp2/2);% dp1=median+dp2/2->median=dp1-(dp2/2)
        
        obj.f_trans_ltr= -median*obj.k_trans;
%         obj.f_trans_ltr=zeros(size(obj.p));
%         obj.
%         obj.f_trans_rtl=zeros(size(obj.f_trans_ltr));
        
        obj.f_i_ii=obj.f_i_ii+[obj.o obj.f_trans_ltr obj.o];  % The forcce is only applied to those points with particles at each side
%         obj.f_i_ii_reactive=[-(obj.f_axial_ltr+obj.f_trans_ltr) obj.o]; % However it does receive the reactive force
        
    case 3 % Mixture between Case 2 and 1
        C1=0.8;
        C2=sqrt(1-C1^2);
        obj.f_trans_ltr=-obj.scale_up(obj.local_frame_y_ltr,obj.local_def_y_ltr.*obj.k_trans_vec);
        obj.f_trans_rtl=obj.scale_up(obj.local_frame_y_rtl,obj.local_def_y_rtl.*obj.k_trans_vec);
        dp2=obj.p(:,3:end)-obj.p(:,1:end-2);
        dp1=obj.dp(:,1:end-1); %
        median=dp1-(dp2/2);% dp1=median+dp2/2->median=dp1-(dp2/2)
        
%         obj.f_trans_ltr= -median*obj.k_trans;
         %% Add to forces overall forces
        obj.f_i_ii=obj.f_i_ii+                  C1*[obj.o obj.f_trans_ltr]+C2*[obj.o -median*obj.k_trans obj.o];             % The element in the left doesn't receive an elastic force from left to right, because there's nothingh to its left
        obj.f_i_ii_reactive=obj.f_i_ii_reactive+C1*[-obj.f_trans_ltr obj.o]; % However it does receive the reactive force
        obj.f_ii_i=obj.f_ii_i+                  C1*[obj.f_trans_rtl obj.o];% The element in the right doesn't receive an elastic force from right to left, because there's nothingh to its right
        obj.f_ii_i_reactive=obj.f_ii_i_reactive+C1*[obj.o -obj.f_trans_rtl];% However it does receive the reactive force

end





%% Add up all elastic forces
obj.f_elastic=obj.f_i_ii+obj.f_ii_i+obj.f_i_ii_reactive+obj.f_ii_i_reactive;

end