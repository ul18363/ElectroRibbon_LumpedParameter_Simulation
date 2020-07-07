figure
data1=1:10;
data2=sqrt(data1);
data3=data1.^2;
data4=data1.^3;
a=plot(data1,data2,'r-x');
grid on
hold on
b=plot(data1,data3,'b-o');
%%
set(a,'XData',data1,'YData',data4)