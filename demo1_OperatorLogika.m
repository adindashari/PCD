clear;
clc;
imgFull1 = imread("umaru.jpg");
imgFull2 = imread("wp.jpg");
R = imgFull1(:,:,1); R2 = imgFull2(:,:,1);
G = imgFull1(:,:,2); G2 = imgFull2(:,:,2);
B = imgFull1(:,:,3); B2 = imgFull2(:,:,3);
img1 = uint8(zeros(length(R(:,1)),length(R)));
img2 = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
    for j = 1:length(R)
        img1(i,j) = 0.21*R(i,j)+0.71*G(i,j)+0.07*B(i,j);
        img2(i,j) = 0.21*R2(i,j)+0.71*G2(i,j)+0.07*B2(i,j);
    end
end 
imgBinAnd = uint8(zeros(length(R(:,1)),length(R)));
imgBinOr = uint8(zeros(length(R(:,1)),length(R)));
imgBinXor = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
    for j = 1:length(R)
       imgBinAnd(i,j) = bitand(imgGrey1(i,j), imgGrey2(i,j));
       imgBinOr(i,j) = bitor(imgGrey1(i,j), imgGrey2(i,j));
       imgBinXor(i,j) = bitxor(imgGrey1(i,j), imgGrey2(i,j));
    end
end
subplot(2,3,1);
imshow(img1);
title("1");
subplot(2,3,2);
imshow(img2);
title("2");
subplot(2,3,3);
imshow(imgBinAnd);
title("Operasi AND");
subplot(2,3,4);
imshow(imgBinOr);
title("Operasi OR");
subplot(2,3,5);
imshow(imgBinXor);
title("Operasi XOR");
