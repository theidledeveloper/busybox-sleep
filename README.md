# Busybox Sleep

Minimal busybox image (1 change) with a sleep cmd override (1 hour).

##### Docker

![Docker Pulls](https://img.shields.io/docker/pulls/theidledeveloper/busybox-sleep)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/theidledeveloper/busybox-sleep)
![Docker Stars](https://img.shields.io/docker/stars/theidledeveloper/busybox-sleep)

##### Repository

![Latest tag](https://img.shields.io/github/v/tag/theidledeveloper/busybox-sleep?label=Latest%20Tag) ![License](https://img.shields.io/github/license/theidledeveloper/busybox-sleep)

![Repository URL](https://github.com/theidledeveloper/busybox-sleep)

##### Build Status

![Release Check Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/busybox-sleep/check_new_version.yml?label=Version%20Check%20Build)

![base Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/busybox-sleep/build_image.yml?label=Image%20Build)
![glibc Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/busybox-sleep/build_image_glibc.yml?label=glibc%20Image%20Build)
![musl Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/busybox-sleep/build_image_musl.yml?label=musl%20Image%20Build)
![uclibc Image Build](https://img.shields.io/github/actions/workflow/status/theidledeveloper/busybox-sleep/build_image_uclibc.yml?label=uclibc%20Image%20Build)

### Images

Each image is created from just the base BusyBox image for both `amd/64` and `arm/64` architectures.

To run the images against different platforms, use the `--platform` switch when evoking your container runtime:

```bash
# amd64
docker run --platform linux/amd64 theidledeveloper/busybox-sleep:1.36.0"
# arm64
docker run --platform linux/arm64 theidledeveloper/busybox-sleep:1.36.0"
```

### Build Locally

The image makes use of *ARG* instructions to allow the use of a single [Dockerfile](./Dockerfile) but build images with
different base BusyBox versions. To properly supply the image ARGs pass in `BUSYBOX_VERSION` and using the `--build-arg`
flag. BusyBox image versions can be found at [busybox](https://hub.docker.com/_/busybox/tags).

To build *1.36.0-glibc*:

```bash
docker build --build-arg BUSYBOX_VERSION=1.36.0 -t theidledeveloper/busybox-sleep:latest .
```

### Run local container

```bash
image_id=$(docker run --rm -d theidledeveloper/busybox-sleep:latest)
docker exec -it "${image_id}" /bin/sh
```

## Stop container early

Within the same terminal:

```bash
docker stop "${image_id}"
```

In a different terminal session:

```bash
image_id="$(docker ps | grep 'theidledeveloper/busybox-sleep:1.36.0' | cut -f1 -d' ')"
docker stop "${image_id}"
```
