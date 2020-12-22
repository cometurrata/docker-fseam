FROM ubuntu:18.04

ENV PYTHONUNBUFFERED=1

# Install cmake
RUN apt-get update && apt-get install -y cmake  make gcc g++ libc-dev git bash; \
    echo "**** install Python ****" && \
    apt-get install -y python3  && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    apt install -y python3-pip &&  \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi


# Required for FSEAM
RUN pip3 install ply
RUN apt update && apt install -y git libssl-dev gcc-multilib g++-multilib

# Install cmake 
RUN git clone https://gitlab.kitware.com/cmake/cmake.git && \
    cd cmake; \
    git checkout v3.19.0-rc1-102-g424093e83d;  \
    ./bootstrap && \
    make && \
    make install


# Install catch2 at v2.13.2
RUN git clone https://github.com/catchorg/Catch2.git; \
    cd /Catch2; \
    git checkout v2.13.2; \
    mkdir build && cd build ; \
    cmake .. -DBUILD_TESTING=OFF; \
    make install;

# Install Fseam
RUN git clone https://github.com/FreeYourSoul/FSeam.git; \
    cd /FSeam ; \
    git checkout 2c0e6e7; \
    mkdir -p /FSeam/build;  \
    cd /FSeam/build; \
    cmake ..;  \
    make;  \
    make test;     \
    make install;

WORKDIR /
