function output_args = ICV_drawNorthVector(motionVector, currentBlockI, currentBlockJ)
    for i=(currentBlockI):(currentBlockI+4)
        for j=(currentBlockJ):(currentBlockJ+4)
            if (i==(currentBlockI) && j==(2+currentBlockJ)) || (i==(2+currentBlockI) && j==(2+currentBlockJ)) || (i==(3+currentBlockI) && j==(2+currentBlockJ)) || (i==(4+currentBlockI) && j==(2+currentBlockJ)) || (i==(2+currentBlockI) && j==(currentBlockJ)) || (i==(2+currentBlockI) && j==(3+currentBlockJ))
                motionVector(i, j) = 255;
            end
        end
    end
    output_args = motionVector;
% output_args = [ 0,255,0,0;
%                 255,255,255,0;
%                 0,255,0,0;
%                 0,255,0,0];
end

