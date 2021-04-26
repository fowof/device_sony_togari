#!/usr/bin/env sh

cd "$(dirname "$0")"

for subdir in $(ls)
do

[ -d "$subdir" ] || continue

cd "$subdir"

[ -e "Android.mk"  ] && dumpandroidmk=false || dumpandroidmk=true
[ -e "packages.mk" ] && dumppkgsmk=false    || dumppkgsmk=true

$dumpandroidmk && echo 'LOCAL_PATH := $(call my-dir)' > Android.mk
$dumppkgsmk    && echo > packages.mk

for file in $(find . -type f -not -name Android.mk -not -name packages.mk | sort)
do

file=${file#\./}
path=$(dirname "${file}")
name=$(basename "${file}")
stem=${name%\.*}
suffix=${file#*\.}

$dumpandroidmk && cat << EOF >> Android.mk

include \$(CLEAR_VARS)
LOCAL_MODULE        := ${stem}_${suffix}
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := ${file}
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := ${stem}
LOCAL_MODULE_SUFFIX := .${suffix}
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := \$(TARGET_OUT)/${path}
include \$(BUILD_PREBUILT)
EOF

$dumppkgsmk && echo "PRODUCT_PACKAGES += ${stem}_${suffix}" >> packages.mk

done

cd ../

done
