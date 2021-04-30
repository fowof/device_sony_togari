#!/usr/bin/env sh

cd "$(dirname "${BASH_SOURCE:-$0}")"

function _replace_path_with_name() {

  local path=$1
  local name=$2

  [ -n "$name" -a -n "$path" ] || return 1

  local out='$(TARGET_OUT)'
  local rel=
  while true
  do
    [ "$_PATH" != "${_PATH#${path}}" -o "$_PATH"  = "$path" ] || break

    rel="${_PATH#${path}}"
    rel="${rel#/}"

    out="\$(${name})"
    if [ -n "$rel" ]; then
      _PATH=${out}/${rel}
    else
      _PATH=$out
    fi

    if [ -n "$rel" ]; then
      _MODULE=$(echo "$rel" | sed 's/[\/\.]/_/g')_${_MODULE}
    fi

    return
  done

  return 1
}

function _cat_module() {
cat << EOF

include \$(CLEAR_VARS)
LOCAL_MODULE        := ${_MODULE}
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := ${_FILE}
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := ${_STEM}
LOCAL_MODULE_SUFFIX := .${_SUFFIX}
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := ${_PATH}
include \$(BUILD_PREBUILT)
EOF
}

for subdir in $(ls)
do

  [ -d "$subdir" ] || continue

  cd "$subdir"

  [ -e "Android.mk"  ] && dumpandroidmk=false || dumpandroidmk=true
  [ -e "packages.mk" ] && dumppkgsmk=false    || dumppkgsmk=true

  if $dumpandroidmk || $dumppkgsmk
  then

    $dumpandroidmk && echo 'LOCAL_PATH := $(call my-dir)' > Android.mk
    $dumppkgsmk    && echo > packages.mk

    for _FILE in $(find . -type f -not -name '*.mk' -not -name '.*' | sort)
    do

      _FILE=${_FILE#\./}
      _PATH=$(dirname "${_FILE}")
      _NAME=$(basename "${_FILE}")
      _STEM=${_NAME%\.*}
      _SUFFIX=${_FILE#*\.}
      _MODULE=${_STEM}_${_SUFFIX}

      while true
      do
        _replace_path_with_name  vendor/lib  TARGET_OUT_VENDOR_SHARED_LIBRARIES && break
        _replace_path_with_name  vendor      TARGET_OUT_VENDOR                  && break
        _replace_path_with_name  etc         TARGET_OUT_ETC                     && break
        _replace_path_with_name  bin         TARGET_OUT_EXECUTABLES             && break
        _replace_path_with_name  xbin        TARGET_OUT_OPTIONAL_EXECUTABLES    && break
        _replace_path_with_name  lib         TARGET_OUT_SHARED_LIBRARIES        && break
        _replace_path_with_name  framework   TARGET_OUT_JAVA_LIBRARIES          && break
        break
      done

      $dumpandroidmk && _cat_module >> Android.mk
      $dumppkgsmk    && echo "PRODUCT_PACKAGES += ${_MODULE}" >> packages.mk

    done

  fi

  cd ../

done
