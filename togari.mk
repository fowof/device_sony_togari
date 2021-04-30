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
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG      := large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Sensors
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensor_def_qcomdev.conf \
	 $(LOCAL_PATH)/configs/sensors_calib.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors_calib.conf

# Thermal manager
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml


# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:$(TARGET_COPY_OUT_ROOT)/init.device.rc

TARGET_SYSTEM_PROP += device/sony/togari/system.prop

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
# $(call inherit-product, vendor/sony/togari/togari-vendor.mk)
include device/sony/togari/proprietary/*/packages.mk
