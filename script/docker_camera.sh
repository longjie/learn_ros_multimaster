docker run -it --rm --name master_$1 --privileged \
    -w /root/learn_multimaster_ws \
    --hostname camera_$1 \
    longjie/learn_ros_multimaster \
    bash -c "ifconfig eth0 multicast; source devel/setup.bash; ROS_IP=\`hostname -i\` ROS_MASTER_URI=http://\`hostname -i\`:11311 roslaunch learn_ros_multimaster camera.launch number:=$1"
