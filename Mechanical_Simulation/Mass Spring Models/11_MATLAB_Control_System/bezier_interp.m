% function bezier_interp(b_points,t)


% end
b_points=[  0	0.014930691	0.029501814	0.044430887;...
            0	0	-0.006064282	-0.006115478];
% t=0:1e-1:1;

precision_range=...
    [ 1e-6 1e-5 1e-4 1e-3 1e-2 1
      1e-8 1e-7 1e-6 1e-4 1e-3 1e-2];

init_elem=0;
n=0;
lims= [init_elem precision_range(1,:)];
intervals{length(precision_range)}=[];

for i =1:length(lims)-1
    intervals{i}=lims(i):precision_range(2,i):lims(i+1);
%    n=n+ (lims(i+1)-lims(i))/precision_range(2,i);
end
t=unique(cat(2,intervals{:}));
n=length(t);
%%
figure()
loglog(t,t,'-x')
title('Distributions of points')
%%
t4=t.^3;
t3=(t.^2).*(1-t);
t2=((1-t).^2).*t;
t1=(1-t).^3;
%%
Cb=b_points(:,1)*t1+3*b_points(:,2)*t2+3*b_points(:,3)*t3+b_points(:,4)*t4;

figure()
plot(Cb(1,:),Cb(2,:),'r-x')
Cb_for_COMSOL=Cb';

%%
Cb_for_COMSOL=Cb';
thickness=1e-4;
Cb_for_COMSOL= [Cb_for_COMSOL; flip(Cb_for_COMSOL(:,1)),flip(Cb_for_COMSOL(:,2)-thickness)];