FROM i386/debian:stable-slim

MAINTAINER Ann Arbor District Library <github@aadl.org>

COPY copyables /

ENV DISPLAY=":1"

RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    supervisor \
    && apt-get clean \
    && /bin/sh /milup160_02.bin -f /installvariables.properties -i silent \
    && rm -rf /var/cache/* /var/log/apt/* /tmp/* /milup160_02.bin /installvariables.properties

EXPOSE 5900

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
