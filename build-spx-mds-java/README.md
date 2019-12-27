# build-spx-mds

It's a container with prerequisites to run mds

## Usage
```
docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v <path/to/mds>:/mds \
    -v $HOME/.Xauthority:/root/.Xauthority \
    --net=host \
    joeychen/build-spx-mds \
    mds/MDS
```

## Troubleshooting 
Disable the access control to allow clients to connect from any host.
```
$xhost +
access control disabled, clients can connect from any host
```
