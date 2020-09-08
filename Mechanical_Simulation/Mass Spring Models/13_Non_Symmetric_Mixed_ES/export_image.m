
desired_resolution=[];
pad_files(video_dir,'.png','%06.f')
%%
gif_filename='N21_COMSOL_advanced_1ms_update_short';
create_gif_from_pics_in_folder(video_dir,gif_filename,[1506 1497],'.png',0.01,10)