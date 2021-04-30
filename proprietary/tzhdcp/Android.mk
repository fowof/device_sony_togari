LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_b00
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.b00
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .b00
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_b01
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.b01
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .b01
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_b02
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.b02
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .b02
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_b03
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.b03
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .b03
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_flist
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.flist
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .flist
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := firmware_tzhdcp_mdt
LOCAL_MODULE_OWNER  := Sony Mobile
LOCAL_SRC_FILES     := etc/firmware/tzhdcp.mdt
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_STEM   := tzhdcp
LOCAL_MODULE_SUFFIX := .mdt
LOCAL_MODULE_CLASS  := ETC
LOCAL_MODULE_PATH   := $(TARGET_OUT_ETC)/firmware
include $(BUILD_PREBUILT)
