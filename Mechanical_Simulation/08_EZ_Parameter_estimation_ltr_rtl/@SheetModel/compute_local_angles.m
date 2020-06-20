function compute_local_angles(obj)
interpolated=true;
normalization_type=1;% 0- No normalization/ 1 - By left element / 2-By original differential length

%dp=diff(p,1,2);
%dp_mag=sqrt(([1,1]*dp.^2)); %
%dp= x_rel; %% Add Border condition
%left_vect=x_rel(:,1:end-1);
%right_vect=x_rel(:,2:end);
cos_x=[1,1]*(obj.x_rel(:,1:end-1).*obj.x_rel(:,2:end));
sin_x=[1,-1]*(obj.x_rel(:,1:end-1).*flip(obj.x_rel(:,2:end),1));
obj.angles=atan2d(sin_x,cos_x);

%% Normalize Angles
if normalization_type==2
   obj.angles=obj.angles/obj.dl; %Normalize by original differential lenght
   %angles(1,end)=angles(1,end)*2;
elseif normalization_type==1
   obj.angles=obj.angles./[obj.dp_mag(1) obj.dp_mag]; %Normalize by the lenght of left element (First element uses the one to its right)
end
    
%% Fit to Curve and interpolate if needed (Usually good to correct angle edges)
if interpolated
   x=obj.po(1,:); %The interpolation is done taking the original x positions of all points, identical to using linspace(obj.xo,obj.L,N)
   pol=polyfit(x(2:end-1),obj.angles(2:end-1),5); %5th order polynomial fit, 5th seems to work for most deflections, small deflections can be linear though 
   % Tips are excluded because 1- they are noisy and 2- The angle is defined by some forced boundary condition
   obj.angles=polyval(pol,x);
   if false %Disabled plotting
%    plot(x,y,'r-x')
%    hold on
%    plot(x,obj.angles,'b') 
%    title('Beam curvature [deg/m]')
%    ylabel('deg[deg/m]')
%    xlabel('Arc[m]')
%    legend({'Numerically computed', 'Polynomial approximation'},'Location', 'BestOutside')
%    grid on
   end
end

end