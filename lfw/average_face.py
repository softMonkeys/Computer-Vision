import os
import cv2
import numpy as np

path = "./George_W_Bush/"
images = os.listdir(path)

avg = np.zeros((250, 250, 3))

for image in images:
    # print(image)
    img = cv2.imread(path + image)
    # print(img, shape)
    avg += img

avg /= len(images)
cv2.imwrite("average.jpg", avg)
