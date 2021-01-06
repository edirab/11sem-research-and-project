### Пример загрузки и использования предобученного графа

https://docs.opencv.org/4.4.0/d5/de7/tutorial_dnn_googlenet.html

- Используется сборка OpenCV 4.4.0 + CUDA + DNN, VS 2019


integratingNN.exe --model=bvlc_googlenet.caffemodel --config=bvlc_googlenet.prototxt --width=224 --height=224 --classes=classification_classes_ILSVRC2012.txt --input=space_shuttle.jpg --mean="104 117 123"