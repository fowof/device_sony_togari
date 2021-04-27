LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := mixer_paths_xml
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := mixer_paths.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := mixer_paths
LOCAL_MODULE_SUFFIX := .xml
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)
include $(BUILD_PREBUILT)
