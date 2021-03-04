imgFull = imread("umaru.jpg");
 
R = imgFull(:,:,1);
G = imgFull(:,:,2);
B = imgFull(:,:,3);
 
imgRes = 0.21*R+0.71*G+0.07*B;
 
imgFin = uint8(zeros(length(imgRes(:,1)), length(imgRes)));
 
% Filter menggunakan 1/9
% Membuat penampung untuk difilter
imFil = zeros(length(R(:,1))+2,length(R)+2);
 
% Mengambil sisi pojok matriks lama + matriks lama
for i = 1:(length(imgRes(:,1))+2)
   for j = (1:length(imgRes)+2)
%     tutup atas matriks baru
      if i == 1
           if j == 1
               imFil(i,j) = imgRes(1,1);
           elseif j == (length(imgRes)+2)
               imFil(i,j) = imgRes(i,j-2);
           elseif j > 1 && j < (length(imgRes)+2)
               imFil(i,j) = imgRes(i,j-1);
           end
%     Mengisi bagian tengah dan pojok kanan kiri
      elseif i > 1 && i < (length(R(:,1))+2)
          if j == 1
              imFil(i,j) = imgRes((i-1),1);
          elseif j == (length(imgRes)+2)
              imFil(i,j) = imgRes((i-1),(j-2));
          elseif j > 1 && j < (length(imgRes)+2)
              imFil(i,j) = imgRes((i-1),(j-1));
          end
%     Mengisi tutup bawah
      elseif i == (length(imgRes(:,1))+2)
          if j == 1
              imFil(i,j) = imgRes((i-2),1);
          elseif j == (length(imgRes)+2)
              imFil(i,j) = imgRes((i-2),(j-2));
          elseif j > 1 && j < (length(imgRes)+2)
              imFil(i,j) = imgRes((i-2),(j-1));
          end
      end
      
   end
end
 
% Memulai looping untuk filterisasi matriks 3x3 metode average
for i = 1:length(imgRes(:,1))
   for j = 1:length(imgRes)
       imgFin(i,j) = round((0.0625*imFil(i,j))+(0.125*imFil(i,j+1))+(0.0625*imFil(i,j+2))+(0.125*imFil(i+1,j))+(0.25*imFil(i+1,j+1))+(0.125*imFil(i+1,j+2))+(0.0625*imFil(i+2,j))+(0.125*imFil(i+2,j+1))+(0.0625*imFil(i+2,j+2)));
       imgFin(i,j) = 30*(imgRes(i,j) - imgFin(i,j));
       if imgFin(i,j) < 123
           imgFin(i,j) = imgRes(i,j)*0.5;
       end
   end
end
 
% Menampilkan dan membandingkan kedua citra
imshow(imFil);
imshow(imgRes);
subplot(1,2,1);
imshow(imgRes);
title("Asli");
subplot(1,2,2);
imshow(imgFin);
title("High Pass / spatial sharpening");
