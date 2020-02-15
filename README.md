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

## Usage

```bash
$ docker build -f Dockerfile --tag coral-classify-cpu .
# $ sudo docker build -f Dockerfile.gpu.dockerfile --tag coral-classify-gpu .

$ mkdir experements
$ docker run --name edgetpu-classify \
--rm -it --privileged -p 6006:6006 \
--mount type=bind,src=${PWD}/experements,dst=/tensorflow/models/research/slim/transfer_learn \
coral-classify-cpu
```
```bash
# Now prepare the dataset:
$ ./prepare_checkpoint_and_dataset.sh --network_type mobilenet_v1 # mobilenet_v2 inception_v4

# Train with quantization-aware training
$ ./start_training.sh --network_type mobilenet_v1
# $ ./start_training.sh --network_type mobilenet_v1 --train_whole_model true

# evaluate
$ ./run_evaluation.sh --network_type mobilenet_v1

# convert to tf_lite 
$ ./convert_checkpoint_to_edgetpu_tflite.sh --network_type mobilenet_v1 --checkpoint_num 300
``` 

```bash
# Compile the model:
$ edgetpu_compiler output_tflite_graph.tflite
```

```bash
# predict
$ python ./src/inference/classify_image.py \
--model output_tflite_graph_edgetpu.tflite \
--label labels.txt \
--input img.jpg
```