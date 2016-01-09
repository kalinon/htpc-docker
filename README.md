# Container command to run htpc
docker run -d --name htpc -p 5050:5050 -p 8080:8080 -p 8081:8081 -p 8085:8085 -p 7000:7000 -p 8181:8181 -v /root/config:/config -v /data:/data kalinon/htpc-essentials  

# Container command for deluge
docker run -d --name deluge -p 53160:53160 -p 8112:8112 -p 58846:58846 -v /root/config/deluge:/config -v /root/config/Downloads:/data  kalinon/deluge  

# Container command for ComicStreamer
docker run -d --name comicstreamer -p 32500:32500 -v /root/config/comicstreamer:/config -v /data:/data kalinon/comicstreamer  

# Container command for mylar
docker run -d --name mylar -p 8090:8090 -v /root/config:/config -v /data:/data kalinon/mylar  
