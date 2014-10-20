kernelMatrixDesinged=[1,  1, 1;
                        1, -7, 1;
                        1,  1, 1];        
        
 kernelMatrixA = [0.0625,   0.1250,   0.0625;
     0.1250,    0.2500,    0.1250;
    0.0625,    0.1250,    0.0625];
    
    
kernelMatrixB=[0,  1, 0;
               1, -4, 1;
             0,  1, 0];   
         
         
      %read the image into the matrix
 imageMatrixColoured = imread('/Users/annakeren/Documents/QueenMary/workspace/ComputerVision/Dataset/DatasetA/face-1.jpg');
 %make grey image from the coloured one, InputImage
 imageMatrixGray = rgb2gray(imageMatrixColoured);

% %run on designed kernel 3x3
% filteredMatrixDesigned = ICV_filterImage(imageMatrixGray,kernelMatrixDesinged);
% imshow(filteredMatrixDesigned)
% 
% %run on kernelA 3x3
% filteredMatrixA = ICV_filterImage(imageMatrixGray,kernelMatrixA);
% run on kernelA 3x3 followed by kernelA 3x3
%aFollowedByA = ICV_filterImage(filteredMatrixA,kernelMatrixA);
%imshow(aFollowedByA)

% 
% %run on kernelB 3x3
% %filteredMatrixB = ICV_filterImage(imageMatrixGray,kernelMatrixB);
% %imshow(filteredMatrixB)
% aFollowedByB = ICV_filterImage(filteredMatrixA,kernelMatrixB);
% imshow(aFollowedByB)
% bFollowedByA = ICV_filterImage(filteredMatrixB,kernelMatrixA);
% imshow(bFollowedByA)



 kernelMatrixA5 = [
     0  , 0  , 0.5, 0  , 0  ;
     0  , 0.5, 0.1, 0.5, 0  ;
     0.5, 0.1, 0.2, 0.1, 0.5;
     0  , 0.5, 0.1, 0.5, 0  ;
     0  , 0  , 0.5, 0  , 0  ];
 
 kernelMatrixB5=[
     0 , -1, 2 , -1, 0 ;
     -1, 0 , 1 , 0 , -1;
     2 , 1 , -4, 1 , 2 ;
     -1, 0 , 1 , 0 , -1;
     0 , -1, 2 , -1, 0 ];
%run on kernelA 5x5
filteredMatrixA5 = ICV_filterImage(imageMatrixGray,kernelMatrixA5);
% aFollowedByA5 = ICV_filterImage(filteredMatrixA5,kernelMatrixA5);
% imshow(aFollowedByA5)
% aFollowedByB5 = ICV_filterImage(filteredMatrixA5,kernelMatrixB5);
% imshow(aFollowedByB5)
filteredMatrixB5 = ICV_filterImage(imageMatrixGray,kernelMatrixB5);
bFollowedByA5 = ICV_filterImage(filteredMatrixB5,kernelMatrixA5);
imshow(bFollowedByA5)