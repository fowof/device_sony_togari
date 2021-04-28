
###                                                     ###
### `source` this file after `source` build/envsetup.sh ###
###                                                     ###

_DIR_DEVICE="$(cd "$(dirname "$0")"; pwd)"
_DIR_REPOROOT="$(cd "$_DIR_DEVICE";cd ../../../;pwd)"

[ "$(pwd)" = "$_DIR_REPOROOT"     ] || cd "$_DIR_REPOROOT"
[ -f build/envsetup.sh            ] || return 1
command -v repopick >/dev/null 2>&1 || source build/envsetup.sh

#
# PICK PATCHES
#

repopick -f 295701 # Add product_launched_with_j_mr2 for JellyBean 4.3
repopick 292788 # adb
repopick -g https://gerrit.aicp-rom.com 104259 # rhine-common
repopick -g https://gerrit.aicp-rom.com 106145 106147 # 8974-common
repopick -g https://gerrit.aicp-rom.com 105818 -P system/core
repopick -g https://gerrit.aicp-rom.com 105646 -P frameworks/native
repopick -g https://gerrit.aicp-rom.com 105644 -P build/make
repopick -g https://gerrit.aicp-rom.com 105645 -P build/soong
repopick -g https://gerrit.aicp-rom.com 105817 -P vendor/lineage

#
# COPY FILES
#

for file in $(find ${_DIR_DEVICE}/repocopy -type f)
do
  cp $file ${file#${_DIR_DEVICE}/repocopy/}
done
