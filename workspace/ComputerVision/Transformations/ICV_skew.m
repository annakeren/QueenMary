function output_args = ICV_skew( imageMatrix, angle)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[r, c]=size(imageMatrix);
skewedMatrix = zeros(r, c);

h=atan(angle);

for i=1:r

    for j=1:c

        ii=i+h*j;
        jj=j+h*i;
        ii=round(ii);
        jj=round(jj);


        if (ii >=1 && jj>=1 && ii <(r-1) && jj<(c-1))

            skewedMatrix(ii,jj)=imageMatrix(i,j);

        end

    end

end
output_args = skewedMatrix;
end

