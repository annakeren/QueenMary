function [freqR, freqG, freqB] = ICV_getHistogram(imageMatrix)
%the function calculates histograms for Red, Gree, Blue colours
[r, c]=size(imageMatrix);
freqR=zeros(256,1);
freqG=zeros(256,1);
freqB=zeros(256,1);
    for i=1:r
        for j=1:(c/3)
            %Red
            valueR=imageMatrix(i,j, 1);        
            frequencyR = freqR(valueR+1);
            freqR(valueR+1) = frequencyR + 1;
            %Green
            valueG=imageMatrix(i,j, 2);
            frequencyG = freqG(valueG+1);
            freqG(valueG+1) = frequencyG + 1;
            %Blue
            valueB=imageMatrix(i,j, 3);
            frequencyB = freqB(valueB+1);
            freqB(valueB+1) = frequencyB + 1;
        end
    end
end

