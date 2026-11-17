#!/bin/sh
set -e
touch /home/ec2-user/AnacronDailyTest.$(date +"%Y-%m-%d_%I:%M") > /dev/null
exit 0