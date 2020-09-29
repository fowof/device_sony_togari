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


# inherit from msm8974-common
# include device/sony/msm8974-common/BoardConfigCommon.mk


BOARD_VENDOR := sony

BUILD_BROKEN_DUP_RULES := true

# Use Snapdragon LLVM Compiler if available
TARGET_USE_SDCLANG := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/sony/togari/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel properties
ifeq (,$(filter $(TARGET_KERNEL_SOURCE),))
  TARGET_KERNEL_SOURCE := kernel/sony/msm8974
endif

# use CAF variants
BOARD_USES_QCOM_HARDWARE  := true
TARGET_USES_QCOM_BSP      := true
TARGET_QCOM_MEDIA_VARIANT := caf-msm8974

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_BOARD_PLATFORM        := msm8974

# Architecture
TARGET_ARCH                := arm
TARGET_CPU_ABI             := armeabi-v7a
TARGET_CPU_ABI2            := armeabi
TARGET_ARCH_VARIANT        := armv7-a-neon
TARGET_CPU_VARIANT         := generic
TARGET_CPU_VARIANT_RUNTIME := krait
TARGET_CUSTOM_DTBTOOL      := dtbToolLineage

# Defines for HW subsystems
# -include $(PLATFORM_PATH)/hardware/*/BoardConfig.mk

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_USBAUDIO := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22

# Charger
HEALTHD_ENABLE_TRICOLOR_LED := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH :=/sys/class/leds/lcd-backlight/brightness
RED_LED_PATH := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH := /sys/class/leds/led:rgb_blue/brightness

# Font
EXTENDED_FONT_FOOTPRINT := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# exFAT
TARGET_EXFAT_DRIVER := exfat

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Filesystem
TARGET_FS_CONFIG_GEN += $(COMMON_PATH)/config.fs

# Graphics
USE_OPENGL_RENDERER                     := true
TARGET_USES_ION                         := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS         := 3
OVERRIDE_RS_DRIVER                      := libRSDriver_adreno.so
TARGET_USES_GRALLOC1_ADAPTER            := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
SF_VSYNC_EVENT_PHASE_OFFSET_NS          := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS             := 7500000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Init configuration for init_sony
BOARD_USES_INIT_SONY := true

# Lights HAL
TARGET_PROVIDES_LIBLIGHT := true

# Partition information
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Power
TARGET_USES_INTERACTION_BOOST := true

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/sony/msm8974-common/sepolicy

# Treble
DEVICE_MANIFEST_FILE := device/sony/togari/treble-manifest.xml


##############

















# Platform
BOARD_VENDOR_PLATFORM := rhine
PRODUCT_PLATFORM      := rhine

# Kernel information
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE  += user_debug=31
BOARD_KERNEL_CMDLINE  += msm_rtb.filter=0x3b7
BOARD_KERNEL_CMDLINE  += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE  += androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE  += vmalloc=300M
BOARD_KERNEL_CMDLINE  += dwc3.maximum_speed=high
BOARD_KERNEL_CMDLINE  += dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE  += mem=1759M

#BOARD_KERNEL_CMDLINE  += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000
BOARD_MKBOOTIMG_ARGS  += --tags_offset 0x01E00000

BOARD_KERNEL_SEPARATED_DT := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

# Audio
BOARD_USES_ALSA_AUDIO              := true
USE_LEGACY_LOCAL_AUDIO_HAL         := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
USE_XML_AUDIO_POLICY_CONF          := 1
USE_CUSTOM_AUDIO_POLICY            := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH      := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT     := true

# CM Hardware
BOARD_HARDWARE_CLASS += device/sony/rhine-common/lineagehw

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# FM Radio
AUDIO_FEATURE_ENABLED_FM := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_rhine

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/rhine-common/sepolicy

# Shims
# TARGET_LD_SHIM_LIBS := \
# 	/system/vendor/bin/credmgrd|/system/vendor/lib/libshims_signal.so \
# 	/system/vendor/bin/iddd|/system/vendor/lib/libshims_idd.so \
# 	/system/vendor/bin/suntrold|/system/vendor/lib/libshims_signal.so \
# 	/system/lib/hw/camera.vendor.qcom.so|/system/vendor/lib/libshim_camera.so \
# 	/system/lib/hw/camera.vendor.qcom.so|/system/vendor/lib/libshim_cald.so \
# 	/system/lib/hw/camera.vendor.qcom.so|libsensor.so \
# 	/system/lib/libcald_pal.so|/system/vendor/lib/libshim_cald.so \
# 	/system/lib/libcammw.so|/system/vendor/lib/libshim_cald.so \
# 	/system/lib/libcammw.so|libsensor.so \
# 	/system/lib/libsomc_chokoballpal.so|/system/vendor/lib/libshim_camera.so \
# 	/system/vendor/bin/mm-qcamera-daemon|/system/vendor/lib/libc_util.so \
# 	/system/vendor/bin/mm-qcamera-daemon|libandroid.so \
# 	/system/vendor/bin/iddd|libboringssl-compat.so \

TARGET_LD_SHIM_LIBS := \
	/system/lib/hw/camera.vendor.qcom.so|/system/vendor/lib/libshim_camera.so \
	/system/lib/hw/camera.vendor.qcom.so|/system/vendor/lib/libshim_cald.so \
	/system/lib/hw/camera.vendor.qcom.so|libsensor.so \
	/system/lib/libcald_pal.so|/system/vendor/lib/libshim_cald.so \
	/system/lib/libcammw.so|/system/vendor/lib/libshim_cald.so \
	/system/lib/libcammw.so|libsensor.so \
	/system/lib/libsomc_chokoballpal.so|/system/vendor/lib/libshim_camera.so \
	/system/vendor/bin/mm-qcamera-daemon|/system/vendor/lib/libc_util.so \
	/system/vendor/bin/mm-qcamera-daemon|libandroid.so

# Platform props
TARGET_SYSTEM_PROP += device/sony/rhine-common/system.prop

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# RIL
BOARD_PROVIDES_LIBRIL            := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE           := 131072
TARGET_USERIMAGES_USE_EXT4       := true
TARGET_USERIMAGES_USE_F2FS       := true

# Recovery
TARGET_RECOVERY_FSTAB          := device/sony/togari/rootdir/fstab.full
TARGET_RECOVERY_PIXEL_FORMAT   := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON     := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/togari

# Binder API version
TARGET_USES_64_BIT_BINDER := true


# inherit from the common rhine definitions
# include device/sony/rhine-common/BoardConfigCommon.mk

# inherit from the proprietary version
#-include vendor/sony/togari/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := C6802,C6806,C6833,C6843,togari


BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/togari/bluetooth

# Kernel properties
TARGET_KERNEL_CONFIG := lineageos_rhine_togari_row_defconfig



# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE     :=    20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=    16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   :=  2436890624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12891176448
BOARD_CACHEIMAGE_PARTITION_SIZE    :=   209715200

#Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Security patch level
VENDOR_SECURITY_PATCH := 2015-11-01
