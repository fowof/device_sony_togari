#!/usr/bin/env sh

cd "$(dirname "$0")"

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

for file in $(find . -type f -not -name Android.mk -not -name packages.mk -not -name '.*' | sort)
do

file=${file#\./}
path=$(dirname "${file}")
name=$(basename "${file}")
stem=${name%\.*}
suffix=${file#*\.}

out='$(TARGET_OUT)'
while true
do
[ "${path#vendor/lib/}" != "$path" -o "$path" = 'vendor/lib' ] && { path="${path#vendor/lib}"; out='$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)'; break; }
[ "${path#vendor/}"     != "$path" -o "$path" = 'vendor'     ] && { path="${path#vendor}"    ; out='$(TARGET_OUT_VENDOR)'; break; }
[ "${path#etc/}"        != "$path" -o "$path" = 'etc'        ] && { path="${path#etc}"       ; out='$(TARGET_OUT_ETC)'   ; break; }
break
done
path=${path#/}

module=${stem}_${suffix}
if [ -n "$path" ]; then
  module=$(echo $path | sed 's/[\/\.]/_/g')_${module}
  path=${out}/${path}
else
  path=${out}
fi

$dumpandroidmk && cat << EOF >> Android.mk

include \$(CLEAR_VARS)
LOCAL_MODULE        := ${module}
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := ${file}
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := ${stem}
LOCAL_MODULE_SUFFIX := .${suffix}
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := ${path}
include \$(BUILD_PREBUILT)
EOF

$dumppkgsmk && echo "PRODUCT_PACKAGES += ${module}" >> packages.mk

done

fi

cd ../

done
