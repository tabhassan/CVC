function label = classificationnetowork(image)

image = imresize(image,5);

net = resnet50();
%inputSize = net.Layers(1).InputSize;
% Crop image to the input size of the network
sz = net.Layers(1).InputSize;
%image = imresize(image,inputSize(1:2));
image = image(1:sz(1), 1:sz(2), 1:sz(3));

% Classify the image using Inception-v3
label = classify(net, image);


end