function generate_discrete_model(obj)
obj.axial_type='constant'; % Axial elastic coefficient is constant
obj.shear_type='inverse_to_length'; %Transverse/Shear elastic coefficient is inverse to length
obj.dm=obj.m/obj.N;     % Mass for individual mass element
obj.dm_vec=ones([1, obj.N])*obj.dm; %Vector with masses
obj.dl=obj.L/(obj.N-1); % Unstrained length of individual segment
obj.k_axial=obj.E*obj.A/(obj.L*(obj.N-1)); %Constant coefficient by material properties
obj.k_trans=obj.G*obj.A/obj.dl; % Constant shear coefficient by material coefficient (Doesn't take into account beam profile)
obj.k_trans_vec=(obj.GA)./vecnorm(obj.dp);%Shear coefficient Formula (Doesn't take into account beam profile)
obj.damp_factor=2e2; %Damping Factor
end
