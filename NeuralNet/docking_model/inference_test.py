	
# How to load a Tensorflow model using OpenCV
# Jean Vitor de Paulo Blog - https://jeanvitor.com/tensorflow-object-detecion-opencv/
 
import cv2
import os

print(os.getcwd())
 
# Load a model imported from Tensorflow
tensorflowNet = cv2.dnn.readNetFromTensorflow('saved_model.pb', 'rb')
 
# Input image
img = cv2.imread('../pyramid0639.jpg.jpeg')
rows, cols, channels = img.shape
 
# Use the given image as input, which needs to be blob(s).
tensorflowNet.setInput(cv2.dnn.blobFromImage(img, size=(768, 461), swapRB=True, crop=False))
 
# Runs a forward pass to compute the net output
networkOutput = tensorflowNet.forward()
 
print(type(networkOutput))
print(str(networkOutput))
 
# Show the image with a rectagle surrounding the detected objects 
cv2.imshow('Image', img)
cv2.waitKey()
cv2.destroyAllWindows()