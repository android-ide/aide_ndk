#!/bin/bash

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)

aptitude install git build-essential rsync bison flex curl texinfo libtinfo-dev \
libncurses5-dev
