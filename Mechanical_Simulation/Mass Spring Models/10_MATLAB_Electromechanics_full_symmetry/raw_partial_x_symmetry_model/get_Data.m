%[v1,...,vn] = mphinterp(model,{e1,...,en},'coord',coord,...)
%mphinterp(model,{'x','y'}) Allows to obtain data at certain points.

pd = mpheval(model,{'x','y'},'selection',2,'edim',1);

% pd = mpheval(model,{'x','y'},'selection',[1 2 3 4],'edim',[1]);
%% Capacitance [F]
capacitance = mpheval(model,{'esbe.C11'},'edim',0).d1(1);

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
%faces=1:23;
faces=[10 13 21 23];

elems{length(faces)}=[];
for i = 1:length(faces)
    face=faces(i);
    pd = mpheval(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[face],'edim',1);
    if isempty(pd.d1)
    continue
    end
    plot(pd.d1,pd.d2,'-x')
    elems{i}=pd;
    legends{end+1}=num2str(face);
    hold on
end
legend(legends)

%%


%%
pd = mphinterp(model,{'x','y','esbe.unTx','esbe.unTy'},'selection',[10],'edim',[1]);






%%

pd=mphint2(model,{'x','y','esbe.unTx','esbe.unTy'},'surface','selection',1);
    
%%
model.result().numerical().create('custom1',"Eval")
%%
% model.result().numerical('custom1').selection([10]);
model.result().numerical("custom1").set("expr", {'x', 'y'});

%%
model.result().numerical("custom1").getData()

%%
model.result().numerical().create("q2","Global")
%%
model.result().numerical("q2").set("expr", 'esbe.Q0_1');
%%
model.result().numerical("q2").getData()


%%
model.result().numerical().create('qint',"IntLine");
% Charge surface density: 'comp1.esbe.nD'
%%
model.result().numerical('qint').selection.set([1 2 3 5 7 8]); % 4 and 6 have some problems. Charge density is not defined there
model.result().numerical("qint").set("expr", 'esbe.nD*esbe.d');
%%

%model.result().numerical("qint").getData()

model.result().numerical("qint").computeResult();
q=model.result().numerical("qint").getReal();%Charge
%model.result().numerical("qint").getImag()
%%
q=mphint2(model,{'esbe.nD*esbe.d'},'line','selection',[1 2 3 5 7 8]);