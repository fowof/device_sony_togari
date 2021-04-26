
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := max1187x_touchscreen_0_idc
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := usr/idc/max1187x_touchscreen_0.idc
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := max1187x_touchscreen_0
LOCAL_MODULE_SUFFIX := .idc
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT)/usr/idc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := max1187x_pen_0_idc
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := usr/idc/max1187x_pen_0.idc
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := max1187x_pen_0
LOCAL_MODULE_SUFFIX := .idc
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT)/usr/idc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := touch_chip_id_0x74_config_id_0x0011_bin
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/touch_chip_id_0x74_config_id_0x0011.bin
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := touch_chip_id_0x74_config_id_0x0011
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := touch_chip_id_0x74_config_id_0x0460_bin
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/touch_chip_id_0x74_config_id_0x0460.bin
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := touch_chip_id_0x74_config_id_0x0460
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := touch_chip_id_0x75_config_id_0x0010_bin
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/touch_chip_id_0x75_config_id_0x0010.bin
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := touch_chip_id_0x75_config_id_0x0010
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := touch_chip_id_0x75_config_id_0x0012_bin
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/touch_chip_id_0x75_config_id_0x0012.bin
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := touch_chip_id_0x75_config_id_0x0012
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := touch_chip_id_0x75_config_id_0x0013_bin
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/touch_chip_id_0x75_config_id_0x0013.bin
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := touch_chip_id_0x75_config_id_0x0013
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)
