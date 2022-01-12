I = imread('image2.jpg');

image8bit = rgb2gray(I);

T = graythresh(I);
image1bit = im2bw(I,T);


figure

subplot(3,1,1);
imshow(I);
title('orginal image');

subplot(3,1,2);
imshow(image8bit);
title('8 bit grey level image');

subplot(3,1,3);
imshow(image1bit);
title('1 bit image');
