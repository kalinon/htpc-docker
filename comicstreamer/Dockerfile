FROM ubuntu:18.04
MAINTAINER Holden Omans <holden.omans@gmail.com>

# Set up static options
ENV DEBIAN_FRONTEND="noninteractive" \
  LANG="en_US.UTF-8" \
  LC_ALL="C.UTF-8" \
  LANGUAGE="en_US.UTF-8"

RUN apt-get update && \
    apt-get install -y \
      wget unzip git \
      python3 python3-dev python3-pip python3-venv libavahi-compat-libdnssd1 \
      libjpeg-dev libpng-dev zlib1g-dev libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Turante/ComicStreamer.git /opt/comicstreamer

ENV VIRTUAL_ENV=/opt/comicstreamer
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /opt/comicstreamer

RUN python3 -m pip install --upgrade pip && \
  python3 -m pip install --upgrade setuptools && \
  python3 -m pip install wheel && \
  python3 -m pip install -r requirements.txt && \
  python3 -m paver libunrar && \
  python3 -m pip install https://github.com/kounch/pybonjour-python3/releases/download/1.1.3/pybonjour-1.1.3.tar.gz

RUN mkdir /conf

# Cleanup
RUN apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

# Declare volumes needed
VOLUME ["/config", "/data"]

# Final setup
EXPOSE 32500
CMD ["/opt/comicstreamer/bin/python3", "/opt/comicstreamer/comicstreamer", "--quiet", "--nobrowser", "--user-dir=/config"]
