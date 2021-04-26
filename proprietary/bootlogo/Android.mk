
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := logo_rle
LOCAL_MODULE_OWNER  := Sony Mobile
# LOCAL_SRC_FILES     := logo.rle
LOCAL_SRC_FILES     := logo-glitched.rle
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := logo
LOCAL_MODULE_SUFFIX := .rle
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)
