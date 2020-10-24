[![Docker Stars](https://img.shields.io/docker/stars/cometurrata/fseam.svg?style=flat-square)](https://hub.docker.com/r/cometurrata/fseam/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cometurrata/fseam.svg?style=flat-square)](https://hub.docker.com/r/cometurrata/fseam/)


Fseam Docker image
=======================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[Fseam](https://github.com/FreeYourSoul/FSeam).

Download size of this image is only:

[![](https://images.microbadger.com/badges/image/cometurrata/fseam.svg)](http://microbadger.com/images/cometurrata/fseam "Get your own image badge on microbadger.com")


Usage Example
-------------

```bash
# Get Fseam tutorial
git clone https://github.com/cometurrata/FSeam_Tutorial;
cd FSeam_tutorial;

# Run the docker:
docker run --rm -d -t --privileged --name fseam  -v `pwd`:/app  cometurrata/fseam:latest bash;

# Open an interactive terminal into the running docker
docker exec -it -w /app fseam bash;

# Just run the commands like you would on your own bash
cmake -DFSEAM_USE_CATCH2=ON ./ ;
make all -j$(nproc);
make test;
```
