clear;clc;
%% Set initial Geometry and Create Model
sht_dims=[1 0.1 0.127]; %Sheet dimensions [m]
N=11;
sep=0.1;
x0=0: (1-0)/(N-1):1;
plate_coords_btm=[x0' zeros(size(x0))'; fliplr(x0)' zeros(size(x0))'+sht_dims(2)];
plate_coords_tp=[x0' zeros(size(x0))'+sht_dims(2)+sep; fliplr(x0)' zeros(size(x0))'+2*sht_dims(2)+sep];

% btm_plate_coords= [0 0.0; 0.1 0.0; 0.2 0.0; 0.3 0.0; 0.4 0.0; 0.5 0.0; 0.6 0.0; 0.7 0.0; 0.8 0.0; 0.9 0.0; 1 0.0; 1 0.1; 0.9 0.1; 0.8 0.1; 0.7 0.1; 0.6 0.1; 0.5 0.1; 0.4 0.1; 0.3 0.1; 0.2 0.1; 0.1 0.1; 0 0.1];
% top_plate_coords= [0 0.3; 0.1 0.3; 0.2 0.3; 0.3 0.3; 0.4 0.3; 0.5 0.3; 0.6 0.3; 0.7 0.3; 0.8 0.3; 0.9 0.3; 1 0.3; 1 0.4; 0.9 0.4; 0.8 0.4; 0.7 0.4; 0.6 0.4; 0.5 0.4; 0.4 0.4; 0.3 0.4; 0.2 0.4; 0.1 0.4; 0 0.4];
%% Model Creation
tic
model=create_model(plate_coords_btm,plate_coords_tp);
% Extract data from current Geometry
res=extract_results(model,N);
model_time=toc;
%% Model Update
plate_coords_btm=plate_coords_btm*2;
plate_coords_tp=plate_coords_tp*2;
tic 
plate_update_geometry(model,plate_coords_btm,plate_coords_tp)
res_update=extract_results(model,N);

update_time=toc;
res.time_n=[N model_time update_time];
