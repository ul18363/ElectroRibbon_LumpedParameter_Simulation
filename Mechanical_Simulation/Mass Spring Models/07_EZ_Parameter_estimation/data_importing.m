% myFiles = dir(fullfile('data','*.txt')); %gets all txt files in struct
% 
% for i in 
Ns=[11,21,51];

for N=Ns
    myFiles = dir(fullfile('data',['*',num2str(N),'.txt']));
    
filename='steel_sheet_2_sides_orientation_fix_left_pos_fix_L_045_N11.txt';
%N=11;
data_importing_script
nans=find(isnan(VarName1));%Find nan values
formatted=VarName1;
formatted(nans)=[];
n_mel=length(formatted)/(N*2); % I know the values are ix,{x,y,u,v}
formatted=reshape(formatted,[2*N n_mel]);
size(formatted,2)
n_studies=(size(formatted,2)-1)/4;
study{n_studies}=[];
load_masses=[0,1,2,4,20,60,200];%
ixs=formatted(:,1);
dist.N=N;
fix_r_or=contains(filename,'steel_sheet_2');
for i = 0:n_studies-1
   dist.N=N;
   dist.fix_r_or=fix_r_or;
   dist.load=load_masses(i+1);
   dist.x=formatted(:,1+i*4+1);
   dist.y=formatted(:,1+i*4+2);
   dist.u=formatted(:,1+i*4+3);
   dist.v=formatted(:,1+i*4+4);
   study{i+1}=dist;
   clear dist
end
end
%if any('%'==tline)
    
%end