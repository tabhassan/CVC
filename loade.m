
myFolder = 'C:\Users\Tayyab\Documents\MATLAB\0001';
filePattern = fullfile(myFolder, '*.jpg');
Output_folder = 'C:\Users\Tayyab\Desktop\data\d1';

if ~exist(Output_folder, 'dir')
  mkdir(Output_folder);
end
  bmpFiles = dir(filePattern);
for k = length(bmpFiles):-1:1
    baseFileName = bmpFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    imageArray{k} = imread(fullFileName);
    %imshow(imageArray{k});
    %drawnow; % I don't know if this is actually required.
   %imageArray{k} = imrotate(imageArray{k},180);
    
    %imageArray{k} = imnoise(imageArray{k}, 'salt & pepper', 0.05);
    imageArray{k} = rgb2hsv(imageArray{k}); 
    imwrite(imageArray{k},strcat('C:\Users\Tayyab\Documents\MATLAB\nt\',int2str(k),'.jpg'),'jpg');
    imshow(imageArray{k});
end
