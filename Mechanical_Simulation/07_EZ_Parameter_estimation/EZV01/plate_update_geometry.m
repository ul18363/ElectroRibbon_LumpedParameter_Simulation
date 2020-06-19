function plate_update_geometry(model,btm_plate_coords,top_plate_coords)
update_geometry(model,'comp1','geom1','pol1',btm_plate_coords);
update_geometry(model,'comp1','geom1','pol2',top_plate_coords);
model.component('comp1').geom('geom1').run;
end