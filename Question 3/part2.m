I = imread('image2.jpg');
red = I(:,:,1);
green = I(:,:,1);
blue = I(:,:,1);

medfilimg(:,:,1)=medfilt2(red);
medfilimg(:,:,2)=medfilt2(green);
medfilimg(:,:,3)=medfilt2(blue);

figure
subplot(2,1,1);
imshow(I);
title('orginal image');

subplot(2,1,2);
imshow(medfilimg);
title('Image filtered with median cut filter');
