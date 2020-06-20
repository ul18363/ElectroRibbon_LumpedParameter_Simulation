function obtain_static_coefficients(obj)
real_p=obj.real_p_btm;
obj.plate.p=real_p; %Assign the real position to the plate model
obj.plate.shear_type='symbolic';
obj.plate.axial_type='symbolic';
obj.calculate_all_forces();
f=obj.plate.f(:,2:end); %The first element is fixed so not much interesting stuff there
eqns=f(:);
vars=[obj.plate.k_axial_vec,obj.plate.k_trans_vec]; %Not really needed probly but still
%constr=vars;
for i=1:length(vars) % Set constraints
    %constr(i)= (>0);
    	assume(vars(i),'positive')
end
for i=1:length(eqns) % Equate All forces to 0
    eqns(i)= (eqns(i)==0);
end
obj.vars=vars;
obj.eqns=eqns;
[A,b] = equationsToMatrix(eqns,vars); %Let's see if this helps
A_e=eval(A);
b_e=eval(b);
obj.matrix_sys_A =A_e;
obj.independent_forces_b=b_e;

if det(A_e)==0
    disp("Columns are linearly dependent! Multiple (Infinite solutions may exist)")
end

if (rank([A_e,b_e]) == rank(A_e))
    disp("Solution can be found.")
    coeffs=eval(linsolve(A,b));
    obj.real_static_coeffs=coeffs;
    obj.real_static_axial_coeffs=coeffs(1:obj.N-1);
    obj.real_static_trans_coeffs=coeffs(obj.N:2*(obj.N-1));
else
    obj.real_static_coeffs=[];
    obj.real_static_axial_coeffs=[];
    obj.real_static_trans_coeffs=[];
end 
    
    
end