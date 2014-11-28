%motion estimation script
% edit path 
%path = 'C:\Users\aak33\AppData\MotionEstimation\DatasetC.mpg';
path = 'C:\Users\Anna\Documents\GitHub\MotionEstimation\DatasetC.mpg';
videoFrames = ICV_getFramesFromAVI(path);
%4 a
% block = zeros(16, 16);
% searchWindow = zeros(20,20);

%4 c
block = zeros(4, 4);
searchWindow = zeros(16,16);

% block = zeros(8, 8);
% searchWindow = zeros(16,16);

% block = zeros(16, 16);
% searchWindow = zeros(16,16);
 
%4 d
% block = zeros(8, 8);
% searchWindow = zeros(8,8);

% block = zeros(8, 8);
% searchWindow = zeros(16,16);

block = zeros(16, 16);
searchWindow = zeros(16,16);

% 
% block = zeros(8, 8);
% searchWindow = zeros(32,32);




%edit these variables with values of consequent frames
frameK = 31;  
frameKAnd1 = 32;
%4 e, uncomment these lines to see performance report
% profile on

[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this show arrows on the frame
figure;
imshow(frame1, []);
hold on;
quiver(xSource, ySource, uSource, vSource);

%4 e, uncomment these lines to see performance report
% plot(magic(35))
% profile viewer

%4 b  , uncomment with 4 a
%  imshow(predictionVectorUint8);
