#!/bin/bash

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)

aptitude install git build-essential rsync bison flex curl texinfo libtinfo-dev \
gcc-arm-linux-gnueabi g++-arm-linux-gnueabi xapt

#xapt -a armel -S precise -m --mirror http://ports.ubuntu.com/ libtinfo-dev
#dpkg-reconfigure dash # make /bin/sh point to bash
