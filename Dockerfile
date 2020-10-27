from frolvlad/alpine-python3

# Install cmake
RUN apk --no-cache add cmake libressl-dev make gcc g++ libc-dev git linux-headers bash

# Required for FSEAM
RUN pip3 install ply

# Install catch2 at v2.13.2
RUN git clone https://github.com/catchorg/Catch2.git; \
    cd /Catch2; \
    git checkout v2.13.2; \
    mkdir build && cd build ; \
    cmake .. -DBUILD_TESTING=OFF; \
    make install;

# Install Fseam
RUN git clone https://github.com/FreeYourSoul/FSeam.git; \
    mkdir -p /FSeam/build;  \
    cd /FSeam/build; \
    cmake ..;  \
    make;  \
    make test;     \
    make install;

