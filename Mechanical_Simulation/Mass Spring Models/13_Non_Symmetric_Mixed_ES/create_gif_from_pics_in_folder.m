%% Define folder with JPEGs
function create_gif_from_pics_in_folder(folder_name,new_name,scale,pic_extension,delay_time)
%folder_name='video_folder_130';
%pic_extension='.jpeg';
%% Retrieve all jpegs paths
listing=dir(folder_name);
files={};
for i=1:length(listing)
    if endsWith(listing(i).name,pic_extension)
        files{end+1}=[folder_name,'/',listing(i).name];
    end
end

%%
images{length(files)}=[];
for i=1:length(files)
    if ~isempty(scale)
    images{i} = imresize(imread(files{i}),scale);
    else
    images{i} =imread(files{i});
    end
end
%%
file_name=[new_name,'_gif.gif'];
% delay_time=0.01;
for i=1:length(files)
%     if i>50
%         break
%     end
    [A,map] = rgb2ind(images{i},256);
    if i == 1
        imwrite(A,map,file_name,'gif','LoopCount',Inf,'DelayTime',delay_time);
    else
        imwrite(A,map,file_name,'gif','WriteMode','append','DelayTime',delay_time);
    end
end
end