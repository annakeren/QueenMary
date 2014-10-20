function output_args = ICV_getFramesFromAVI(pathToVideo)
%the function reads the video file and returns its frames
vidObj = VideoReader(pathToVideo);
videoFrames = read(vidObj);
output_args = videoFrames;
end

