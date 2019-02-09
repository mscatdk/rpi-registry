# rpi-registry

Docker registry build for Raspberry PI and potentially other ARM devices

## How to use

The simplest way to get started is to run the command

```bash
docker run -d -p 5000:5000 mscatdk/rpi-registry:latest
```

The registry cache is stored in /var/lib/registry-cache; hence, the data can be stored locally by running.

```bash
docker run -d -p 5000:5000 -v /path/to/local/registry-cache:/var/lib/registry-cache mscatdk/rpi-registry:latest
```

The default configuration file path is /etc/registry/default_config.yml and the directory /etc/registry only contain this single file. Hence, you can bind a local directory with your own configuration file to /etc/registry in case needed.

The docker images can be found on Docker Hub: https://hub.docker.com/r/mscatdk/rpi-registry/

## Build Process

The build process is split into two steps. The first step is to build the registry binary and the second step is to create the docker image. I have done this to speed-up the compilation of the registry binary as it was a bit slow on my Raspberry PI.

### Build Binaries

This can be done on any x86 or x86-64 (aka. AMD64) Linux machine by running the run-build.sh script. This will start a docker container building the binary; hence, docker is required.

```bash
./run-build.sh
```

### Build docker image

This step "must" be done on the Raspberry PI.

```bash
git clone git@github.com:mscatdk/rpi-registry.git
cd rpi-registry

# Copy the binary from the previous step into binary

docker build . -t mscatdk/rpi-registry:latest
```