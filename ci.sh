#!/bin/bash
chmod 777 create.sh
chmod 777 clone.sh
set -e # exit with nonzero exit code if anything fails

# clear and re-create the out directory
rm -rf out || exit 0;
mkdir out;

# run our compile script, discussed above
sh create.sh

# go to the out directory and create a *new* Git repo
cd patches/web-os
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "kishansambhi@hotmail.co.uk"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy patches to branch patches-$TRAVIS_BUILD_NUMBER and patches-master"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force "https://${GH_TOKEN}@${GH_REF}" master:patches-$TRAVIS_BUILD_NUMBER > /dev/null 2>&1
git push --force "https://${GH_TOKEN}@${GH_REF}" master:patches-master > /dev/null 2>&1
