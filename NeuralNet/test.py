import cv2 as cv

#cap = cv.VideoCapture("C:/home.mp4", cv.CAP_FFMPEG)
#cap = cv.VideoCapture("C:/home.mp4", cv.CAP_GSTREAMER)
cap = cv.VideoCapture("C:/home.mp4")
#cap = cv.VideoCapture(0, cv.CAP_FFMPEG)

while True:
    _, frame = cap.read()


    scale_percent = 50 # percent of original size
    width = int(frame.shape[1] * scale_percent / 100)
    height = int(frame.shape[0] * scale_percent / 100)
    dim = (width, height) 

    frame = cv.resize(frame, dim)
    cv.imshow("Frame", frame)
    
    
    cv2.dnn.readNetFromTensorflow('./docking_model/saved_model.pb', './docking_model/graph.pbtxt')
    rows, cols, channels = frame.shape
 
    # Use the given image as input, which needs to be blob(s).
    tensorflowNet.setInput(cv2.dnn.blobFromImage(frame, size=(300, 300), swapRB=True, crop=False))
    networkOutput = tensorflowNet.forward()
    
    cv.waitKey(10)
    
cv.waitKey(0)