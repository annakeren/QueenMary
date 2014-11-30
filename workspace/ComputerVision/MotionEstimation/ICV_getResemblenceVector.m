function output_args = ICV_getResemblenceVector(frame2DevidedIntoBlocks, l, d, blockKDouble, blocksInRow, blockHeight, blockWidth, searchWindow)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


searchWindowCroppedTo = ICV_buildSearchWindow(searchWindow, frame2DevidedIntoBlocks, blockHeight, l, d, blocksInRow);
        
        [searchWindowHeight, searchWindowWidth] = size(searchWindowCroppedTo);
        resemblenceVectoSize = (searchWindowHeight/blockHeight)*2;
resemblenceVector = zeros(1, ceil(resemblenceVectoSize));
resemblenceVectorIndex = 1;
step = blockHeight;
if blockHeight*2 > searchWindowHeight
    step = round(searchWindowHeight/2);
end
        for i=1: step: searchWindowHeight
            for j=1: step: searchWindowHeight
                if ((i+ step-1) <= searchWindowHeight && (j+ step-1) <= searchWindowHeight)
                    
                    suspectBlockUint = searchWindowCroppedTo(i:i+ step-1,j:j+ step-1); 
                    suspectBlock = im2double(suspectBlockUint);
                    sum=0;
                    for k=1: step
                        for m=1: step
                            km = blockKDouble(k,m);
                            kms = suspectBlock(k,m);
                            sum = sum + ((kms - km)*(kms - km));
                        end
                    end
                    resemblenceVector(resemblenceVectorIndex) = sum;
                    resemblenceVectorIndex = resemblenceVectorIndex + 1;
                end
            end
        end
    output_args = resemblenceVector;
end

