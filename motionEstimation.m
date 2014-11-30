%motion estimation script
% edit path 
%path = 'C:\Users\aak33\AppData\MotionEstimation\DatasetC.mpg';
path = 'C:\Users\Anna\Documents\GitHub\MotionEstimation\DatasetC.mpg';
videoFrames = ICV_getFramesFromAVI(path);

%edit these variables with values of consequent frames
frameK = 31;  
frameKAnd1 = 32;
%4 a
block = zeros(16, 16);
searchWindow = zeros(20,20);

start16_20 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this shows arrows on the frame
figure;
imshow(frame1, []);
hold on;
quiver(xSource, ySource, uSource, vSource);
tElapsed16_20=toc(start16_20);


%4 c
block = zeros(4, 4);
searchWindow = zeros(16,16);
start4_16 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed4_16=toc(start4_16);

block = zeros(8, 8);
searchWindow = zeros(16,16);
start8_16 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
% %this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed8_16=toc(start8_16);

block = zeros(16, 16);
searchWindow = zeros(16,16);
start16_16 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed16_16=toc(start16_16);

%4 e
% blockChangePlot = [tElapsed4_16 tElapsed8_16 tElapsed16_16];
% str = {'b 4 sw 16'; 'b 8 sw 16'; 'b 16 sw 16'};
% bar(blockChangePlot)
% set(gca, 'XTickLabel',str, 'XTick',1:numel(str))

%4 d
block = zeros(8, 8);
searchWindow = zeros(8,8);

start8_8 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
% %this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed8_8=toc(start8_8);

block = zeros(8, 8);
searchWindow = zeros(16,16);
start8_16 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed8_16=toc(start8_16);

block = zeros(8, 8);
searchWindow = zeros(32,32);

start8_32 = tic;
[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameK, frameKAnd1, block, searchWindow);
%this shows arrows on the frame
% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);
tElapsed8_32=toc(start8_32);

 %4 e   
% searchWindowChangePlot = [tElapsed8_8 tElapsed8_16 tElapsed8_32];
% str = {'b 8 sw 8'; 'b 8 sw 16'; 'b 8 sw 32'};
% bar(searchWindowChangePlot)
% set(gca, 'XTickLabel',str, 'XTick',1:numel(str))

%4 b  , uncomment with 4 a
%  imshow(predictionVectorUint8);
