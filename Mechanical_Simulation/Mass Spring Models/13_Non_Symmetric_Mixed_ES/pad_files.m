%% Define folder with JPEGs
function pad_files(folder_name,extension,format)
%folder_name='video_folder_130';
%pic_extension='.jpeg';
%% Retrieve all jpegs paths
listing=dir(folder_name);
for i=1:length(listing)
    if endsWith(listing(i).name,extension)
        s=listing(i).name;
        ix=strfind(s,extension)-1;
        old_filename=[folder_name,'/',listing(i).name];
        new_s=[num2str(str2num(s(1:ix)),format),extension];
        new_filename=[folder_name,'/',new_s];
       
        movefile(old_filename, new_filename)
        
    end
end

