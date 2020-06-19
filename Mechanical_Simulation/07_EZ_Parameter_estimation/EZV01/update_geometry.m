function update_geometry(model,comp_tag,geom_tag,f_tag,coords)
model.component(comp_tag).geom(geom_tag).feature(f_tag).set('table', coords);
end