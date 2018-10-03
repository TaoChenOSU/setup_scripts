#!/usr/bash

## install RotorS_Simulator
## please navigate to the directory where you want to
## put your catkin workspace 

## install additional tools
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install ros-kinetic-joy ros-kinetic-octomap-ros ros-kinetic-mavlink python-wstool python-catkin-tools protobuf-compiler libgoogle-glog-dev ros-kinetic-control-toolbox

## remove the default source list to reinitialize
sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update
source /opt/ros/kinetic/setup.bash

## create the workspace
mkdir -p ./catkin_ws/src
cd ./catkin_ws/src 
catkin_init_workspace

wstool init

## get the source for my version of rotors_simulator
git clone https://github.com/TaoChenOSU/rotors_simulator.git
cd rotors_simulator 
git checkout gazebo_step_control
cd ..

## get the source for mav link
git clone https://github.com/TaoChenOSU/mavlink.git
 
## get the source for mav comm
git clone https://github.com/TaoChenOSU/mav_comm.git

## get the source for mav ros
git clone https://github.com/TaoChenOSU/mavros.git 

## get the source for the mellinger controller 
git clone https://github.com/TaoChenOSU/mellinger.git

## get the source for the step plugin
git clone https://github.com/TaoChenOSU/rotors_step_simulation_plugin.git
cd rotors_step_simulation_plugin
git submodule init 
git submodule update 
cd ..

## back to the workspace root dir
cd ..
catkin build

## possible issues are documented on each of the packages github repo
## readme, please refer to the documents to see how to solve the issues

## assuming everything goes well
echo "source ./devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

## might have to run catkin build multiple times because
## catkin sometimes cannot solve all the dependencies.


