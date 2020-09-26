LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),togari)
#  include $(call first-makefiles-under,$(LOCAL_PATH))
	include $(call all-subdir-makefiles)
endif
