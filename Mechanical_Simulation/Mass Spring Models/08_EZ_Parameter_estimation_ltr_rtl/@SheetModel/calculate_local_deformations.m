function calculate_local_deformations(obj)

%% Deformations Frames Left To Right (ltr) / i->ii
obj.local_def_x_ltr=obj.local_dpx_ltr-obj.local_xo;
obj.local_def_y_ltr=obj.local_dpy_ltr-obj.local_yo;
%% Deformations Right To Left (rtl)/ i<-ii
obj.local_def_x_rtl=obj.local_dpx_rtl-obj.local_xo; %If this value is positive means that the distance between i+1 and i gets bigger
obj.local_def_y_rtl=obj.local_dpy_rtl-obj.local_yo; %If this value is positive means that the
%% Overall deformation between elements
obj.dp_mag=sqrt([1 1]*obj.dp.^2);  % Magnitude of current distances between points (dp)
obj.dp_def=obj.dp_mag-obj.dpo_mag; % Difference in magnitude from original value
end
