function angles=calculate_angles(p)
%%
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
       %angles(1,end)=angles(1,end)*2;
    end
%%    
end