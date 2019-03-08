FROM debian:buster

RUN apt-get update && apt-get install -y smartmontools cron && apt-get clean

ADD ./entrypoint.sh /
ADD ./healthcheck.sh /usr/bin/

HEALTHCHECK --interval=1800s --timeout=4s \
  CMD /usr/bin/healthcheck.sh || exit 1

ENTRYPOINT "/entrypoint.sh"
