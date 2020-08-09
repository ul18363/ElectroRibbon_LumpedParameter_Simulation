p1=mphplot(model,'pg2');
p=p1{1}{1}.p;
t=p1{1}{1}.t;
d=p1{1}{1}.d;
t2=t+1;
%%
x=p(t(1,:))
%%
fig = gcf;
axObjs = fig.Children;
dataObjs = axObjs.Children
x = dataObjs(1).XData
y = dataObjs(1).YData
a = get(gca,'Children');
xdata = get(a, 'XData');