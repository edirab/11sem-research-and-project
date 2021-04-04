### Cats and Dogs


Следуем примеру https://keras.io/examples/vision/image_classification_from_scratch/

1. Convert to ONNX format: https://github.com/onnx/tensorflow-onnx

- `pip install onnxruntime`
- `pip install -U tf2onnx`
- `python -m tf2onnx.convert --saved-model . --output model.onnx`

2. Optimize for inference

```
(tf-2) E:\University\11sem\nirs\NeuralNet\Cats_Dogs>python optimize_for_inference.py -h
2021-03-31 18:08:05.142277: I tensorflow/stream_executor/platform/default/dso_loader.cc:49] Successfully opened dynamic library cudart64_110.dll
usage: optimize_for_inference.py [-h] [--input INPUT] [--output OUTPUT] [--input_names INPUT_NAMES]
                                 [--output_names OUTPUT_NAMES] [--frozen_graph [FROZEN_GRAPH]]
                                 [--placeholder_type_enum PLACEHOLDER_TYPE_ENUM]
                                 [--toco_compatible TOCO_COMPATIBLE]

optional arguments:
  -h, --help            show this help message and exit
  --input INPUT         TensorFlow 'GraphDef' file to load.
  --output OUTPUT       File to save the output graph to.
  --input_names INPUT_NAMES
                        Input node names, comma separated.
  --output_names OUTPUT_NAMES
                        Output node names, comma separated.
  --frozen_graph [FROZEN_GRAPH]
                        If true, the input graph is a binary frozen GraphDef file; if false, it is a text GraphDef
                        proto file.
  --placeholder_type_enum PLACEHOLDER_TYPE_ENUM
                        The AttrValue enum to use for placeholders. Or a comma separated list, one value for each
                        placeholder.
  --toco_compatible TOCO_COMPATIBLE
                        If true, only use ops compatible with Tensorflow Lite Optimizing Converter.
```