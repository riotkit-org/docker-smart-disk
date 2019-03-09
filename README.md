S.M.A.R.T. monitoring in docker
===============================

Checks if a physical disk is ok using smartmontools.
There are builds for x86_64 and armhf.

Run with:
```
sudo docker run --name smart --privileged --rm -i -e DISK=/dev/sda -v /dev/sda:/dev/sda wolnosciowiec/docker-smart-disk
```

Then observe container health:
```
75f821c79695        wolnosciowiec/docker-smart-disk                             "/bin/sh -c \"/entryp…"   About a minute ago   Up About a minute (health: starting)                                                          smart
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
        image: wolnosciowiec/docker-smart-disk:armhf
        privileged: true
        environment:
            - DISK=/dev/sda
        volumes:
            - /dev/sda:/dev/sda:ro
```