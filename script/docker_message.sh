docker run -it --rm --name master_$1 --privileged \
    -w /root/ws \
    --hostname message_$1 \
    longjie/learn_ros_multimaster \
    bash -c "ifconfig eth0 multicast; source devel/setup.bash; ROS_IP=\`hostname -i\` ROS_MASTER_URI=http://\`hostname -i\`:11311 roslaunch learn_ros_multimaster message.launch number:=$1"
