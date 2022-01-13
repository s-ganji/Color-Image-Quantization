I = imread('image2.jpg');
if (size(I, 3) ~= 3)
    error('Input image must be RGB.')
end

nBins = 256;

redChannel = I(:, :, 1);
greenChannel = I(:, :, 2);
blueChannel = I(:, :, 3);

rHist = imhist(I(:,:,1), nBins);
gHist = imhist(I(:,:,2), nBins);
bHist = imhist(I(:,:,3), nBins);

hFig = figure;

subplot(2,1,1); 
imshow(I);
title('Input image');

subplot(2,1,2);
h(1) = area(1:nBins, rHist, 'FaceColor', 'r'); hold on; 
h(2) = area(1:nBins, gHist,  'FaceColor', 'g'); hold on; 
h(3) = area(1:nBins, bHist,  'FaceColor', 'b'); hold on; 
title('RGB image histogram');

