function output_args = ICV_rotate( imageMatrix, angle)
%the function perform rotation of the image by a given angle
[r, c]=size(imageMatrix);

transformedMatrix = zeros(r*2*2, c*2*2);
%find middle coordinates of the original image
midx=ceil((size(imageMatrix,1)+1)/2);
midy=ceil((size(imageMatrix,2)+1)/2);

%create amtrices for transformations
translatedMatrix=uint8(zeros(r*2, c*2));
translatedToOriginMatrix=uint8(zeros(r*2*2,c*2*2));

%values to shift x and y axes
tx=midx;
ty=midy;
%translate matrix 
for i=1:r
    ii=i + tx;%shift
    for j=1:c
        jj=j+ty;%shift
        translatedMatrix(ii,jj)=imageMatrix(i,j);
    end
end
% imshow(translatedMatrix);
%convert angle to radians
theta = ((360-angle)*pi)/180;
sit=sin(theta);
cot=cos(theta);
%rotate


%run through the values of the matrix where the images lies
%no need to go through the pixel that have no image
for i=(1+tx):((r*2)-tx)
    for j=(1+ty):((c*2)-ty)
        ii=(i*cot-j*sit) +(4*tx);%shift left in order to keep the full image
        ii=round(ii);
        jj=(i*sit+j*cot) +(4*ty);%shift up in order to keep the full image
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
% imshow(transformedMatrix)

output_args = transformedMatrix;
end

