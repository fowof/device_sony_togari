LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES               := keycheck.c
LOCAL_MODULE                  := keycheck
LOCAL_MODULE_PATH             := $(TARGET_RAMDISK_OUT)/sbin
LOCAL_STATIC_LIBRARIES        := libc
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_PACK_MODULE_RELOCATIONS := false
include $(BUILD_EXECUTABLE)
