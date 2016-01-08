FROM ubuntu:trusty
MAINTAINER Holden Omans <holden.omans@gmail.com>

# Set up required libs and ubuntu ENVs
ENV DEBIAN_FRONTEND="noninteractive" \
  LANG="en_US.UTF-8" \
  LC_ALL="C.UTF-8" \
  LANGUAGE="en_US.UTF-8"

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy \
      # Base apps
      git curl supervisor ca-certificates \
      # Python libs
      python-software-properties software-properties-common python-pip python-dev build-essential \
      # Headphones ffmpeg req
      procps bzip2 libgnutlsxx27 libogg0 libjpeg8 libpng12-0 \
      libvpx1 libtheora0 libxvidcore4 libmpeg2-4 \
      libvorbis0a libfaad2 libmp3lame0 libmpg123-0 libmad0 libopus0 libvo-aacenc0

# install Sabnzbd++
RUN add-apt-repository -y ppa:jcfp/ppa && apt-get -q update && \
  apt-get install -qy sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile \
    sabnzbdplus-theme-plush par2 python-yenc unzip unrar 

# Clone needed repos
RUN git clone https://github.com/midgetspy/Sick-Beard.git /opt/sickbeard && \
 git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato && \
 git clone https://github.com/gugahoi/maraschino.git /opt/maraschino && \
 git clone https://github.com/rembo10/headphones.git /opt/headphones

# Cleanup
RUN add-apt-repository -y ppa:mc3man/trusty-media && apt-get -q update && \
  apt-get install -qy ffmpeg && \
  apt-get purge -y --auto-remove curl gcc make yasm bzip2 \
    libc6-dev libgnutls-dev libogg-dev librtmp-dev libjpeg-dev libpng12-dev \
    libvpx-dev libtheora-dev libxvidcore-dev libmpeg2-4-dev libssl-dev \
    libvorbis-dev libfaad-dev libmp3lame-dev libmpg123-dev libmad0-dev \
    libopus-dev libvo-aacenc-dev build-essential python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

# Declare volumes needed
VOLUME ["/config","/data"]

# Final setup
EXPOSE 5050 8080 8081 8085 8181 7000
CMD ["/usr/bin/supervisord"]

# Set up needed scripts
COPY ["supervisord.conf", "/etc/supervisor/conf.d/supervisord.conf"]
RUN mkdir -p /var/log/supervisor
