function output_args = ICV_rotate( imageMatrix, angle)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[r, c]=size(imageMatrix);
transformedMatrix = zeros(r, c);

translatedMatrix=zeros(r+(r/8),c+(c/8));
%translate matrix
tx=r/8;

ty=c/8;

for i=1:r

    for j=1:c

        ii=i-tx;

        jj=j-ty;

        if (ii >=1 && jj>=1 && ii <(r-1) && jj<(c-1))

            translatedMatrix(ii,jj)=imageMatrix(i,j);

        end

    end

end

%rotate matrix
theta = ((360-angle)*pi)/180;

sit=sin(theta);

cot=cos(theta);

for i=1:r

    for j=1:c

        ii=i*cot-j*sit;

        ii=round(ii);

        jj=i*sit+j*cot;

        jj=round(jj);

        if (ii >=1 && jj>=1 && ii <(r-1) && jj<(c-1))

            transformedMatrix(ii,jj)=translatedMatrix(i,j);

        end

    end

end
%translate to origins


translatedToOriginMatrix=zeros(r+(r/8),c+(c/8));

for i=1:r

    for j=1:c

        ii=i+tx;

        jj=j+ty;

        if (ii >=1 && jj>=1 && ii <(r-1) && jj<(c-1))

            translatedToOriginMatrix(ii,jj)=transformedMatrix(i,j);

        end

    end

end
output_args = translatedToOriginMatrix;
end

