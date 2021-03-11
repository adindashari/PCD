import pylab as plt
import matplotlib.image as mpimg
import numpy as np
import time
 
img = mpimg.imread('C:\Users\Asus\Pictures\umaru.jpg')
 
B = img[:, :, 0]
G = img[:, :, 1]
R = img[:, :, 2]
 
 
B_ = np.copy(B) 
G_ = np.copy(G)
R_ = np.copy(R)
 
Kb = np.zeros_like(B)
 
K = np.uint8(np.zeros_like(B)) 
C = np.uint8(np.zeros_like(B))
M = np.uint8(np.zeros_like(B)) 
Y = np.uint8(np.zeros_like(B)) 
 
 
for i in range(B.shape[0]):
    for j in range(B.shape[1]):
        B_[i, j] = B[i, j]/255
        G_[i, j] = G[i, j]/255
        R_[i, j] = R[i, j]/255
 
        Kb[i, j] = (min(1-B_[i, j], 1-G_[i, j], 1-R_[i, j]))
       
        if (K[i,j] == 1):
            C[i, j] = 0
            M[i, j] = 0  
            Y[i, j] = 0
            
        else:
 
            C[i, j] = round(float((1 - R_[i, j] - 0.4*Kb[i, j])*255))
            M[i, j] = round(float((1 - G_[i, j] - 0.4*Kb[i, j])*255))
            Y[i, j] = round(float((1 - B_[i, j] - 0.4*Kb[i, j])*255))
            K[i,j] = Kb[i,j]*255
 
 
CMYK = C + M + Y + K 
# CMYK = np.uint8(CMYK)
 
# show old and new image
# show original image
plt.subplot(121)
plt.imshow(img)
plt.title('original image')
# plt.set_cmap('rgb')
# show original image
plt.subplot(122)
plt.imshow(CMYK)
plt.title('cmyk')
# plt.set_cmap('cmyk')
plt.show()
