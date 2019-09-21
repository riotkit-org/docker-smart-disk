S.M.A.R.T. monitoring in docker
===============================

Checks if a physical disk is ok using smartmontools.
There are builds for x86_64 and armhf.

Check all tags there: https://quay.io/repository/riotkit/smart-check

Run with:
```
sudo docker run --name smart --privileged --rm -i -e DISK=/dev/sda -v /dev/sda:/dev/sda quay.io/riotkit/smart-check:v1.0.0-x86_64
```

Then observe container health:
```
75f821c79695      quay.io/riotkit/smart-check:v1.0.0-x86_64        "/bin/sh -c \"/entryp…"   About a minute ago   Up About a minute (health: starting)          smart
```

Or invoke healthcheck manually:
```
sudo docker exec smart /usr/bin/healthcheck.sh
```

Docker Compose
--------------

```yaml
version: "2"
services:
    hdd_health:
        image: quay.io/riotkit/smart-check:v1.0.0-x86_64
        privileged: true
        environment:
            - DISK=/dev/sda
        volumes:
            - /dev/sda:/dev/sda:ro
```
