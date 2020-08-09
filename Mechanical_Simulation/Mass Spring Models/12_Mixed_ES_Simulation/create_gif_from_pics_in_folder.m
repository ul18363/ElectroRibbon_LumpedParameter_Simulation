%% Define folder with JPEGs
function create_gif_from_pics_in_folder(folder_name,pic_extension)
%folder_name='video_folder_130';
%pic_extension='.jpeg';
%% Retrieve all jpegs paths
listing=dir('video_folder_130');
files={};
for i=1:length(listing)
    if endsWith(listing(i).name,pic_extension)
        files{end+1}=[folder_name,'/',listing(i).name];
    end
end

%%
images{length(files)}=[];
for i=1:length(files)
    images{i} = imread(files{i});
end
%%
file_name=[folder_name,'_gif.gif'];
delay_time=0.01;
for i=1:length(files)
    [A,map] = rgb2ind(images{i},256);
    if i == 1
        imwrite(A,map,file_name,'gif','LoopCount',1,'DelayTime',delay_time);
    else
        imwrite(A,map,file_name,'gif','WriteMode','append','DelayTime',delay_time);
    end
end
end