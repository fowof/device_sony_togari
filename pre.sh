#!/usr/bin/env sh

set -e

cd "$(dirname "$0")"
DEVICE_PATH="$(pwd)"

cd ../../../
DEVICE_PATH=${DEVICE_PATH#$(pwd)/}

for file in $(find $DEVICE_PATH/repocopy -type f)
do
  cp $file ${file#$DEVICE_PATH/repocopy/}
done

repopick -f 295701 # Add product_launched_with_j_mr2 for JellyBean 4.3
repopick 292788 # adb
repopick -g https://gerrit.aicp-rom.com 104259 # rhine-common
repopick -g https://gerrit.aicp-rom.com 106145 106147 # 8974-common
repopick -g https://gerrit.aicp-rom.com 105818 -P system/core
repopick -g https://gerrit.aicp-rom.com 105646 -P frameworks/native
repopick -g https://gerrit.aicp-rom.com 105644 -P build/make
repopick -g https://gerrit.aicp-rom.com 105645 -P build/soong
repopick -g https://gerrit.aicp-rom.com 105817 -P vendor/lineage
