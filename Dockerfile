FROM osrf/ros:indigo-desktop-full
MAINTAINER Ron Tajima <	ryosuke.tajima+dockerhub@gmail.com>

RUN set -x && \
    apt-get update && \
    apt-get install -y ros-indigo-multimaster-fkie \
    	    	       ros-indigo-kobuki-softnode \
		       ros-indigo-kobuki-random-walker

RUN mkdir /root/ws
RUN mkdir /root/ws/src
WORKDIR /root/ws/src
# to avoid cache
COPY .git/index dummyfile
RUN git clone https://github.com/longjie/learn_ros_multimaster.git
WORKDIR /root/ws
RUN . /opt/ros/indigo/setup.sh && catkin_make



