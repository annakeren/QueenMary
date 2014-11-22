function output_args = ICV_drawNorthWestVector(motionVector)
    for i=1:4
        for j=1:4
            if (i==1 && j==1 || (i==2 && j==2) || (i==3 && j==3) || (i==4 && j==4) || (i==2 && j==1) || (i==1 && j==2))
                motionVector(i, j) = 255;
            end
        end
    end
    output_args = motionVector;
% output_args = [ 255,255,255,0;
%                 255,255,0,0;
%                 0,0,255,0;
%                 0,0,0,255];
end


