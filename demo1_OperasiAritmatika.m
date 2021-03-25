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
imgFull2 = imread("umaru.jpg");
R2 = imgFull2(:,:,1);
G2 = imgFull2(:,:,2);
B2 = imgFull2(:,:,3);
imgGrey2 = uint8(zeros(length(R2(:,1)),length(R2)));
for i = 1:length(R2(:,1))
   for j = 1:length(R2)
       imgGrey2(i,j) = 0.21*R2(i,j)+0.71*G2(i,j)+0.07*B2(i,j);
   end
end
subplot(1,3,1);
imshow(imgGrey);
title("1");
subplot(1,3,2);
imshow(imgGrey2);
title("2");
subtract = uint8(zeros(length(R2(:,1)),length(R2)));
 
for i = 1:length(R(:,1))
    for j = 1:length(R)
        subtract(i,j) = imgGrey2(i,j) - imgGrey(i,j);
    end
end
subplot(1,3,3);
imshow(subtract);
title("Subtract img");
