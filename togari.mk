# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH           := device/sony/togari
DEVICE_COPY_IN_ROOT   := $(DEVICE_PATH)/rootdir
DEVICE_COPY_IN_SYSTEM := $(DEVICE_COPY_IN_ROOT)/system
DEVICE_COPY_IN_VENDOR := $(DEVICE_COPY_IN_SYSTEM)/vendor

# Include msm8974-common system properties
-include $(DEVICE_PATH)/systemprop.mk

# inherit hidl hals
$(call inherit-product, $(DEVICE_PATH)/hidl.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/audio_effects.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.xml

PRODUCT_COPY_FILES += \
   $(DEVICE_COPY_IN_SYSTEM)/etc/mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/mixer_paths.xml

 PRODUCT_COPY_FILES += \
     $(DEVICE_COPY_IN_SYSTEM)/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml

 PRODUCT_COPY_FILES += \
     frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_audio_policy_configuration.xml \
     frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
     frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default_volume_tables.xml \
     frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/r_submix_audio_policy_configuration.xml \
     frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/usb_audio_policy_configuration.xml

# APEX
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/swcodec/ld.config.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/swcodec/ld.config.txt

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

 # Bluetooth
 PRODUCT_PACKAGES += \
 	  libbt-vendor

# BoringSSL hacks
PRODUCT_PACKAGES += \
	  libboringssl-compat

# Camera
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/external_camera_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/external_camera_config.xml

# PRODUCT_PACKAGES += \
# 	  tad_static

# Connectivity
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Filesystem management tools
PRODUCT_PACKAGES += \
	  e2fsck

# FM Radio
PRODUCT_PACKAGES += \
	  FMRadio \
	  libfmjni

# GPS
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/modules/gps/etc/flp.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/flp.conf \
    $(DEVICE_PATH)/modules/gps/etc/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(DEVICE_PATH)/modules/gps/etc/izat.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/izat.conf \
    $(DEVICE_PATH)/modules/gps/etc/sap.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sap.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PACKAGES += \
    gps.msm8974

# Ion
PRODUCT_PACKAGES += \
    libion

# JamesDSPManager
PRODUCT_PACKAGES += \
    JamesDSPManager

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

# Mobile Data
PRODUCT_PACKAGES += \
	  librmnetctl \
	  libxml2

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video.xml \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_performance.xml \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_V1_0.xml

# Music FX
PRODUCT_PACKAGES += \
    MusicFX


# NFC
PRODUCT_PACKAGES += \
	  nfc.qcom

PRODUCT_PACKAGES += \
	  libnfc \
	  libnfc_jni \
	  Nfc \
	  Tag \
	  com.android.nfc_extras

PRODUCT_COPY_FILES += \
  frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.android.nfc_extras.xml


# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(DEVICE_COPY_IN_SYSTEM)/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(DEVICE_COPY_IN_SYSTEM)/etc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
	  $(NFCEE_ACCESS_PATH):$(TARGET_COPY_OUT_SYSTEM)/etc/nfcee_access.xml

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVdecHevc \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libstagefrighthw

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-msm8974
ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-radio
    $(call inherit-product, $(DEVICE_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-wifionly
endif

# Power
# now qti binderised

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
		external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/permissions/permissions_sony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/permissions_sony.xml

# Recovery
PRODUCT_PACKAGES += \
    keycheck

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/c6x02.sh:c6x02.sh

# Seccomp
PRODUCT_COPY_FILES += \
	  $(DEVICE_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_SYSTEM)/etc/seccomp_policy/mediacodec.policy \
	  $(DEVICE_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_SYSTEM)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_COPY_FILES += \
   $(DEVICE_COPY_IN_SYSTEM)/etc/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensor_def_qcomdev.conf \
	 $(DEVICE_COPY_IN_SYSTEM)/etc/sensors/sensors_calib.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors_calib.conf


# Snap Camera
PRODUCT_PACKAGES += \
    Snap

# Thermal management
PRODUCT_PACKAGES += \
	  thermanager \
	  thermal.default

PRODUCT_COPY_FILES += \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/thermanager.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/thermanager.xml

# TimeKeep for managing time offsets w.r.t. RTC
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# vibrator
PRODUCT_PACKAGES += vibrator.default

# VNDK
PRODUCT_COPY_FILES += \
	  prebuilts/vndk/v28/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libbase.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libbase-v28.so

# Wifi
PRODUCT_PACKAGES += \
	  libwpa_client \
	  hostapd \
	  wificond \
	  wifilogd \
	  wpa_supplicant \
	  wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/init/android.hardware.wifi@1.0-service.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/android.hardware.wifi@1.0-service.rc

PRODUCT_PACKAGES += \
	  libQWiFiSoftApCfg \
	  libqsap_sdk \
	  wcnss_service

PRODUCT_COPY_FILES += \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/wpa_supplicant_overlay.conf \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/init.qcom.wifi.sh:$(TARGET_COPY_OUT_SYSTEM)/etc/init.qcom.wifi.sh \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/firmware/wlan/prima/WCNSS_cfg.dat:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	  $(DEVICE_COPY_IN_SYSTEM)/etc/hostapd/hostapd_default.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/hostapd/hostapd_default.conf



########


# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_ROOT)/init.msm8974-common.rc:$(TARGET_COPY_OUT_ROOT)/init.msm8974-common.rc \
    $(DEVICE_COPY_IN_ROOT)/init.sony.usb.rc:$(TARGET_COPY_OUT_ROOT)/init.sony.usb.rc \
    $(DEVICE_COPY_IN_ROOT)/init.recovery.qcom.rc:$(TARGET_COPY_OUT_ROOT)/init.recovery.qcom.rc \
    $(DEVICE_COPY_IN_ROOT)/fstab.qcom:$(TARGET_COPY_OUT_ROOT)/fstab.qcom \
    $(DEVICE_COPY_IN_ROOT)/init.qcom.rc:$(TARGET_COPY_OUT_ROOT)/init.qcom.rc \
    $(DEVICE_COPY_IN_ROOT)/init.camera.rc:$(TARGET_COPY_OUT_ROOT)/init.camera.rc \
    $(DEVICE_COPY_IN_ROOT)/init.qcom.power.rc:$(TARGET_COPY_OUT_ROOT)/init.qcom.power.rc \
    $(DEVICE_COPY_IN_ROOT)/ueventd.qcom.rc:$(TARGET_COPY_OUT_ROOT)/ueventd.qcom.rc \
		$(DEVICE_COPY_IN_ROOT)/init.device.rc:$(TARGET_COPY_OUT_ROOT)/init.device.rc


# IPC Security Config
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/sec_config:$(TARGET_COPY_OUT_SYSTEM)/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(DEVICE_COPY_IN_SYSTEM)/usr/keylayout/mhl-rcp.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mhl-rcp.kl \
    $(DEVICE_COPY_IN_SYSTEM)/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl

# MAC address - BT and Wi-Fi
PRODUCT_PACKAGES += \
    macaddrsetup

# RIL
PRODUCT_COPY_FILES += \
    $(DEVICE_COPY_IN_SYSTEM)/etc/data/netmgr_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/netmgr_config.xml \
    $(DEVICE_COPY_IN_SYSTEM)/etc/data/dsi_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/dsi_config.xml \
    $(DEVICE_COPY_IN_SYSTEM)/etc/data/qmi_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/qmi_config.xml
BOARD_RIL_CLASS := $(DEVICE_PATH)/ril/
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyRIL

# TimeKeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

###########

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	  frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.autofocus.xml \
	  frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
	  frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
	  frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG      := large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

include $(DEVICE_PATH)/proprietary/c6833-modem/packages.mk
include $(DEVICE_PATH)/proprietary/c6833-bootlogo/packages.mk
include $(DEVICE_PATH)/proprietary/sony-togari/packages.mk
include $(DEVICE_PATH)/proprietary/sony-rhine/packages.mk
include $(DEVICE_PATH)/proprietary/qcom-adreno-a3xx/packages.mk
include $(DEVICE_PATH)/proprietary/qcom-msm8974/packages.mk
include $(DEVICE_PATH)/proprietary/qcom-common/packages.mk
