function x_sym_update_force_distribution(obj)
% Assuming the model was updated this function updates the electrostatic
% force vector
obj.x=obj.get_x_symmetry_bezier_data('x');
obj.y=obj.get_x_symmetry_bezier_data('y');
obj.unTy=obj.get_x_symmetry_bezier_data('esbe.unTy');
obj.unTx=obj.get_x_symmetry_bezier_data('esbe.unTx');
obj.da=sqrt(diff(obj.x).^2+diff(obj.y).^2)*obj.sheet_width;
obj.dFy=obj.da.*(obj.unTy(1:end-1)+obj.unTy(2:end))/2;
obj.dFx=obj.da.*(obj.unTx(1:end-1)+obj.unTx(2:end))/2;
obj.cumFy= cumsum(obj.dFy);
obj.cumFy=[0 obj.cumFy];
obj.cumFx= cumsum(obj.dFx);
obj.cumFx=[0 obj.cumFx];
end