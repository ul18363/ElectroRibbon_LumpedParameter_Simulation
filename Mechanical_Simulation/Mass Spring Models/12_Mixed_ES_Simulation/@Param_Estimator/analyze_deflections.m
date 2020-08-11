function analyze_deflections(obj)
    if ~obj.comsol_enabled || isempty(obj.comsol_model)
        disp('No COMSOL model detected/enabled, results may be incomplete!')
    end

    if ~(~obj.comsol_enabled || isempty(obj.comsol_model))
        scale=1;
        L=obj.mass_spring_model.L;
        p=obj.comsol_model.real_p_tp;

        y=calculate_angles(p(:,1:scale:end))/1000; %Degree/mm
        x=linspace(0,L,length(y));
        pol=polyfit(x(2:end-1),y(2:end-1),5); %5th order polynomial fit
        if true
           plot(x,y,'r-x')
           hold on
           plot(x,polyval(pol,x),'b') 
           title('Beam curvature [deg/mm]')
           ylabel('deg[deg/mm]')
           xlabel('Arc[m]')
           legend({'Numerically computed', 'Polynomial approximation'},'Location', 'BestOutside')
           grid on
        end
    end
end

function angles=calculate_angles(p)
dp=diff(p,1,2);
dp_mag=sqrt(([1,1]*dp.^2)); %
dp=[[1;0]*dp_mag(1) dp [1;0]*dp_mag(end)]; %% Add Border condition
left_vect=dp(:,1:end-1);
right_vect=dp(:,2:end);
cos_x=[1,1]*(left_vect.*right_vect);
sin_x=[1,-1]*(left_vect.*flip(right_vect,1));
angles=atan2d(sin_x,cos_x);
    if true
       angles=angles./sqrt(([1,1]*(left_vect.^2))); %Normalize by the lenght of left element
       angles(1,end)=angles(1,end)*2;
    end

end