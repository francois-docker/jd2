# jd2

docker run -dti --name jd2 --memory 1g -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v ~/jdownloader/cfg:/usr/src/cfg francois/jd2:0.1
