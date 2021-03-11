clear;
clc;
imgFull = imread("umaru.jpg");
 
R = double(imgFull(:,:,1));
G = double(imgFull(:,:,2));
B = double(imgFull(:,:,3));
 
% Konversi RGB to CMY
imgCmy = uint8(zeros(size(imgFull)));
 
rLay = zeros(length(R(:,1)),length(R));
gLay = zeros(length(R(:,1)),length(R));
bLay = zeros(length(R(:,1)),length(R));
 
for i = 1:length(R(:,1))
   for j = 1:length(R)
       rLay(i,j) = double(R(i,j))/255;
       gLay(i,j) = double(G(i,j))/255;
       bLay(i,j) = double(B(i,j))/255;
       
       imgCmy(i,j,1) = round((1 - rLay(i,j))*R(i,j));
       imgCmy(i,j,2) = round((1 - gLay(i,j))*G(i,j));
       imgCmy(i,j,3) = round((1 - bLay(i,j))*B(i,j));
       
%        C = round((1 - rLay)*R(i,j));
   end
end
 
for k = 1:3
   for i = 1:length(R(:,1))
      for j = 1:length(R)
         if imgCmy(i,j,k) < 85
             imgCmy(i,j,k) = imgCmy(i,j,k)*3;
         end
      end
   end
end
 
% Konversi RGB to HSI
imgHsi = uint8(zeros(size(imgFull)));
 
for i = 1:length(R(:,1))
    for j = 1:length(R)
        teta = acosd(0.5*((R(i,j)-G(i,j))+(R(i,j)-B(i,j)))/((R(i,j)-G(i,j))^2 + (R(i,j)-B(i,j))*(G(i,j)-B(i,j)))^0.5);
        if B(i,j) <= G(i,j)
            imgHsi(i,j,1) = round(teta);
        elseif B(i,j) > G(i,j)
            imgHsi(i,j,1) = round(360 - teta);
        end
        imgHsi(i,j,2) = round(1-3*(min([R(i,j) G(i,j) B(i,j)]))/(R(i,j)+G(i,j)+B(i,j)));
        imgHsi(i,j,3) = round((R(i,j)+G(i,j)+B(i,j))/3);
    end
end
 
% Konversi RGB to YUV
imgYuv = uint8(zeros(size(imgFull)));
 
imgYuv(:,:,1) = round(double(0.257*R+0.504*G+0.098*B+16));
imgYuv(:,:,2) = round(double(-0.148*R-0.291*G+0.439*B+128));
imgYuv(:,:,3) = round(double(0.439*R-0.368*G-0.071*B+128));
 
%Konversi RGB to YCbCr
imgYcbcr = uint8(zeros(size(imgFull)));
 
imgYcbcr(:,:,1) = round(16+(65.4810*R/255 + 128.5530*G/255 + 24.9660*B/255));
imgYcbcr(:,:,2) = round(128+(-37.7745*R/255 - 74.1592*G/255 + 111.9337*B/255));
imgYcbcr(:,:,3) = round(128+(111.9581*R/255 - 93.7509*G/255 - 18.2072*B/255));
 
% Hasil
subplot(2,3,1)
imshow(imgFull);
title("Original Pic");
subplot(2,3,2);
imshow(imgCmy);
title("RGB to CMY");
subplot(2,3,3);
imshow(imgHsi);
title("RGB to HSI");
subplot(2,3,4);
imshow(imgYuv);
title("RGB to YUV");
subplot(2,3,5);
imshow(imgYcbcr);
title("RGB to YCbCr");

