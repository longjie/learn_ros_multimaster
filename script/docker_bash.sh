xhost +
docker run -it --rm --name bash_$1 --privileged \
    -w /root \
    --hostname bash_$1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env DISPLAY=unix$DISPLAY \
    longjie/learn_ros_multimaster \
    bash
