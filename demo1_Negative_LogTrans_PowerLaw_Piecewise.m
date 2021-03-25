clear
clc
imgFull = imread("umaru.jpg");
R = imgFull(:,:,1);
G = imgFull(:,:,2);
B = imgFull(:,:,3);
imgRes = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgRes(i,j) = 0.21*R(i,j)+0.71*G(i,j)+0.07*B(i,j);
   end
end
greyMax = max(imgRes(:));
subplot(2,3,1);
imshow(imgRes);
title("Grey Pic");
imgNeg = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       imgNeg(i,j) = greyMax - imgRes(i,j);
   end
end
subplot(2,3,2);
imshow(imgNeg);
title("Negative Pic");
imgLog = uint8(zeros(length(R(:,1)),length(R)));
for i = 1:length(R(:,1))
   for j = 1:length(R)
       temp = double(imgRes(i,j));
       imgLog(i,j) = 40*log(1+temp);
   end
end
subplot(2,3,3);
imshow(imgLog);
title("Log transformation");
imgPowLaw = uint8(zeros(length(R(:,1)),length(R)));
    imgRes1 = uint8(zeros(length(R(:,1)),length(R)));
    for i = 1:length(R(:,1))
       for j = 1:length(R)
           imgRes1(i,j) = (R(i,j)+G(i,j)+B(i,j))/3;
       end
    end  
for i = 1:length(R(:,1))
   for j = 1:length(R)
      imgPowLaw(i,j) = 1*(imgRes1(i,j)^2); 
   end
end
subplot(2,3,4);
imshow(imgPowLaw);
title("Trans Pow Law");

