clear; clc;
base_N=[11,22,55];
% Ns=[base_N base_N*10 base_N*100 base_N*1000];

Ns=[11 101 1001];

%result=zeros([length(Ns) 3]);
clear r result;
r.a=0;
result{length(Ns)}=r; clear r;
for i=1:length(Ns)
    result{i}=time_study(Ns(i));
end   
save res
% %% Results
% 
% result=[
%     11.0000    3.6658    0.4410;
%     22.0000    3.3965    0.4713;
%     55.0000    4.1323    1.0474;
%     110.0000    4.2819    1.0377;
%     220.0000    5.2641    2.0337;
%     550.0000   14.6098    6.6962;
%     1100    56.8    27.4;
%     2200    659.9    365.1
% ]; %% When manually stopping the script the results werent saved in the result variable
% 
% %%
% figure
% plot(result(:,1),result(:,2),'b')
% hold on
% plot(result(:,1),result(:,3),'r')
% legend('Full', 'Update')
% xlabel('N')
% ylabel('time (s)')