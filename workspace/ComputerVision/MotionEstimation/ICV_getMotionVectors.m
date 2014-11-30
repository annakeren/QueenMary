
function [motionVectorUint8, predictionVectorUint8] = ICV_getMotionVectors(frame1DevidedIntoBlocks, frame2DevidedIntoBlocks, blocksInRow, blocksInColumn, blockHeight, blockWidth, searchWindow)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[r, c, d] = size (frame1DevidedIntoBlocks);
matrixSizeX = blocksInRow*blockHeight;
matrixSizeY = blocksInColumn*blockHeight;
motionVector = zeros (matrixSizeX, matrixSizeY);
predictionVector = zeros (matrixSizeX, matrixSizeY);

l = 1;
[br, bc, bd] = size(frame1DevidedIntoBlocks(:,:,l));

for ii = [1:blockHeight:matrixSizeX - blockWidth, matrixSizeX - blockWidth + 1]
    for jj = [1:blockWidth:matrixSizeY - blockHeight, matrixSizeY - blockHeight + 1]  
       
        motionSuspect = 0;
        blockKDouble = frame1DevidedIntoBlocks(:,:,l);
        blockK = im2uint8(blockKDouble);
        
        blockKand1Double = frame2DevidedIntoBlocks(:,:,l);
        blockKand1 = im2uint8(blockKand1Double);
        motionSuspect = ICV_detectMotion(blockK, blockKand1, br, bc, motionSuspect);
        if motionSuspect == 0
            motionVector(ii:ii + blockHeight - 1, jj:jj + blockWidth - 1) = frame1DevidedIntoBlocks(:,:,l);
            predictionVector(ii:ii + blockHeight - 1, jj:jj + blockWidth - 1) = frame1DevidedIntoBlocks(:,:,l);
            l = l + 1;
            continue;%this means that two corresponding blocks 
            %from consequent frames are equal, no motion in this block
        end
        %blocks not equal, perform search for motion detection
        resemblenceVector = ICV_getResemblenceVector(frame2DevidedIntoBlocks, l, d, blockKDouble, blocksInRow, blockHeight, blockWidth, searchWindow);
% %         %find the smallest number in resemblenceVector
        smallest = 256;
        [v, w] = size(resemblenceVector);
        for v=1:w
            smallestV = resemblenceVector(v);
            if(smallestV < smallest)
                smallest = smallestV;
                smallestIndex = v;
            end
        end
         
        iiStep = ii + blockHeight - 1;
        jjStep = jj + blockWidth - 1;
        if smallestIndex == 1
            motionVector(ii:iiStep, jj:jjStep) = ICV_drawNorthWestVector(frame1DevidedIntoBlocks(:,:,l));
            predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        elseif smallestIndex == 2
            motionVector(ii:iiStep, jj:jjStep) = ICV_drawNorthEastVector(frame1DevidedIntoBlocks(:,:,l));
            predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        elseif smallestIndex == 3
            motionVector(ii:iiStep, jj:jjStep) = ICV_drawSouthWestVector(frame1DevidedIntoBlocks(:,:,l));
            predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        elseif smallestIndex == 4
            motionVector(ii:iiStep, jj:jjStep) = ICV_drawSouthEastVector(frame1DevidedIntoBlocks(:,:,l));
            predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        else
            motionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
            predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        end
        l = l + 1;    
    end
end

motionVectorUint8 = im2uint8(motionVector);
predictionVectorUint8 = im2uint8(predictionVector);
% output_args = motionVectorUint8;
end

