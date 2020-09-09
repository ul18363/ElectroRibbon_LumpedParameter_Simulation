function [Cb,t] = bezier_variable_scope_interp(b_points,precision_range)
% [Cb,t] = bezier_variable_scope_interp(b_points,precision_range)
%
% Returns the spatial coordinates of a qubic bezier curve given the control
% points and a set of ranges/precision matrix (precision_range)
%
% precision_range: First Row - Right end of interval
%                  Second Row - Distance between points on such window
%
% i.e.:
% b_points=[  0	0.014930691	0.029501814	0.044430887;...
%             0	0	-0.006064282	-0.006115478];
% precision_range=...
%     [ 1e-6 1e-5 1e-4 1e-3 1e-2 1
%       1e-8 1e-7 1e-6 1e-4 1e-3 1e-2];

lims= [init_elem precision_range(1,:)];
intervals{length(precision_range)}=[];

for i =1:length(lims)-1
    intervals{i}=lims(i):precision_range(2,i):lims(i+1);
end
t=unique(cat(2,intervals{:}));
t4=t.^3;
t3=(t.^2).*(1-t);
t2=((1-t).^2).*t;
t1=(1-t).^3;
Cb=b_points(:,1)*t1+3*b_points(:,2)*t2+3*b_points(:,3)*t3+b_points(:,4)*t4;
end
