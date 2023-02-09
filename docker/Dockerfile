# Ubuntu Linux as the base image
FROM ubuntu:22.04

# Set UTF-8 encoding
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install Python
RUN apt-get update && apt-get install -y python3 python3-pip
# RUN apt-get -y update && apt-get -y upgrade
# The following line ensures that the subsequent install doesn't expect user input
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install python3-pip python3-dev

# Install spaCy
RUN pip3 install transformers
RUN pip3 install --upgrade pip
RUN pip3 install spacy
RUN python3 -m spacy download en_core_web_lg
RUN pip3 install nltk
RUN python3 -m nltk.downloader punkt
RUN apt-get -y install git
RUN git clone https://github.com/patil-suraj/question_generation.git
RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
RUN pip3 install sentencepiece
RUN pip3 install protobuf==3.20.*

WORKDIR /question_generation

# Add the files into container, under QA folder, modify this based on your need

ADD ask .
ADD answer .
# ADD deepset ./deepset
# ADD deepset_tok ./deepset_tok

# Change the permissions of programs
CMD ["chmod 777 ./question_generation/*"]

# Set working dir as /QA
WORKDIR /question_generation
ENTRYPOINT ["/bin/bash", "-c"]
