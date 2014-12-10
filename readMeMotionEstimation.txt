motionEstimation.m is the scrpt for 4 task.
4 a. To see 4 a task, go to %4 a section.

4 b. To see 4 b results, comment:

figure;
imshow(frame1, []);
hold on;
quiver(xSource, ySource, uSource, vSource);

Uncomment 
% imshow(predictionVectorUint8);

4 c . To see 4 c taks, got to %4 c section and uncomment

% figure;
% imshow(frame1, []);
% hold on;
% quiver(xSource, ySource, uSource, vSource);


for relative block size and window size, for example:

block = zeros(4, 4);
searchWindow = zeros(16,16);

4 d The same as 4 c

4 e. To see 4 e results, go to %4 e  section and uncomment it 