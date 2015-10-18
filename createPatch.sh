#!/usr/bin/bash

# Patches dir
mkdir patches
mkdir patches/web-os
# Create web-os patches
cd repos/web-os
COM=`git rev-list HEAD --count`
git format-patch -$COM > ../../patches/web-os
