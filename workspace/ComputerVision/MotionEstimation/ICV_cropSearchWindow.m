function output_args = ICV_cropSearchWindow(searchWindowUint, blockDimension, searchWindowDimension)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if(searchWindowDimension == 8 && blockDimension == 4)
    searchWindowCroppedTo = searchWindowUint(3:10,3:10);
elseif (searchWindowDimension == 20 && blockDimension == 16)
    searchWindowCroppedTo = searchWindowUint(15:34,15:34);
elseif (searchWindowDimension == 16 && blockDimension == 4)
    searchWindowCroppedTo = searchWindowUint(3:18,3:18);
elseif (searchWindowDimension == 16 && blockDimension == 8)
    searchWindowCroppedTo = searchWindowUint(5:20,5:20);
elseif (searchWindowDimension == 16 && blockDimension == 16)
    searchWindowCroppedTo = searchWindowUint;
elseif (searchWindowDimension == 8 && blockDimension == 8)
    searchWindowCroppedTo = searchWindowUint;
elseif (searchWindowDimension == 32 && blockDimension == 8)
    searchWindowCroppedTo = searchWindowUint(5:36,5:36);
end
output_args = searchWindowCroppedTo;
end

