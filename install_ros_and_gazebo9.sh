#!/usr/bash

## make sure ros in not already installed on your computer
## and Gazebo is not installed as well
## if Gazebo is already installed in your system, it will 
## raise errors when installing Ros

## installing ros-kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

## remove the gazebo that comes with this ros installation
## and install gazebo9
sudo apt-get remove ros-kinetic-gazebo*
sudo apt-get remove libgazebo*
sudo apt-get remove gazebo*

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install ros-kinetic-gazebo9-*

source ~/.bashrc
