function  output_args  = ICV_filterImage(imageMatrixGray, kernelMatrix)
    %convert integer to double
     imageMatrix=im2double(imageMatrixGray);
     [r, c]=size(imageMatrix);
    %define the dimensions of the kernel, only 3x3 ,  5x5, 7x7 are allowed
    [rKernel, cKernel]=size(kernelMatrix);
    filteredMatrixA = zeros(r, c);
     if(rKernel == 3 && cKernel == 3)
    %3X3 filtering, not generic function

         for i=2:(r-2)
             for j=2:(c-2)
                 average1=imageMatrix(i-1, j-1)*kernelMatrix(1, 1);
                 average2 = imageMatrix(i  , j-1)*kernelMatrix(2, 1);
                 average3 = imageMatrix(i+1, j-1)*kernelMatrix(1, 3);
                 average4 = imageMatrix(i-1, j  )*kernelMatrix(1, 2);
                 average5 = imageMatrix(i+1, j  )*kernelMatrix(3, 2);
                 average6 = imageMatrix(i-1, j+1)*kernelMatrix(1, 3);         
                 average7 = imageMatrix(i  , j+1)*kernelMatrix(2, 3);           
                 average8 = imageMatrix(i+1, j+1)*kernelMatrix(3, 3);
                 filteredMatrixA(i, j) =(average1+average2+average3+average4+average5+average6+average7+average8);
             end
         end
        
     elseif(rKernel == 5 && cKernel == 5)
         for i=3:(r-3)
              for j=3:(c-3)
                 %I kept this piece of code not generic in order to trace
                 %the algorith of convolution

                 %like in case of 3x3 kernel
                 average1 = imageMatrix(i-1, j-1)*kernelMatrix(2, 2);
                 average2 = imageMatrix(i  , j-1)*kernelMatrix(3, 2);
                 average3 = imageMatrix(i+1, j-1)*kernelMatrix(2, 4);
                 average4 = imageMatrix(i-1, j  )*kernelMatrix(2, 3);
                 average5 = imageMatrix(i+1, j  )*kernelMatrix(4, 3);
                 average6 = imageMatrix(i-1, j+1)*kernelMatrix(2, 4);         
                 average7 = imageMatrix(i  , j+1)*kernelMatrix(3, 4);           
                 average8 = imageMatrix(i+1, j+1)*kernelMatrix(4, 4);
                 %add external row and column to fit 5x5 kernel
                 average9 = imageMatrix(i-2, j-2)*kernelMatrix(1, 1);
                 average10 = imageMatrix(i-1, j-2)*kernelMatrix(2, 1);
                 average11 = imageMatrix(i  , j-2)*kernelMatrix(3, 1);
                 average12 = imageMatrix(i+1, j-2)*kernelMatrix(4, 1);
                 average13 = imageMatrix(i+2, j-2)*kernelMatrix(5, 1);
                 average14 = imageMatrix(i-2, j-1)*kernelMatrix(1, 2);
                 average15 = imageMatrix(i-2, j  )*kernelMatrix(1, 3);
                 average16 = imageMatrix(i-2, j+1)*kernelMatrix(1, 4);
                 average17 = imageMatrix(i-2, j+2)*kernelMatrix(1, 5);
                 average18 = imageMatrix(i-1, j+2)*kernelMatrix(2, 5);
                 average19 = imageMatrix(i  , j+2)*kernelMatrix(3, 5);
                 average20 = imageMatrix(i+1, j+2)*kernelMatrix(4, 5);
                 average21 = imageMatrix(i+2, j+2)*kernelMatrix(5, 5);
                 average22 = imageMatrix(i+2, j+1)*kernelMatrix(5, 4);
                 average23 = imageMatrix(i+2, j  )*kernelMatrix(5, 3);
                 average24 = imageMatrix(i+2, j-1)*kernelMatrix(5, 2);


                 filteredMatrixA(i, j) =average1+average2+average3+average4+average5+average6+average7+average8+average9+average10+average11+average12+average13+average14+average15+average16+average17+average18+average19+average20+average21+average22+average23+average24; 
              end
          end
         
     elseif(rKernel == 7 && cKernel == 7)
         for i=4:(r-4)
              for j=4:(c-4)
                 %I kept this piece of code not generic in order to trace
                 %the algorith of convolution

                 %like in case of 3x3 kernel
                 average1 = imageMatrix(i-1, j-1)*kernelMatrix(2, 2);
                 average2 = imageMatrix(i  , j-1)*kernelMatrix(3, 2);
                 average3 = imageMatrix(i+1, j-1)*kernelMatrix(2, 4);
                 average4 = imageMatrix(i-1, j  )*kernelMatrix(2, 3);
                 average5 = imageMatrix(i+1, j  )*kernelMatrix(4, 3);
                 average6 = imageMatrix(i-1, j+1)*kernelMatrix(2, 4);         
                 average7 = imageMatrix(i  , j+1)*kernelMatrix(3, 4);           
                 average8 = imageMatrix(i+1, j+1)*kernelMatrix(4, 4);
                 %like in case of 5x5 kernel
                 average9 = imageMatrix(i-2, j-2)*kernelMatrix(1, 1);
                 average10 = imageMatrix(i-1, j-2)*kernelMatrix(2, 1);
                 average11 = imageMatrix(i  , j-2)*kernelMatrix(3, 1);
                 average12 = imageMatrix(i+1, j-2)*kernelMatrix(4, 1);
                 average13 = imageMatrix(i+2, j-2)*kernelMatrix(5, 1);
                 average14 = imageMatrix(i-2, j-1)*kernelMatrix(1, 2);
                 average15 = imageMatrix(i-2, j  )*kernelMatrix(1, 3);
                 average16 = imageMatrix(i-2, j+1)*kernelMatrix(1, 4);
                 average17 = imageMatrix(i-2, j+2)*kernelMatrix(1, 5);
                 average18 = imageMatrix(i-1, j+2)*kernelMatrix(2, 5);
                 average19 = imageMatrix(i  , j+2)*kernelMatrix(3, 5);
                 average20 = imageMatrix(i+1, j+2)*kernelMatrix(4, 5);
                 average21 = imageMatrix(i+2, j+2)*kernelMatrix(5, 5);
                 average22 = imageMatrix(i+2, j+1)*kernelMatrix(5, 4);
                 average23 = imageMatrix(i+2, j  )*kernelMatrix(5, 3);
                 average24 = imageMatrix(i+2, j-1)*kernelMatrix(5, 2);
                    
%                  average25 = imageMatrix(i-3, j-3)*kernelMatrix(1, 1);
%                  average26 = imageMatrix(i-1, j-2)*kernelMatrix(2, 1);
%                  average27 = imageMatrix(i  , j-2)*kernelMatrix(3, 1);
%                  average28 = imageMatrix(i+1, j-2)*kernelMatrix(4, 1);
%                  average29 = imageMatrix(i+2, j-2)*kernelMatrix(5, 1);
%                  average30 = imageMatrix(i-2, j-1)*kernelMatrix(1, 2);
%                  average31 = imageMatrix(i-2, j  )*kernelMatrix(1, 3);
%                  average32 = imageMatrix(i-2, j+1)*kernelMatrix(1, 4);
%                  average33 = imageMatrix(i-2, j+2)*kernelMatrix(1, 5);
%                  average34 = imageMatrix(i-1, j+2)*kernelMatrix(2, 5);
%                  average35 = imageMatrix(i  , j+2)*kernelMatrix(3, 5);
%                  average36 = imageMatrix(i+1, j+2)*kernelMatrix(4, 5);
%                  average37 = imageMatrix(i+2, j+2)*kernelMatrix(5, 5);
%                  average38 = imageMatrix(i+2, j+1)*kernelMatrix(5, 4);
%                  average39 = imageMatrix(i+2, j  )*kernelMatrix(5, 3);
%                  average40 = imageMatrix(i+2, j-1)*kernelMatrix(5, 2);
                 
                 
                 

                 filteredMatrixA(i, j) =average1+average2+average3+average4+average5+average6+average7+average8+average9+average10+average11+average12+average13+average14+average15+average16+average17+average18+average19+average20+average21+average22+average23+average24; 
              end
          end
         
     else error('expecting 3x3 0r 5x5 05 7x7 kernel');
     

     end
     filteredMatrixAU=im2uint8(filteredMatrixA);
     
 output_args=filteredMatrixAU;
 
end
