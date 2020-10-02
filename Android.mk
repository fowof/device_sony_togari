LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),sony)
ifeq ($(TARGET_BOARD_PLATFORM),msm8974)
ifeq ($(BOARD_VENDOR_PLATFORM),rhine)

# include $(call all-subdir-makefiles,$(LOCAL_PATH))
#
# $(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9320; \
# 		ln -sf /data/misc/audio/wcd9320_anc.bin \
# 		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_anc.bin; \
# 		ln -sf /data/misc/audio/wcd9320_mad_audio.bin \
# 		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mad_audio.bin; \
# 		ln -sf /data/misc/audio/mbhc.bin \
# 		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mbhc.bin)

ifeq ($(TARGET_DEVICE),togari)
#  include $(call first-makefiles-under,$(LOCAL_PATH))
	include $(call all-subdir-makefiles)

	# HALs
	# include hardware/qcom/display/msm8994/Android.mk
	# include $(call all-makefiles-under,hardware/qcom/audio)
	# include $(call all-makefiles-under,hardware/qcom/media/msm8974)
	# include $(call all-makefiles-under,hardware/qcom/gps/msm8994)
	# include $(call all-makefiles-under,hardware/qcom/bt/msm8960)
	# include $(call all-makefiles-under,hardware/qcom/wlan/qcwcn)

	include hardware/qcom/display/msm8974/Android.mk
	include hardware/qcom/audio/Android.mk
	include hardware/qcom/media/Android.mk
	include $(call all-makefiles-under,hardware/qcom/gps/msm8974)
	include $(call all-makefiles-under,hardware/qcom/bt/msm8960)
	include $(call all-makefiles-under,hardware/qcom/wlan/qcwcn)

endif
endif
endif
endif
