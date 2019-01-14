#!/bin/bash

homedir=${HOME}
mdsdir=`pwd`
workspacedir=$mdsdir/workspace

echo "homedir=$homedir"
echo "mdsdir=$mdsdir" 
echo "workspacedir=$workspacedir"

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $homedir/.Xauthority:/root/.Xauthority \
    -v $mdsdir:/mds \
    -v $workspacedir:/workspace \
    --net=host \
    joeychen/build-spx:latest \
    mds/MDS
