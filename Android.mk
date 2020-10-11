LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),sony)
ifeq ($(TARGET_BOARD_PLATFORM),msm8974)
ifeq ($(BOARD_VENDOR_PLATFORM),rhine)
ifeq ($(TARGET_DEVICE),togari)

#  BUILD_USERNAME := togari
#	BUILD_HOSTNAME := android

	include $(call all-subdir-makefiles)

	# HALs
#	include hardware/qcom/display/msm8974/Android.mk
#	include hardware/qcom/audio/Android.mk
#	include hardware/qcom/media/Android.mk
#	include $(call all-makefiles-under,hardware/qcom/gps/msm8974)
#	include $(call all-makefiles-under,hardware/qcom/bt/msm8960)
#	include $(call all-makefiles-under,hardware/qcom/wlan/qcwcn)

endif
endif
endif
endif
