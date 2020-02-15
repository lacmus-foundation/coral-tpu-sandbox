FROM tensorflow/tensorflow:1.11.0-rc2-devel-gpu

COPY src/* /tensorflow/models
ARG work_dir=/tensorflow/models/research/slim
copy classify_scripts/* ${work_dir}
WORKDIR ${work_dir}