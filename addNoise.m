function output = addNoise(input, key)

switch key
    case 1
        output=imnoise(input,'gaussian');
    case 2
        output=imnoise(input,'salt & pepper',0.2);
    case 3
        output=imnoise(input,'speckle');
    case 4
        output=imnoise(input,'poisson');  

end

end