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

# Inherit the fusion-common definitions
$(call inherit-product, device/sony/rhine-common/rhine.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/togari/overlay

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
   $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Sensors
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensor_def_qcomdev.conf


# Thermal manager
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/togari/togari-vendor.mk)

# add missing proprietary files
LOCAL_VENDOR_SONY_RHINE_COMMON := $(LOCAL_PATH)/repocopy/proprietary/vendor/sony/rhine-common/proprietary
LOCAL_VENDOR_SONY_TOGARI       := $(LOCAL_PATH)/repocopy/proprietary/vendor/sony/togari/proprietary

PRODUCT_COPY_FILES += \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/sensors_calib.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors_calib.conf \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b00:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b00 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b01:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b01 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b02:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b02 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b03:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b03 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b04:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b04 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b05:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b05 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b06:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b06 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b07:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b07 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b08:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b08 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b09:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b09 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b10:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b10 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.b11:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.b11 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/adsp.mdt:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/adsp.mdt \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.b00:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.b00 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.b01:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.b01 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.b02:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.b02 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.b03:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.b03 \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.flist:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.flist \
	 $(LOCAL_VENDOR_SONY_RHINE_COMMON)/etc/firmware/tzhdcp.mdt:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/tzhdcp.mdt \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Hdmi_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Hdmi_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Global_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Global_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Headset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Headset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Bluetooth_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Bluetooth_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_General_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_General_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Speaker_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Speaker_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Liquid/Liquid_Handset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Liquid/Liquid_Handset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_General_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_General_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Headset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Headset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Global_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Global_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Hdmi_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Hdmi_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Handset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Handset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Bluetooth_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Bluetooth_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/Fluid/Fluid_Speaker_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/Fluid/Fluid_Speaker_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Speaker_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Global_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Global_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Handset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_General_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_General_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/acdbdata/MTP/MTP_Headset_cal.acdb:$(TARGET_COPY_OUT_SYSTEM)/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/firmware/mba.b00:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/mba.b00 \
	 $(LOCAL_VENDOR_SONY_TOGARI)/etc/firmware/mba.mdt:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/mba.mdt

# Bootlogo
PRODUCT_COPY_FILES += \
	$(LOCAL_VENDOR_SONY_TOGARI)/logo.rle:$(TARGET_COPY_OUT_RAMDISK)/logo.rle

# undefine LOCAL_VENDOR_SONY_RHINE_COMMON
# undefine LOCAL_VENDOR_SONY_TOGARI
