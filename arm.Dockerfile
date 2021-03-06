FROM balenalib/armv7hf-debian:buster

RUN [ "cross-build-start" ]
RUN apt-get update && apt-get install -y smartmontools cron && apt-get clean
RUN [ "cross-build-end" ]

ADD ./entrypoint.sh /
ADD ./healthcheck.sh /usr/bin/

HEALTHCHECK --interval=10m --timeout=4s \
  CMD /usr/bin/healthcheck.sh || exit 1

ENTRYPOINT "/entrypoint.sh"
