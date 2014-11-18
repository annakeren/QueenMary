function output_args = ICV_skew( imageMatrix, angle)
%the function perform skewing of the image by a given angle
%the imageMatrix muste be gray scaled
[r, c]=size(imageMatrix);
skewedMatrix = zeros(r*2, c*2);

%main skewing logic
h=1/tand(angle);

for i=1:r
    for j=1:c
        ii=i+h*j;
        jj=j+h*i;
        ii=round(ii);
        jj=round(jj);
        skewedMatrix(ii,jj)=imageMatrix(i,j);
    end
end
output_args = skewedMatrix;
end

