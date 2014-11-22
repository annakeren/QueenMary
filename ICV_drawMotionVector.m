function output_args = ICV_drawMotionVector(motionVector, currentBlockI, currentBlockJ)
    for i=(1+currentBlockI):(currentBlockI+4)
        for j=(1+currentBlockJ):(currentBlockJ+4)
            if (i==(2+currentBlockI) && j==(1+currentBlockJ)) || (i==(2+currentBlockI) && j==(2+currentBlockJ)) || (i==(2+currentBlockI) && j==(3+currentBlockJ)) || (i==(2+currentBlockI) && j==(4+currentBlockJ)) || (i==(1+currentBlockI) && j==(3+currentBlockJ)) || (i==(3+currentBlockI) && j==(3+currentBlockJ))
                motionVector(i, j) = 255;
            end
        end
    end
    output_args = motionVector;
end

