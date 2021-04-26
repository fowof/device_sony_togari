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

include $(CLEAR_VARS)
LOCAL_MODULE        := sensor_def_qcomdev_conf
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := sensor_def_qcomdev.conf
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := sensor_def_qcomdev
LOCAL_MODULE_SUFFIX := .conf
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := sensors_calib_conf
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := sensors_calib.conf
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := sensors_calib
LOCAL_MODULE_SUFFIX := .conf
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := thermanager_xml
# LOCAL_MODULE_OWNER  :=
LOCAL_SRC_FILES     := thermanager.xml
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := thermanager
LOCAL_MODULE_SUFFIX := .xml
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)
