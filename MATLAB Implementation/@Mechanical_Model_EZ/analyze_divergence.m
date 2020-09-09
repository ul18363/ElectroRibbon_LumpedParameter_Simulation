function reco_dt=analyze_divergence(obj,dt)
reco_dt_btm=obj.bottom_plate.analyze_divergence(dt);
reco_dt_top=obj.top_plate.analyze_divergence(dt);
reco_dt=min(reco_dt_btm,reco_dt_top);
end