%Please edit these values
rotationAngle=20;
skewingAngle=50;
path = '/Users/annakeren/Documents/QueenMary/workspace/ComputerVision/Transformations/transformation.jpg';

imageMatrixColoured=imread(path);
%if image is coloured, thenconvert to gray scale, if not comment this line
imageMatrix= rgb2gray(imageMatrixColoured);
% imshow(imageMatrix)
%just rotate, uncommenct to see the result
% rotatedMatrix = ICV_rotate(imageMatrix, rotationAngle);
% imshow(rotatedMatrix)


%skew after rotated, uncomment to see the result
% skewedMatrix = ICV_skew(rotatedMatrix, skewingAngle);
% imshow(skewedMatrix)


%just skew, uncomment to see the result
skewedMatrix = ICV_skew(imageMatrix, skewingAngle);
% imshow(skewedMatrix)

%rotate skewed, uncomment to see the result
rotatedMatrix = ICV_rotate(skewedMatrix, rotationAngle);
imshow(rotatedMatrix)

