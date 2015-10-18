#!/usr/bin/bash
mkdir repos
echo Removing previous repos and patches...
rm -rf repos
rm -rf patches
echo Cloneing repos...
echo
git clone https://github.com/Gum-Joe/Web-OS-container repos/web-os-container
echo
git clone https://github.com/Gum-Joe/Web-OS repos/web-os
exit 0
