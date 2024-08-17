FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt update

RUN apt-get install -y cmake gcc git

RUN git clone --recursive https://github.com/IoLanguage/io.git

WORKDIR /workspace/io/build

RUN cmake -DCMAKE_BUILD_TYPE=release .. \
    && make \
    && make install

RUN io setup.io

WORKDIR /code

COPY bin .

CMD "./run.sh"