#!/bin/bash
 
git clone https://github.com/jonathanpenn/WaxSim.git
cd WaxSim
xcodebuild install DSTROOT=/ INSTALL_PATH=/usr/local/bin
