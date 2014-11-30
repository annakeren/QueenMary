function [intersectionR, intersectionG, intersectionB] = ICV_getIntersection(freqRI, freqGI, freqBI, freqRII, freqGII, freqBII)
%The function get six parameters: three colour channels of both
%frames compared
%the function returns 3 intersection for Red Green and Blue
%intersection for red
    intersectionR=zeros(256,1);
    sumR = 0;%accumulation variable the values for normalization
    for i=1:256
        rI = freqRI(i);
        rII = freqRII(i);
        if rI <=rII
            intersectionR(i) = rI;
        else
            intersectionR(i) = rII;
        end
        sumR = sumR + intersectionR(i);%accumulate the values for normalization
    end
%intersection for green
    intersectionG=zeros(256,1);
    sumG = 0;%accumulation variable the values for normalization
    for i=1:256
        gI = freqGI(i);
        gII = freqGII(i);
        if gI <=gII
            intersectionG(i) = gI;
        else
            intersectionG(i) = gII;
        end
        sumG = sumG + intersectionG(i);%accumulate the values for normalization
    end
%intersection for blue
sumB = 0;%accumulation variable the values for normalization
intersectionB=zeros(256,1);
    for i=1:256
        bI = freqBI(i);
        bII = freqBII(i);
        if bI <=bII
            intersectionB(i) = bI;
        else
            intersectionB(i) = bII;
        end
        sumB = sumB + intersectionB(i);%accumulate the values for normalization
    end
    %normalize the intersections
    %comment in order see unnormalized results as in the report
    for i=1:256
        intersectionR(i) = intersectionR(i)/sumR;
        intersectionG(i) = intersectionG(i)/sumG;
        intersectionB(i) = intersectionB(i)/sumG;
    end
end

