function add_or_update_comsol_model(obj)

if ~obj.comsol_enabled
    obj.comsol_enabled=true;
end
    
if isempty(obj.comsol_model)
    obj.comsol_model=COMSOL_Mechanical(...
    obj.mass_spring_model.sht_dms,...
    obj.mass_spring_model.N);
else
    obj.comsol_model.update_model();
end

end