figure()
plot(obj.electrostatic_model.comsol_EZ_model.xs,...
    obj.electrostatic_model.comsol_EZ_model.cumFy)

%%
p_btm2=obj.mechanical_model.bottom_plate.p(:,contact_ix+1:end);
p_top2=obj.mechanical_model.top_plate.p(:,contact_ix+1:end);

heights2=p_top2-p_btm2