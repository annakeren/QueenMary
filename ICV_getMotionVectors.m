
function [motionVectorUint8, predictionVectorUint8, xSource, ySource, uSource, vSource] = ICV_getMotionVectors(frame1DevidedIntoBlocks, frame2DevidedIntoBlocks, blocksInRow, blocksInColumn, blockHeight, blockWidth, searchWindow)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[r, c, d] = size (frame1DevidedIntoBlocks);
matrixSizeX = blocksInRow*blockHeight;
matrixSizeY = blocksInColumn*blockHeight;
motionVector = zeros (matrixSizeX, matrixSizeY);
predictionVector = zeros (matrixSizeX, matrixSizeY);
xSource = zeros(0, 0);
ySource = zeros(0, 0);
uSource = zeros(0, 0);
vSource = zeros(0, 0);
quiverIndex = 1;
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
        for n=1:v
            for m=1:w
                smallestV = resemblenceVector(n, m);
                if(smallestV < smallest)
                    smallest = smallestV;
                    smallestIndexV = n;
                    smallestIndexW = m;
                end
            end
        end
%        culaculate in order to find out in which direction vectors points
        half = round(w/2);
        iiStep = ii + blockHeight - 1;
        jjStep = jj + blockWidth - 1;
        motionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        predictionVector(ii:iiStep, jj:jjStep) = frame1DevidedIntoBlocks(:,:,l);
        centerI = ii + round(blockHeight/2);
        centerJ = jj + round(blockWidth/2);
        if centerI < 1
            centerI = 1;
        end
        if centerJ < 1
            centerJ = 1;
        end
        
        if(smallestIndexV < half)
            smallestIndexI =  -centerI - smallestIndexV;
        else
            smallestIndexI =  centerI + smallestIndexV;
        end
        if(smallestIndexW < half)
            smallestIndexJ = -centerJ - smallestIndexW;
        else
            smallestIndexJ = centerJ + smallestIndexW;
        end
        
        xSource(quiverIndex) = horzcat(centerJ);
        ySource(quiverIndex) = horzcat (centerI);

        uSource(quiverIndex) = horzcat(smallestIndexJ);
        vSource(quiverIndex) = horzcat(smallestIndexI);     

        quiverIndex = quiverIndex + 1;
  
        l = l + 1;    
    end
end

motionVectorUint8 = im2uint8(motionVector);
predictionVectorUint8 = im2uint8(predictionVector);
% output_args = motionVectorUint8;
end

