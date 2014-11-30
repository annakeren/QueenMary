function output_args = ICV_drawNorthEastVector(motionVector)
    for i=1:4
        for j=1:4
            if (i==4 && j==1 || (i==3 && j==2) || (i==2 && j==3) || (i==1 && j==4) || (i==1 && j==3) || (i==2 && j==4))
                motionVector(i, j) = 255;
            end
        end
    end
    output_args = motionVector;
%     output_args = [ 0,255,255,255;
%                     0,0,255,255;
%                     0,255,0,0;
%                     255,0,0,0];
end

