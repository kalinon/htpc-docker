#!/bin/bash
/bin/mkdir -p /config/mylar
/bin/mkdir /config/post-processing
/bin/cp /opt/mylar/post-processing/sabnzbd/ComicRN.py /config/post-processing/ComicRN.py
/bin/cp /opt/mylar/post-processing/autoProcessComics.py /config/post-processing/autoProcessComics.py
/bin/cp /opt/mylar/post-processing/autoProcessComics.cfg.sample /config/post-processing/autoProcessComics.cfg
/bin/chown -hR root:root /opt/mylar/post-processing/
