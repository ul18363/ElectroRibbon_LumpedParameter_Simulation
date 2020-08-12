function insulator_force_y=get_insulator_force(obj)
insulator_force_y=abs(mphint2(obj.model,'es.Py*es.Ey','surface','intsurface','on','selection',3));
end