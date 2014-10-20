theta1=-50;
theta2=10;
path = '/Users/annakeren/Documents/QueenMary/workspace/ComputerVision/Transformations/transformation.jpg';
imageMatrix=imread(path);
%just rotate
rotatedMatrix = ICV_rotate(imageMatrix, theta1);
imshow(rotatedMatrix)
%just skew
% skewedMatrix = ICV_skew(imageMatrix, theta2);
% imshow(skewedMatrix)


%skew after rotated
% skewedMatrix = ICV_skew(rotatedMatrix, theta2);

%rotate skewed
% rotatedMatrix = ICV_rotate(skewedMatrix, theta1);
% imshow(rotatedMatrix)

