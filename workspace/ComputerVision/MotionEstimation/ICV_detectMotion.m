function output_args = ICV_detectMotion(blockKL, blockKand1L, br, bc, motionSuspect)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        for i=1:br
            for j=1:bc
                kAnd1Value = blockKand1L(i, j);
                kValue = blockKL(i, j);
                if kAnd1Value ~= kValue
                    motionSuspect = 1;
                    break;
                end
            end
            if motionSuspect == 1;
                break;
            end
        end
    output_args = motionSuspect;
end

