
desired_resolution=[];
pad_files(video_dir,'.png','%06.f')
gif_filename='N61_COMSOL_1ms_update';
create_gif_from_pics_in_folder(video_dir,gif_filename,[1506 1497],'.png',0.01)