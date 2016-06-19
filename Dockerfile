FROM osrf/ros:indigo-desktop-full
MAINTAINER Ron Tajima <	ryosuke.tajima+dockerhub@gmail.com>

RUN set -x && \
    apt-get update && \
    apt-get install -y ros-indigo-multimaster-fkie 
    
ADD . /root/learn_ros_multimaster_ws

WORKDIR /root/learn_ros_multimaster_ws

RUN rm -rf build devel
RUN . /opt/ros/indigo/setup.sh && catkin_make

