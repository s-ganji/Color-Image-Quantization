%dithering without error calculating
T = imread('image2.jpg');
I = imread('image2.jpg');
[M,N] = size(I);
for r = 1:M-1
    for c = 2:(N/3)-1
        
       tP = I(r,c);
       oldR = I(r,c,1);
       oldG = I(r,c,2);
       oldB = I(r,c,3);
       
       factor =3; 
       newR = round(factor*oldR/255)*(255/factor);
       I(r,c,1) = newR;
       newG = round(factor*oldG/255)*(255/factor);
       I(r,c,2) = newG;
       newB = round(factor*oldB/255)*(255/factor);
       I(r,c,3) = newB;
      
             
    end
end



%dithering with error calculating
G = imread('image2.jpg');
[M,N] = size(G);

for r = 1:M-1
    for c = 2:(N/3)-1
        
       tP = G(r,c);
       oldR = G(r,c,1);
       oldG = G(r,c,2);
       oldB = G(r,c,3);
       
       factor =3; 
       newR = round(factor*oldR/255)*(255/factor);
       G(r,c,1) = newR;
       newG = round(factor*oldG/255)*(255/factor);
       G(r,c,2) = newG;
       newB = round(factor*oldB/255)*(255/factor);
       G(r,c,3) = newB;
       
       errR = oldR - newR;
       errG = oldG - newG;
       errB = oldB - newB;
       
       G(r,c+1,1)= G(r,c+1,1)+ errR*7/16.0;
       G(r,c+1,2) = G(r,c+1,2) +errG *7/16.0;
       G(r,c+1,3) = G(r,c+1,3)+errB *7/16.0;
       
       G(r+1,c-1,1)= G(r+1,c-1,1)+ errR*3/16.0;
       G(r+1,c-1,2) = G(r+1,c-1,2) +errG *3/16.0;
       G(r+1,c-1,3) = G(r+1,c-1,3)+errB *3/16.0;
       
       G(r+1,c,1)= G(r+1,c,1)+ errR*5/16.0;
       G(r+1,c,2) = G(r+1,c,2) +errG *5/16.0;
       G(r+1,c,3) = G(r+1,c,3)+errB *5/16.0;
       
       G(r+1,c+1,1)= G(r+1,c+1,1)+ errR*1/16.0;
       G(r+1,c+1,2) = G(r+1,c+1,2) +errG *1/16.0;
       G(r+1,c+1,3) = G(r+1,c+1,3)+errB *1/16.0;
             
    end
end
figure

subplot(3,1,1);
imshow(T);
title('orginal image');

subplot(3,1,2);
imshow(I);
title('dithering without error calculation');

subplot(3,1,3);
imshow(G);
title('dithering with error calculation');
