xhost +
docker run -it --rm --name master_$1 --privileged \
    -w /root/ws \
    --hostname camera_$1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env DISPLAY=unix$DISPLAY \
    longjie/learn_ros_multimaster \
    bash -c "ifconfig eth0 multicast; source devel/setup.bash; ROS_IP=\`hostname -i\` ROS_MASTER_URI=http://\`hostname -i\`:11311 roslaunch learn_ros_multimaster camera.launch number:=$1"
