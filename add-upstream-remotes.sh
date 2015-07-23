#!/bin/bash

#set -e

cd `dirname $0`

(cd platform/ndk; git remote add upstream https://android.googlesource.com/platform/ndk)
(cd platform/development; git remote add upstream https://android.googlesource.com/platform/development)
(cd platform/prebuilts/tools; git remote add upstream https://android.googlesource.com/platform/prebuilts/tools)
