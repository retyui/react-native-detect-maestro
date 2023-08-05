#!/bin/bash

set -x # all executed commands are printed to the terminal

TMP_FILE=_fail_proccess

# Start video record
adb shell screenrecord /sdcard/video_record.mp4 & echo $! > video_record.pid
sleep 3

# Retry 3 times before the steps actually fails
(echo "===== Install node_modules Attempt:  1 ====" && $HOME/.maestro/bin/maestro test .maestro/ -e APP_ID=$RN_ANDROID_APP_ID -e IS_ANDROID=true -e IS_CI=true --format junit --output report1.xml) || \
(echo "===== Install node_modules Attempt:  2 ====" && sleep 20 && $HOME/.maestro/bin/maestro test .maestro/ -e APP_ID=$RN_ANDROID_APP_ID -e IS_ANDROID=true -e IS_CI=true --format junit --output report2.xml) || \
(echo "===== Install node_modules Attempt:  3 ====" && sleep 60 && $HOME/.maestro/bin/maestro test .maestro/ -e APP_ID=$RN_ANDROID_APP_ID -e IS_ANDROID=true -e IS_CI=true --format junit --output report3.xml) || \
(echo "===== Install node_modules Step Failed ====" && touch "$TMP_FILE")

# Stop video record process
kill -SIGINT "$(cat video_record.pid)"
sleep 3
rm -rf video_record.pid

# Take screenshot
adb shell screencap -p /sdcard/last_img.png
adb pull /sdcard/last_img.png

# Move the video from Emulator to Host filesystem
adb pull /sdcard/video_record.mp4
adb shell rm /sdcard/video_record.mp4

# Debug
$HOME/.maestro/bin/maestro hierarchy

if [ -f "$TMP_FILE" ]; then
  rm -rf "$TMP_FILE"
  echo "3 tries have failed..."
  exit 1
esle
  echo "Success..."
fi
