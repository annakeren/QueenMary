
function [motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource, frame1] = ICV_getMotionEstimation(videoFrames, frameIndex1, frameIndex2, block, searchWindow)


[row, column, channel, frameNumber]=size(videoFrames);

if (frameIndex1 > frameNumber) || (frameIndex2 > frameNumber)
    error ('frame index must be less then the number of frames available');
end

for frameIndex=1:frameNumber
    currentFrame = videoFrames(:,:,:,frameIndex);
    if frameIndex == frameIndex1
        frame1 = currentFrame; 
%          imshow(frame1)
    end
    if frameIndex == frameIndex2
        frame2 = currentFrame;
        imshow(frame2)
    end
end


% imshow(frame2)
frame1DevidedIntoBlocks = ICV_devideIntoBlocks(frame1, block);
frame2DevidedIntoBlocks = ICV_devideIntoBlocks(frame2, block);


imageMatrix = rgb2gray(frame1);
[blockHeight, blockWidth] = size(block);
[r, c] = size (imageMatrix);
blocksInRow = round(r/blockHeight); 
blocksInColumn = round(c/blockHeight);

[motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource] = ICV_getMotionVectors(frame1DevidedIntoBlocks, frame2DevidedIntoBlocks, blocksInRow, blocksInColumn, blockHeight, blockWidth, searchWindow);

end