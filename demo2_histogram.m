imgFull = imread("umaru.jpg");
 
imgRes = imgFull;
 
imgCopy = uint8(zeros(size(imgFull)));
 
% imgRes = histeq(imgFull);
 
for m = 1:3
   
    color = imgFull(:,:,m);
    
    % Mencari max grey
    maxGrey = max(max(color));
 
    % Menampung data jumlah grey level
    dataGrey = zeros(maxGrey+1,1);
 
    for i = 1:maxGrey+1
        for j = 1:length(color(:,1))
            for k = 1:length(color)
                if color(j,k) == i
                    dataGrey(i) = dataGrey(i) + 1;
                end
    %             dataGrey(color(j,k)+1) = dataGrey(color(j,k)+1)+1;
            end
        end  
    end
 
    dataGrey = dataGrey / (length(color(:,1))*length(color)); 
 
    % sumGrey = sum(dataGrey);
 
    normSumGrey = zeros(maxGrey+1,1);
 
    % Proses normalisasi histogram gery level
    for i = 0:maxGrey
        if i == 0
            normSumGrey(i+1) = dataGrey(i+1);
        else
            normSumGrey(i+1) = dataGrey(i+1)+normSumGrey(i);
        end
    end
 
    normSumGrey = round(normSumGrey*255);
 
    % Membuat gambar berdasarkan normalisasi
    imgFin = uint8(zeros(length(imgRes(:,1)), length(imgRes)));
 
    for i = 0:maxGrey
       for j = 1:length(color(:,1))
          for k = 1:length(color)
              if color(j,k) == i
                  imgRes(j,k,m) = normSumGrey(i+1);
              end
          end
       end
    end
    
end
 
subplot(2,2,1);
imshow(imgFull);
title("Asli");
subplot(2,2,2);
imshow(imgRes);
title("normalisasi");
subplot(2,2,3);
histogram(imgFull);
title("Asli");
subplot(2,2,4);
histogram(imgRes);
title("normalisasi");
