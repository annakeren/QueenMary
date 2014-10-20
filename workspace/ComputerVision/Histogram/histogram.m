pathToVideo = '/Users/annakeren/Documents/QueenMary/workspace/ComputerVision/Dataset/DatasetB.avi';
%extract frames from video
videoFrames = ICV_getFramesFromAVI(pathToVideo);
[row, column, channel, frameNumber]=size(videoFrames);

%visualize histograms of some two consequent frames
for frameIndex=1:frameNumber
    frame = videoFrames(:,:,:,frameIndex);
    %change value of compared index to get histogram of any frame
    if frameIndex == 201
%         imshow(frame)
        [freqRI, freqGI, freqBI] = ICV_getHistogram(frame);
        %uncomment the following function to see the visualized histogram
%         ICV_visualizeHistogram(freqRI, freqGI, freqBI);
    end
    %change value of compared index to get histogram of any frame
    if frameIndex == 202
%         imshow(frame)
        [freqRII, freqGII, freqBII] = ICV_getHistogram(frame);
        %uncomment the following function to see the visualized histogram
%         ICV_visualizeHistogram(freqRII, freqGII, freqBII);
    end
end

%get intersection of previously visualized histrograms
[intersectionR, intersectionG, intersectionB] = ICV_getIntersection(freqRI, freqGI, freqBI, freqRII, freqGII, freqBII);
%uncomment the following function to see the visualized histogram
%intersection
ICV_visualizeHistogram(intersectionR, intersectionG, intersectionB);