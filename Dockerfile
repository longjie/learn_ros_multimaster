FROM osrf/ros:indigo-desktop-full
MAINTAINER Ron Tajima <	ryosuke.tajima+dockerhub@gmail.com>

RUN set -x && \
    apt-get update && \
    apt-get install -y ros-indigo-multimaster-fkie 
    
RUN mkdir /root/ws
RUN mkdir /root/ws/src
WORKDIR /root/ws/src
COPY Dockerfile Dockerfile
RUN git clone https://github.com/longjie/learn_ros_multimaster.git
WORKDIR /root/ws
RUN . /opt/ros/indigo/setup.sh && catkin_make



