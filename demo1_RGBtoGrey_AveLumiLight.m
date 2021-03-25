clear
clc
imgFull = imread("umaru.png");
R = imgFull(:,:,1);
G = imgFull(:,:,2);
B = imgFull(:,:,3);
imgRes = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgRes(i,j) = (R(i,j)+G(i,j)+B(i,j))/3;
   end
end
subplot(1,3,1);
imshow(imgRes);
title("average");
imgRes2 = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgRes2(i,j) = 0.21*R(i,j)+0.71*G(i,j)+0.07*B(i,j);
   end
end  
subplot(1,3,2);
imshow(imgRes2);
title("luminasity");
imgRes3 = uint8(zeros(length(R(:,1)),length(R))); 
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgRes3(i,j) =  (max([R(i, j) G(i, j) B(i, j)]) + min([R(i, j) G(i, j) B(i, j)])) / 2;
   end
end  
subplot(1,3,3);
imshow(imgRes3);
title("lightness");
