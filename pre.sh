
###                                                     ###
### `source` this file after `source` build/envsetup.sh ###
###                                                     ###

_DIR_DEVICE="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"
_DIR_REPOROOT="$(cd "$_DIR_DEVICE"; cd ../../../;pwd)"

[ "$(pwd)" = "$_DIR_REPOROOT"     ] || cd "$_DIR_REPOROOT"
[ -f build/envsetup.sh            ] || return 1
command -v repopick >/dev/null 2>&1 || source build/envsetup.sh

_DIR_DEVICE=${_DIR_DEVICE#$_DIR_REPOROOT}
_DIR_DEVICE=${_DIR_DEVICE#/}

#
# APPLY PATCHES
#

cd "${_DIR_REPOROOT}/device/sony/msm8974-common"
git fetch http://gerrit.aicp-rom.com/AICP/device_sony_msm8974-common refs/changes/93/109793/1 && git checkout FETCH_HEAD
cd "${_DIR_REPOROOT}/device/sony/rhine-common"
git fetch http://gerrit.aicp-rom.com/AICP/device_sony_rhine-common refs/changes/31/109531/5 && git checkout FETCH_HEAD
cd "${_DIR_REPOROOT}"
