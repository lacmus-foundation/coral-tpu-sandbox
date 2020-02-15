# coral-tpu-sandbox
tpu sandbox for project hack (spb 2020)

## useful links and tips
- https://coral.ai/models/ - tpu model zoo
  - MobileNet V2 (ImageNet) - http://download.tensorflow.org/models/tflite_11_05_08/mobilenet_v2_1.0_224_quant.tgz
  - EfficientNet-EdgeTpu (M) - https://storage.googleapis.com/cloud-tpu-checkpoints/efficientnet/efficientnet-edgetpu-M.tar.gz
*train*
- retrain model https://coral.ai/docs/edgetpu/retrain-classification/
- retrain model on-device https://coral.ai/docs/edgetpu/retrain-classification-ondevice-backprop/
- Model quantization (TF_LITE) https://www.tensorflow.org/lite/performance/model_optimization
- Quantization-aware training (TF_LITE) https://github.com/tensorflow/tensorflow/tree/r1.13/tensorflow/contrib/quantize
