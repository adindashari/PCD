clear
clc
imgFull = imread("umaru.jpg");
R = imgFull(:,:,1);
G = imgFull(:,:,2);
B = imgFull(:,:,3);
imgGrey = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgGrey(i,j) = 0.21*R(i,j)+0.71*G(i,j)+0.07*B(i,j);
   end
end
imgDb = double(imgGrey);
bPlane1 = mod(imgDb, 2);
bPlane2 = mod(floor(imgDb/2), 2);
bPlane3 = mod(floor(imgDb/4), 2);
bPlane4 = mod(floor(imgDb/8), 2);
bPlane5 = mod(floor(imgDb/16), 2);
bPlane6 = mod(floor(imgDb/32), 2);
bPlane7 = mod(floor(imgDb/64), 2);
bPlane8 = mod(floor(imgDb/128), 2);
combine = (2*(2*(2*(2*(2*(2*(2*bPlane8+bPlane7)+bPlane6)+bPlane5)+bPlane4)+bPlane3)+bPlane2)+bPlane1);
resFin = uint8(combine);

subplot(2,5,1);
imshow(imgGrey);
title("Real Pic");
subplot(2,5,2);
imshow(bPlane1);
title("Bit plane 1");
subplot(2,5,3);
imshow(bPlane2);
title("Bit plane 2");
subplot(2,5,4);
imshow(bPlane3);
title("Bit plane 3");
subplot(2,5,5);
imshow(bPlane4);
title("Bit plane 4");
subplot(2,5,6);
imshow(bPlane5);
title("Bit plane 5");
subplot(2,5,7);
imshow(bPlane6);
title("Bit plane 6");
subplot(2,5,8);
imshow(bPlane7);
title("Bit plane 7");
subplot(2,5,9);
imshow(bPlane8);
title("Bit plane 8");
subplot(2,5,10);
imshow(resFin);
title("Bit plane combine");

