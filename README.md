# Busybox Sleep

Minimal busybox image (1 change) with a sleep cmd override (1 hour)

## Pull public image

```bash
docker pull theidledeveloper/busybox-sleep:0.0.1
```

## Build container locally

```bash
docker build . -t theidledeveloper/busybox-sleep:0.0.1
```

## Run local container

```bash
image_id=$(docker run --rm -d theidledeveloper/busybox-sleep:0.0.1)
docker exec -it ${image_id} /bin/sh
```

## Stop container early

Within the same terminal:

```bash
docker stop ${image_id}
```

In a different terminal session:

```bash
image_id="$(docker ps | grep 'theidledeveloper/busybox-sleep:0.0.1' | cut -f1 -d' ')"
docker stop ${image_id}
```
