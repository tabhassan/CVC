
function thisLabel = runnetwork(imagepath,r,n,p)

image = imread(imagepath);

if r==1
    image=rotateImage(image,90);
end

if n==1
   image=addNoise(image, 2);
end

thisLabel=string(classificationnetwork(image));

if p==1
    plotLabel(image, thisLabel)
end


end