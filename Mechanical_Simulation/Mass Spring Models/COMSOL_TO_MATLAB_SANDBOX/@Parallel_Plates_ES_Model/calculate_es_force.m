function calculate_es_force(obj,points)
% 
%
%
%
method='No_scaling';
obj.calculate_distributed_force(points)
obj.Fy_dist;
obj.Fx_dist;
obj.xs;
obj.ys;
dx=diff(obj.xs);
dy=diff(obj.ys);
ds=sqrt(dx.^2+dy.^2);
ds=[0 ds];
obj.ds=ds;
obj.Fy=trapz(ds,obj.Fy_dist);
obj.Fx=trapz(ds,obj.Fy_dist);
switch method 
    case 'No_scaling'
        
    case 'Scale'
    %TODO    
    case 'Scale_and_add_dielectric'    
    %TODO
    otherwise 
        error('Electrostatic force integration method is not valid')
end

end
