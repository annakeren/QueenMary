%motion estimation script
% edit path 
path = 'C:\Users\Anna\Documents\GitHub\MotionEstimation\DatasetC.mpg';
videoFrames = ICV_getFramesFromAVI(path);

% block = zeros(16, 16);
% searchWindow = zeros(20,20);


% block = zeros(4, 4);
% searchWindow = zeros(16,16);

block = zeros(8, 8);
searchWindow = zeros(16,16);


% block = zeros(16, 16);
% searchWindow = zeros(16,16);

% block = zeros(8, 8);
% searchWindow = zeros(32,32);

% block = zeros(4, 4);
% searchWindow = zeros(8,8);


%edit these variables with values of consequent frames
frameK = 80;    %110 - 80 - 50 - 10 - 21 - 33
frameKAnd1 = 81;%111 - 81 - 51 - 11 - 21 - 34
[motionVectorUint8, predictionVectorUint8] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
% imshow(predictionVectorUint8)
% uncomment this line to show motion vector
% imshow(motionVectorUint8);

% uncomment this line to show prediction frame of k+1
% imshow(predictionVectorUint8);
