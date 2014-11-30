function output_args = ICV_buildSearchWindow(searchWindow, frame2DevidedIntoBlocks, blockDimension, l, d, blocksInRow)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
center = frame2DevidedIntoBlocks(:,:,l);
[searchWindowHeight, searchWindowWidth] = size(searchWindow);

if (blockDimension >= searchWindowHeight)
    searchWindowDouble = center;
else
    numberOfBlocksInWindow = ceil(searchWindowHeight/blockDimension);
    startIndex = -(numberOfBlocksInWindow/2);
    stopIndex = numberOfBlocksInWindow/2;
    searchWindowDouble = zeros(0, 0);
    
    one = zeros(blockDimension, blockDimension);
    two = zeros(blockDimension, blockDimension);
    three = zeros(blockDimension, blockDimension);
    for i=startIndex:stopIndex
        if((l - (i*blocksInRow) + i) < d && (l - (i*blocksInRow) + i) > 0)
            one = frame2DevidedIntoBlocks(:,:,l - (i*blocksInRow) + i);
        end
        if((l + i) < d && (l + i) > 0)
            two = frame2DevidedIntoBlocks(:,:,l + i);
        end
        if((l + (i*blocksInRow) + i) < d && (l + (i*blocksInRow) + i) > 0)
            three = frame2DevidedIntoBlocks(:,:,l + (i*blocksInRow) + i);
        end
        searchWindowHorz = horzcat (one, two, three);
        searchWindowDouble = vertcat(searchWindowDouble, searchWindowHorz);
    end
    searchWindowUint = im2uint8(searchWindowDouble);
    
    searchWindowCroppedTo = ICV_cropSearchWindow(searchWindowUint, blockDimension, searchWindowHeight);
%     searchWindowCroppedTo = searchWindow(3:10,3:10);
end

output_args = searchWindowCroppedTo;


end

