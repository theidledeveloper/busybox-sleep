ARG BUSYBOX_VERSION
FROM busybox:${BUSYBOX_VERSION}
LABEL maintainer="theidledeveloper@gmail.com"
CMD ["sleep", "3600"]
