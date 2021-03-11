clear
clc
imgFull = imread("umaru.jpg");
 
imgSharpening = uint8(zeros(size(imgFull)));
 
% Filter menggunakan 1/9
% Membuat penampung untuk difilter
imFil = zeros(length(imgFull(:,1))+2,length(imgFull)+2,3);
 
% Mengambil sisi pojok matriks lama + matriks lama
for k = 1:3
    for i = 1:(length(imgFull(:,1))+2)
       for j = (1:length(imgFull)+2)
    %     tutup atas matriks baru
          if i == 1
               if j == 1
                   imFil(i,j,k) = imgFull(1,1,k);
               elseif j == (length(imgFull)+2)
                   imFil(i,j,k) = imgFull(i,j-2,k);
               elseif j > 1 && j < (length(imgFull)+2)
                   imFil(i,j,k) = imgFull(i,j-1,k);
               end
    %     Mengisi bagian tengah dan pojok kanan kiri
          elseif i > 1 && i < (length(imgFull(:,1))+2)
              if j == 1
                  imFil(i,j,k) = imgFull((i-1),1,k);
              elseif j == (length(imgFull)+2)
                  imFil(i,j,k) = imgFull((i-1),(j-2),k);
              elseif j > 1 && j < (length(imgFull)+2)
                  imFil(i,j,k) = imgFull((i-1),(j-1),k);
              end
    %     Mengisi tutup bawah
          elseif i == (length(imgFull(:,1))+2)
              if j == 1
                  imFil(i,j,k) = imgFull((i-2),1,k);
              elseif j == (length(imgFull)+2)
                  imFil(i,j,k) = imgFull((i-2),(j-2),k);
              elseif j > 1 && j < (length(imgFull)+2)
                  imFil(i,j,k) = imgFull((i-2),(j-1),k);
              end
          end
 
       end
    end
end
 
% Memulai looping untuk filterisasi matriks 3x3 metode average dan
% melakukan border sharpening image
for k = 1:3
    for i = 1:length(imgFull(:,1))
       for j = 1:length(imgFull)
           imgSharpening(i,j,k) = 30*(imgFull(i,j,k)-round((0.1111*imFil(i,j,k))+(0.1111*imFil(i,j+1,k))+(0.1111*imFil(i,j+2,k))+(0.1111*imFil(i+1,j,k))+(0.1111*imFil(i+1,j+1,k))+(0.1111*imFil(i+1,j+2,k))+(0.1111*imFil(i+2,j,k))+(0.1111*imFil(i+2,j+1,k))+(0.1111*imFil(i+2,j+2,k))));
           if imgSharpening(i,j,k) < 50
              imgSharpening(i,j,k) = round(imgFull(i,j,k)*0.75);
           end
       end
    end
end
 
% Menampilkan image plot
subplot(1,2,1);
imshow(imgFull);
title("Asli");
subplot(1,2,2);
imshow(imgSharpening);
title("Spatial sh");