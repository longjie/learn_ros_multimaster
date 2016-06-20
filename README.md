# learn_ros_multimaster

## What is this?

This is an easy trial of the
[multimaster_fkie](http://wiki.ros.org/master_discovery_fkie) package
using docker. You can try the package with one PC using docker
containers.

## Quick start

You need Ubuntu 14.04LTS PC, and docker is installed.  You don't need
to install ROS(but who doesn't?).

### Get the repository

```
$ git clone https://github.com/longjie/learn_ros_multimaster.git
```

### Get the docker image from DockerHub

```
$ docker pull longjie/learn_ros_multimaster
```

The image is large, it may take some time.

### Launch the kobuki container

```
$ cd learn_ros_multimaster/script
```

On multiple terminals, you can run kobuki nodes (kobuki_softnode)
like:

```
$ ./docker_kobuki.sh 1
$ ./docker_kobuki.sh 2
$ ./docker_kobuki.sh 3
$ ./docker_kobuki.sh 4
```

Note you have run individual four ROS systems. The each container has
its own master(roscore) running. Yes, it is multi-master system.

The number after the script is to identify the node and topics. The
mulitimaster_fkie syncs the node and topic name as is, so you need to
use different namespace for each ROS node and topic. You cannot launch
nodes of the same name.

### Launch rviz

Now you can run another container to run rviz to visualize the robots.

```
$ ./docker_rviz.sh
```

You can see four Kobukis are running around a circle with different
speed. Again, this is multi-master system, and this rviz container has
its own rosmaster(roscore).

### Launch the uvc_camera

If you have UVC camera, you can run another docker container to aquire
image. Make sure you can see the device /dev/video0 and get image with
camera applications(cheese, qv4l2, etc).

```
$ ./docker_camera.sh
```

You can see the image on the rviz's image plugin.

## Building docker image

These are just memos.

```
$ cd learn_ros_multimaster
$ docker build -t longjie/learn_ros_multimaster . 
```

