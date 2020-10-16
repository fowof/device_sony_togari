LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

include $(LOCAL_PATH)/variables.mk

LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := recovery_ui.cpp

# should match TARGET_RECOVERY_UI_LIB set in BoardConfig.mk
LOCAL_MODULE := $(TARGET_RECOVERY_UI_LIB)

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
