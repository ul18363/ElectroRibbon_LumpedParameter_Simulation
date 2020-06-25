function obtain_static_polynomial_coefficients(obj,axial_size,trans_size)
real_p=obj.real_p_btm;
obj.plate.p=real_p; %Assign the real position to the plate model

obj.plate.pol_axial=ones([1 axial_size]);
obj.plate.pol_trans=ones([1 trans_size]);
obj.plate.shear_coefficient_source="particles";%particles
obj.plate.shear_type='symbolic angle dependent polynomial';
obj.plate.axial_type='symbolic deformation dependent polynomial';

obj.calculate_all_forces();
f=obj.plate.f(:,2:end); %The first element is fixed so not much interesting stuff there
eqns=f(:);
vars=symvar(obj.plate.f.');%[obj.plate.k_axial_vec,obj.plate.k_trans_vec]; %Not really needed probly but still
%constr=vars;
for i=1:length(vars) % Set constraints
    %constr(i)= (>0);
    %	assume(vars(i),'positive')
end
for i=1:length(eqns) % Equate All forces to 0
    eqns(i)= (eqns(i)==0);
end
obj.vars=vars;
obj.eqns=eqns;
[A,b] = equationsToMatrix(eqns,vars); %Let's see if this helps
obj.A=A;
obj.b=b;
A_e=eval(A);
b_e=eval(b);
obj.matrix_sys_A =A_e;
obj.independent_forces_b=b_e;

if  size(obj.matrix_sys_A,2)~=size(obj.matrix_sys_A,1) ||det(A_e)==0
    disp("Matrix is not square or Determinant is 0. Multiple, None or Infinite solutions may exist")
end
obj.approx_coeffs=pinv(A_e)*b_e;
disp("Target columns is not linearly dependent with matrix columns, exact solution is not available")
obj.approx_coeffs=pinv(A_e)*b_e;
obj.approx_static_axial_coeffs=obj.approx_coeffs(1:axial_size);
obj.approx_static_trans_coeffs=obj.approx_coeffs(axial_size+1:axial_size+trans_size);



end