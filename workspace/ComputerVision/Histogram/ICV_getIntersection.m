function [intersectionR, intersectionG, intersectionB] = ICV_getIntersection(freqRI, freqGI, freqBI, freqRII, freqGII, freqBII)
%the function returns 3 intersection for Red Green and Blue
%intersection for red
    intersectionR=zeros(256,1);
    for i=1:256
        rI = freqRI(i);
        rII = freqRII(i);
        if rI <=rII
            intersectionR(i) = rI;
        else
            intersectionR(i) = rII;
        end
    end
%intersection for green
    intersectionG=zeros(256,1);
    for i=1:256
        gI = freqGI(i);
        gII = freqGII(i);
        if gI <=gII
            intersectionG(i) = gI;
        else
            intersectionG(i) = gII;
        end
    end
%intersection for blue
intersectionB=zeros(256,1);
    for i=1:256
        bI = freqBI(i);
        bII = freqBII(i);
        if bI <=bII
            intersectionB(i) = bI;
        else
            intersectionB(i) = bII;
        end
    end
end

