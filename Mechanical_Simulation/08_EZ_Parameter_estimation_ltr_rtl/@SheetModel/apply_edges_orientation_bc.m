%% Estimate difference in positions
function obj=apply_edges_orientation_bc(obj)
% Necessary to calculate elastic forces, it defines the orientation of the
% elements at the edge (physically is always Free Rotation) however is
% easier to simulate clampings by a restriction on the rotation of the
% outermost element than to simulate a clamping or anything else.
% See *calculate_elastic_forces* .

if isempty(obj.x_r0_c)
  obj.x_r0=obj.x_rel(:,1); % Free Rotation
end %If obj.x_r0_c is not empty is faster to define x_r0 outside here


if isempty(obj.x_rend_c)
  obj.x_rend=obj.x_rel(:,end); % Free Rotation condition
end

end