%% batchrun('Data','dog')
% Data folder contains dog folder, that contains images of the dogs

function [] = batchrun(directory,class)

img_dir = fullfile(directory, class);
image_rgb_info  = dir( fullfile(img_dir, '*.jpg'));
image_rgb_filenames = fullfile(img_dir, {image_rgb_info.name} );

for i = 1:120 %length(image_rgb_filenames)

    fprintf('Running on image %d',i);
    labels(1,i)= runnetwork(image_rgb_filenames{i},0,0,0);
    labels11(1,i)= runnetwork(image_rgb_filenames{i},1,0,0);
    labels2(1,i)= runnetwork(image_rgb_filenames{i},0,1,0);
     labels5(1,i)= runnetwork(image_rgb_filenames{i},1,1,0);
end
N=5;
N1=2;
[labels1, freqs1] = topNclasses(labels,N)
[labels3, freqs2] = topNclasses(labels11,N)
[labels4, freqs3] = topNclasses(labels2,N1)
[labels6, freqs4] = topNclasses(labels5,N1)

c = categorical(labels1)
c1 = categorical(labels3)
c2 = categorical(labels4)
c3=categorical(labels6)

figure
bar(c,freqs1)
title('Resnet50 result of 205(th) folder without any rotation and noise')
xlabel('Classes')
ylabel('Frequency')

figure
bar(c1,freqs2)
 title('Resnet50 rotated result of 205(th) folder')
xlabel('Classes')
ylabel('Frequency')
figure
bar(c2,freqs3)
title('Resnet50 noised result of 205(th) folder')
xlabel('Classes')
ylabel('Frequency')


figure
bar(c3,freqs4)
title('Resnet50 result of 205(th) folder with rotation and noise')
xlabel('Classes')
ylabel('Frequency')

end