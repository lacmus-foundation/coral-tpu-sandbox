FROM tensorflow/tensorflow:1.11.0-rc2-devel

RUN apt update && apt install -y curl wget

RUN mkdir /tensorflow/models
COPY ./src /tensorflow/models
ARG work_dir=/tensorflow/models/research/slim
copy ./classify_scripts ${work_dir}
WORKDIR ${work_dir}