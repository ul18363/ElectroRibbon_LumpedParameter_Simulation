
i=101;
%disp(i)

h.obj.og_p=[ 0 t(i); L(i) t(i); L(i) 0 ;0 0];
h.obj.M=mass(i);%
h.obj.width=w(i);

h.obj.update_model();
h.obj.retrieve_real_final_position();

dY_sim=-2*h.obj.real_p(2,3);
dX_sim=2*(L(i)-h.obj.real_p(1,3));
%comsol_deflection(i)=dY_sim;
disp([num2str(i),'|',num2str(dY(i)),'|',num2str(dY_sim),'|',num2str(abs(dY_sim-dY(i))/dY(i)),'%'])
% comsol_contraction(i)=dX_sim;
