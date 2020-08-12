function interface_force_y=get_interface_force(obj)
interface_force_y=abs(mphint2(obj.model,'es.Ey^2*epsilon0_const*es.d','line','selection','top_interface'));
end