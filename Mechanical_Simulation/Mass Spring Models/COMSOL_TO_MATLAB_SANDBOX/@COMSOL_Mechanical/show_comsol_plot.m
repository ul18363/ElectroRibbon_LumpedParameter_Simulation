function show_comsol_plot(obj)
mphplot(obj.model, 'pg1')
grid on
xlabel('x[m]')
ylabel('y[m]')
end