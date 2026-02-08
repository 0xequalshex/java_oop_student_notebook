FROM jupyter/base-notebook:latest

USER root

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip \
    && unzip ijava-1.3.0.zip \
    && python3 install.py --sys-prefix \
    && rm ijava-1.3.0.zip install.py

USER ${NB_USER}
