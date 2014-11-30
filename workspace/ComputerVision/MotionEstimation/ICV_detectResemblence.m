function output_args = ICV_detectResemblence(blockKL, blockKand1L, br, bc, resembles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

resemblenceCounter = 0;
    for i=1:br
            for j=1:bc
                kAnd1Value = blockKand1L(i, j);
                kValue = blockKL(i, j);
                if kAnd1Value == kValue
                    %increase counter every time two pixels equal in two
                    %frames' blocks
                    resemblenceCounter = resemblenceCounter + 1;
                end
            end
    end
    
    %how much resemblence we are seekining
    resemblenceFactor = (br*bc - 4);
if (resemblenceCounter >=  resemblenceFactor)
    resembles = 1;
end
output_args = resembles;
end

