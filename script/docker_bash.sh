docker run -it --rm --name bash_$1 --privileged \
    -w /root \
    --hostname bash_$1 \
    longjie/learn_ros_multimaster \
    bash
