FROM ubuntu:18.04

MAINTAINER Ann Arbor District Library <github@aadl.org>

COPY copyables /

ENV DISPLAY=":1"

RUN dpkg --add-architecture i386 \
    && apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    supervisor \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    libxext6:i386 \
    libxtst6:i386 \
    libxi6:i386 \
    && apt-get clean \
    && /bin/sh /milup160_02.bin -f /installvariables.properties -i silent \
    && rm -rf /var/cache/* /var/log/apt/* /tmp/* /milup160_02.bin /installvariables.properties

EXPOSE 5900

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
