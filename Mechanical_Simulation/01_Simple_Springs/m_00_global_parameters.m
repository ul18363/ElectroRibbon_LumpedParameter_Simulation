o=[0;0];
%% Anonymous functions

%r_dp_f=@(dp_v) [dp_v o];    % Relative position of the next element to the right 
%l_dp_f=@(dp_v) [o -dp_v];   % Relative position of the next element to the left
dp_f=@(p)diff(p,1,2);
def_i_ii = @(dp_v) [o -dp_v]-l_dpo; % Calculates local deformation from particle to the left
def_ii_i = @(dp_v) [dp_v o]-r_dpo;  % Calculates local deformation from particle to the right
% In local coordinates)
scale_up=@(vect,scale)vect.*[scale;scale];
% x_comp= @(p)p(1,:);
% y_comp= @(p)p(2,:);