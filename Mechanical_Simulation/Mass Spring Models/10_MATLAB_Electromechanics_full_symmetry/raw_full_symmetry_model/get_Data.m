%[v1,...,vn] = mphinterp(model,{e1,...,en},'coord',coord,...)
%mphinterp(model,{'x','y'}) Allows to obtain data at certain points.

pd = mpheval(model,{'x','y'},'selection',2,'edim',1);

% pd = mpheval(model,{'x','y'},'selection',[1 2 3 4],'edim',[1]);


%%
close all;
% pd = mpheval(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[1 2 3 4 5 6 7 8 9 10],'edim',[1])
pd = mpheval(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[10],'edim',[1]);
figure
subplot(3,1,1)
plot(pd.d1(1:end),pd.d2(1:end),'r-o')

subplot(3,1,2)
plot(pd.d1(1:end),pd.d4(1:end),'b-x')
subplot(3,1,3)
plot(pd.d2,'b-')
%%
figure
legends={};
faces=1:10;
elems{}=
for i = faces
    
    pd = mpheval(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[i],'edim',[1]);
    if isempty(pd.d1)
    continue
    end
    plot(pd.d1,pd.d2,'-x')
    
    legends{end+1}=num2str(i);
    hold on
end
legend(legends)
%%
pd = mphinterp(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[10],'edim',[1]);