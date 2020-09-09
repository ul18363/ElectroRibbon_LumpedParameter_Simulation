%% Estimate difference in positions
function calculate_internal_damp_forces(obj)
diff_v=diff(obj.v,2); % Difference in velocity between particle i and particle ii
f=obj.scale_up(-diff_v,sqrt(sum(diff_v.^2)))*obj.internal_damp_factor;
obj.f_internal_damping=[obj.o, f]+[-f,obj.o];
end