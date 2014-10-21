function output_args = ICV_rotate( imageMatrixColoured, angle)

imageMatrix= rgb2gray(imageMatrixColoured);
[r, c]=size(imageMatrix);

transformedMatrix = zeros(r*2, c*2);
midx=ceil((size(imageMatrix,1)+1)/2);
midy=ceil((size(imageMatrix,2)+1)/2);


translatedMatrix=uint8(zeros(r*2, c*2));
translatedToOriginMatrix=uint8(zeros(r,c));

%translate matrix
tx=midx;
ty=midy;

for i=1:r
    ii=i + tx;
    for j=1:c
        jj=j+ty;
        translatedMatrix(ii,jj)=imageMatrix(i,j);
    end
end
% imshow(translatedMatrix);
%rotate matrix
theta = ((360-angle)*pi)/180;
sit=sin(theta);
cot=cos(theta);

%try a new solution to rotate
for i=(1+tx):((r*2)-tx)
    for j=(1+ty):((c*2)-ty)
        ii=i*cot-j*sit;
        ii=round(ii);
        jj=i*sit+j*cot;
        jj=round(jj);       
        if ii<1
            ii = 1;
        end
        if jj<1
            jj = 1;
        end
        transformedMatrix(ii,jj)=translatedMatrix(i,j);
    end
end
imshow(transformedMatrix)
%translate to origins

for i=(1+tx):((r*2)-tx)
    for j=(1+ty):((c*2)-ty)
        ii=i+tx;
        jj=j+ty;
        if ii<1
            ii = 1;
        end
        if jj<1
            jj = 1;
        end
%         if (ii >=1 && jj>=1 && ii <((r)-1) && jj<((c)-1))
            translatedToOriginMatrix(ii,jj)=transformedMatrix(i,j);
%         end
    end
end
output_args = translatedToOriginMatrix;
end

