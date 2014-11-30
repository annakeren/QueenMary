function  output_args  = ICV_filterImage(imageMatrixGray, kernelMatrix)
%The function filters gray scale image provided kernel 
%Kernel can be of 3x3, 5x5, 7x7 dimensions only

    %convert integer to double
     imageMatrix=im2double(imageMatrixGray);
     [r, c]=size(imageMatrix);
    %define the dimensions of the kernel, only 3x3 ,  5x5, 7x7 are allowed
    [rKernel, cKernel]=size(kernelMatrix);
    filteredMatrixA = zeros(r, c);
    %check if it is 3x3 kernel
     if(rKernel == 3 && cKernel == 3)
    
%try generic implementation - 3x3 gives the same result as 3x3 not generic
for i=2:(r-2)
     for j=2:(c-2)
          convolutionSum = 0;
          for k = 1:rKernel
                for l = 1:cKernel
                      if((k == 2) && (l == 2) && (k == l))
                          continue%do not sum the mid pixel of the kernel
                      end
                        if (k == 1)
                            iIndex = i-1;
                        end
                        if (k == 2)
                            iIndex = i;
                        end
                        if (k == 3)
                            iIndex = i+1;
                        end
                        if (l == 1)
                            jIndex = j-1;
                        end
                        if (l == 2)
                            jIndex = j;
                        end
                        if (l == 3)
                            jIndex = j+1;
                        end
                        %the main logic of convolution
                        convolutionSum =convolutionSum + imageMatrix(iIndex, jIndex)*kernelMatrix(k, l);
                end
          end
          %save filtered image into another matrix
      filteredMatrixA(i, j) = convolutionSum;
     end
end
    %check if it is 5x5 kernel
     elseif(rKernel == 5 && cKernel == 5)
         for i=3:(r-3)
            for j=3:(c-3)
            convolutionSum = 0;
                for k = 1:rKernel
                    for l = 1:cKernel
                      if((k == 3) && (l == 3) && (k == l))
                          continue%do not sum the mid pixel of the kernel
                      end
                        if (k == 1)
                            iIndex = i-2;
                        end
                        if (k == 2)
                            iIndex = i-1;
                        end
                        if (k == 3)
                            iIndex = i;
                        end
                        if (k == 4)
                            iIndex = i+1;
                        end
                        if (k == 5)
                            iIndex = i+2;
                        end
                        if (l == 1)
                            jIndex = j-2;
                        end
                        if (l == 2)
                            jIndex = j-1;
                        end
                        if (l == 3)
                            jIndex = j;
                        end
                        if (l == 4)
                            jIndex = j+1;
                        end
                        if (l == 5)
                            jIndex = j+2;
                        end
                        %the main logic of convolution
                        convolutionSum =convolutionSum + imageMatrix(iIndex, jIndex)*kernelMatrix(k, l);
                    end
                end
                %save filtered image into another matrix
            filteredMatrixA(i, j) = convolutionSum;
            end
         end

     elseif(rKernel == 7 && cKernel == 7)
         for i=4:(r-4)
            for j=4:(c-4)
            convolutionSum = 0;
                for k = 1:rKernel
                    for l = 1:cKernel
                      if((k == 4) && (l == 4) && (k == l))
                          continue%do not sum the mid pixel of the kernel
                      end
                        if (k == 1)
                            iIndex = i-3;
                        end
                        if (k == 2)
                            iIndex = i-2;
                        end
                        if (k == 3)
                            iIndex = i-1;
                        end
                        if (k == 4)
                            iIndex = i;
                        end
                        if (k == 5)
                            iIndex = i+1;
                        end
                        if (k == 6)
                            iIndex = i+2;
                        end
                        if (k == 7)
                            iIndex = i+3;
                        end
                        if (l == 1)
                            jIndex = j-3;
                        end
                        if (l == 2)
                            jIndex = j-2;
                        end
                        if (l == 3)
                            jIndex = j-1;
                        end
                        if (l == 4)
                            jIndex = j;
                        end
                        if (l == 5)
                            jIndex = j+1;
                        end
                        if (l == 6)
                            jIndex = j+2;
                        end
                        if (l == 7)
                            jIndex = j+3;
                        end
                        %the main logic of convolution
                        convolutionSum =convolutionSum + imageMatrix(iIndex, jIndex)*kernelMatrix(k, l);
                    end
                end
                %save filtered image into another matrix
            filteredMatrixA(i, j) = convolutionSum;
            end
         end
    
     else error('expecting 3x3 0r 5x5 05 7x7 kernel');
     
     end
     filteredMatrixAU=im2uint8(filteredMatrixA);
     
 output_args=filteredMatrixAU;
 
end
