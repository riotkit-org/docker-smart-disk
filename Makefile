all: build build_armhf

build:
	sudo docker build . -t wolnosciowiec/docker-smart-disk

build_armhf:
	sudo docker build . -f ./Dockerfile.armhf -t wolnosciowiec/docker-smart-disk:armhf

run:
	sudo docker run --name smart --privileged --rm -i -e DISK=/dev/sda -v /dev/sda:/dev/sda wolnosciowiec/docker-smart-disk
