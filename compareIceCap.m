% This script will compare the decrease in glacier ice mass between the
% year 1988 and 2010
%
% compareIceCap.m
% Written by Suvam S. Patel
% 11/20/2019
%
%--------------------------------------------------------------------------

% load image
iMat1988 = imread('Quelccaya_19880903.jpg');
iMat2010 = imread('Quelccaya_20100916.jpg');

% Pre-Allocate to white pixels(1)
iMat1988B = ones(size(iMat1988));
iMat2010B = ones(size(iMat2010));

% Loop through the rows and cols of the image iMat1988
[rows, cols, z]=size(iMat1988);
count1988B = 0;
for i=1:rows
    for j=1:cols
        if iMat1988(i,j,1)<100 && iMat1988(i,j,2)>130 && iMat1988(i,j,3)>155
            iMat1988B(i,j,1)=0;
            iMat1988B(i,j,2)=0;
            iMat1988B(i,j,3)=0;
            count1988B = count1988B + 1;
        end
    end
end

% Loop through the rows and cols of the image iMat2010
[rows, cols, z]=size(iMat2010);
count2010B = 0;
for i=1:rows
    for j=1:cols
        if iMat2010(i,j,1)<100 && iMat2010(i,j,2)>130 && iMat2010(i,j,3)>155
            iMat2010B(i,j,1)=0;
            iMat2010B(i,j,2)=0;
            iMat2010B(i,j,3)=0;
            count2010B = count2010B + 1;
        end
    end
end

% Calculate total surface area of Ice Caps
SurfaceArea1988 = 0.0009 * count1988B;
SurfaceArea2010 = 0.0009 * count2010B;
Change = SurfaceArea2010 - SurfaceArea1988;
RateofChange = Change/22;

% Display calculations
fprintf('Total Ice Cap Areas \n');
fprintf('1988: %.2f km^2 \n', SurfaceArea1988);
fprintf('2010: %.2f km^2 \n', SurfaceArea2010);
fprintf('Total change: %.2f km^2 \n', Change);
fprintf('Rate of change: %.2f km^2/year \n', RateofChange);

% plot result
subplot(2,2,1);
imagesc(iMat1988);
axis('equal','tight');
colormap(gray);
title('RAW image 1988');

subplot(2,2,2);
imagesc(iMat1988B);
axis('equal','tight');
title('Quelccaya Ice Cap Extent: 1988');

subplot(2,2,3);
imagesc(iMat2010);
axis('equal','tight');
colormap(gray);
title('RAW image 2010');

subplot(2,2,4);
imagesc(iMat2010B);
axis('equal','tight');
title('Quelccaya Ice Cap Extent: 2010');



