#!/bin/bash
find /comics/ | grep cbr | perl -ln -e 'print qq{./comictagger.py -e --delete-rar "$_" }' | sh

find /comics/ | grep cbz | perl -ln -e 'my $filename = $_; if(m!/comics/([^/]+)/([^/]+)\((\d+)\)/([^/]+)\s(\d\d\d)\s\((\d\d\d\d)\)\.cbz!){print qq{./comictagger.py --cv-api-key=18357f40df87fb4a4bb6f5bb27cd8ad1deb08d3e --nooverwrite --save --type cr -m "publisher=$1" --parsefilename --online "$filename"};}' | sh

find /comics/ | grep cbz | perl -ln -e 'my $filename = $_; if(m!/comics/([^/]+)/([^/]+)\((\d+)\)/([^/]+)\s(\d\d\d)\s\((\d\d\d\d)\)\.cbz!){print qq{./comictagger.py -c cr -t cbl "$filename"};}' | sh

