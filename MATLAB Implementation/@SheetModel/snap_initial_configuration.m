function snap_initial_configuration(obj)
obj.po=obj.p;
obj.dpo=obj.dp;
obj.local_xo=obj.dpo(1,:);
obj.local_yo=obj.dpo(2,:);
obj.dpo_mag=sqrt([1 1]*obj.dpo.^2);
obj.r_dpo=[obj.dp obj.o];    % Relative position of the next element to the right
obj.l_dpo=[obj.o -obj.dp];   % Relative position of the next element to the left
end
