%motion estimation script
% edit path 
path = '/Users/annakeren/Documents/QueenMary/workspace/ComputerVision/Dataset/DatasetC.mpg';
videoFrames = ICV_getFramesFromAVI(path);

% block = zeros(16, 16);
% searchWindow = zeros(20,20);


block = zeros(4, 4);
searchWindow = zeros(16,16);
%edit these variables with values of consequent frames
frameK = 110;    %110 - 80 - 50 - 10 - 21 - 33
frameKAnd1 = 111;%111 - 81 - 51 - 11 - 21 - 34
[motionVectorUint8, predictionVectorUint8] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);

% uncomment this line to show motion vector
imshow(motionVectorUint8);

% uncomment this line to show prediction frame of k+1
% imshow(predictionVectorUint8);
