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


COMMON_PATH := device/sony/msm8974-common

# Include HW subsystem-specific makefiles
# -include $(LOCAL_PATH)/hardware/*/packages.mk
# -include $(LOCAL_PATH)/hardware/*/copy.mk
# -include $(LOCAL_PATH)/hardware/*/prop.mk

# Include msm8974-common system properties
-include $(LOCAL_PATH)/systemprop.mk

# inherit hidl hals
$(call inherit-product, device/sony/togari/hidl.mk)

# Permissions
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/vendor/etc/permissions/permissions_sony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/permissions_sony.xml

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
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml
# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/external_camera_config.xml:system/vendor/etc/external_camera_config.xml

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

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:system/etc/sap.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

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

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml

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
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay
ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-wifionly
endif

# Power
# now qti binderised

# Snap Camera
PRODUCT_PACKAGES += \
    Snap

# Recovery
PRODUCT_PACKAGES += \
    keycheck

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

#  Mobile Data
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2

# Thermal management
PRODUCT_PACKAGES += \
    thermanager \
    thermal.default

# TimeKeep for managing time offsets w.r.t. RTC
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

# Include non-opensource parts
# $(call inherit-product, vendor/sony/msm8974-common/msm8974-common-vendor.mk)

# Inherit the fusion-common definitions
# $(call inherit-product, device/sony/rhine-common/rhine.mk)

########

# inherit from msm8974-common
# $(call inherit-product, device/sony/msm8974-common/msm8974.mk)

COMMON_PATH := device/sony/rhine-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.google.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/c6x02.sh:c6x02.sh

# APEX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ld.config.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/swcodec/ld.config.txt

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/vendor/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/vendor/etc/usb_audio_policy_configuration.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Bluetooth
PRODUCT_PACKAGES += \
   libbt-vendor

# BoringSSL hacks
PRODUCT_PACKAGES += \
    libboringssl-compat

# Camera
PRODUCT_PACKAGES += \
    tad_static \
    wait4tad_static \
    libshim_cald \
    libc_util \
    libshim_camera

# Music FX
PRODUCT_PACKAGES += \
    MusicFX

# Init
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.msm8974-common.rc:root/init.msm8974-common.rc \
    $(COMMON_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(COMMON_PATH)/rootdir/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/init.camera.rc:root/init.camera.rc \
    $(COMMON_PATH)/rootdir/init.qcom.power.rc:root/init.qcom.power.rc \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc


PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/vendor/bin/credmgrfirstboot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/credmgrfirstboot.sh


# Connectivity
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# IPC Security Config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/sec_config:system/vendor/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/mhl-rcp.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/mhl-rcp.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8974-taiko-mtp-snd-card_Button_Jack.kl

# MAC address - BT and Wi-Fi
PRODUCT_PACKAGES += \
    macaddrsetup

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml
BOARD_RIL_CLASS := ../../../$(COMMON_PATH)/ril/
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyRIL

# TimeKeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

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
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):$(TARGET_COPY_OUT_VENDOR)/etc/nfcee_access.xml

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v28/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libbase-v28.so

# WiFi
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    wcnss_service

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:/system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(COMMON_PATH)/rootdir/system/etc/hostapd/hostapd_default.conf:/system/etc/hostapd/hostapd_default.conf

# Custom wifi service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/android.hardware.wifi@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.wifi@1.0-service.rc

# Media profile
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(COMMON_PATH)/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Include non-opensource parts
# $(call inherit-product, vendor/sony/rhine-common/rhine-common-vendor.mk)

###########














DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay
DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay-radio
DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay-msm8974
DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay-wifionly

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG      := large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:$(TARGET_COPY_OUT_ROOT)/init.device.rc

# Audio
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Sensors
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensor_def_qcomdev.conf \
	 $(LOCAL_PATH)/rootdir/system/etc/sensors/sensor_calib.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensor_calib.conf


# Thermal manager
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/rootdir/system/etc/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
# $(call inherit-product, vendor/sony/togari/togari-vendor.mk)

# vibrator
PRODUCT_PACKAGES += vibrator.default

include $(LOCAL_PATH)/proprietary/c6833-modem/packages.mk
include $(LOCAL_PATH)/proprietary/c6833-bootlogo/packages.mk
include $(LOCAL_PATH)/proprietary/sony-togari/packages.mk
include $(LOCAL_PATH)/proprietary/sony-rhine/packages.mk
include $(LOCAL_PATH)/proprietary/qcom-adreno-a3xx/packages.mk
include $(LOCAL_PATH)/proprietary/qcom-msm8974/packages.mk
include $(LOCAL_PATH)/proprietary/qcom-common/packages.mk
