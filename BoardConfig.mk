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


BOARD_VENDOR          := sony
BOARD_VENDOR_PLATFORM := rhine

BUILD_BROKEN_DUP_RULES := true

# Use Snapdragon LLVM Compiler if available
TARGET_USE_SDCLANG := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/sony/togari/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
# TARGET_NO_RECOVERY   := false # from n-mr0
# TARGET_NO_KERNEL     := false # from n-mr0

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
BOARD_USES_ALSA_AUDIO                             := true
AUDIO_FEATURE_DISABLED_USBAUDIO                   := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC              := true
# AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS        := true # from n-mr0
USE_LEGACY_LOCAL_AUDIO_HAL                        := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT                := true
USE_XML_AUDIO_POLICY_CONF                         := 1
USE_CUSTOM_AUDIO_POLICY                           := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH      := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT     := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/togari/include/bluetooth


# Camera
TARGET_PROVIDES_CAMERA_HAL                        := true
USE_DEVICE_SPECIFIC_CAMERA                        := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS            := true
TARGET_HAS_LEGACY_CAMERA_HAL1                     := true
TARGET_USES_MEDIA_EXTENSIONS                      := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22
# TARGET_USES_AOSP              := true # from n-mr0
# BOARD_QTI_CAMERA_32BIT_ONLY   := true # from n-mr0
# BOARD_QTI_CAMERA_V2           := true # from n-mr0


# Charger
HEALTHD_ENABLE_TRICOLOR_LED      := true
BOARD_CHARGER_ENABLE_SUSPEND     := true
BOARD_CHARGER_SHOW_PERCENTAGE    := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH                   := /sys/class/leds/lcd-backlight/brightness
RED_LED_PATH                     := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH                   := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH                    := /sys/class/leds/led:rgb_blue/brightness
# BOARD_HAL_STATIC_LIBRARIES       += libhealthd.$(TARGET_DEVICE) from n-mr0

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
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET  := true
TARGET_NO_RPC                          := true

# Filesystem
TARGET_FS_CONFIG_GEN += device/sony/togari/config.fs
BOARD_FLASH_BLOCK_SIZE           := 131072
TARGET_USERIMAGES_USE_EXT4       := true
TARGET_USERIMAGES_USE_F2FS       := true

# FM Radio
AUDIO_FEATURE_ENABLED_FM   := true
BOARD_HAVE_QCOM_FM         := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Graphics
USE_OPENGL_RENDERER                     := true
TARGET_USES_ION                         := true
# TARGET_USES_C2D_COMPOSITION := true # from n-mr0
# TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true # from n-mr0
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
BOARD_SEPOLICY_DIRS += device/sony/togari/sepolicy/common
BOARD_SEPOLICY_DIRS += device/sony/togari/sepolicy/msm8974

# Treble
DEVICE_MANIFEST_FILE := device/sony/togari/treble-manifest.xml


##############

# Platform


# Kernel information
BOARD_KERNEL_IMAGE_NAME   := zImage
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 2048
BOARD_KERNEL_TAGS_OFFSET  := 0x01E00000
BOARD_RAMDISK_OFFSET      := 0x02000000

BOARD_MKBOOTIMG_ARGS      := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS      += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_KERNEL_CMDLINE      := androidboot.hardware=togari
BOARD_KERNEL_CMDLINE      += user_debug=31
BOARD_KERNEL_CMDLINE      += msm_rtb.filter=0x3b7
BOARD_KERNEL_CMDLINE      += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE      += androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE      += vmalloc=300M
BOARD_KERNEL_CMDLINE      += dwc3.maximum_speed=high
BOARD_KERNEL_CMDLINE      += dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE      += mem=1759M
# BOARD_KERNEL_CMDLINE      += androidboot.selinux=permissive

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"


# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony



# Init
TARGET_INIT_VENDOR_LIB := libinit_rhine

# Platform props
TARGET_SYSTEM_PROP += device/sony/togari/system.prop

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



# Recovery
TARGET_RECOVERY_FSTAB            := device/sony/togari/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT     := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON       := true
# BOARD_USE_CUSTOM_RECOVERY_FONT   := \"roboto_23x41.h\"
BOARD_USE_CUSTOM_RECOVERY_FONT   := \"roboto_15x24.h\"

# Binder API version
TARGET_USES_64_BIT_BINDER        := true


# inherit from the common rhine definitions
# include device/sony/rhine-common/BoardConfigCommon.mk

# inherit from the proprietary version
#-include vendor/sony/togari/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := C6833,togari


# Kernel properties
TARGET_KERNEL_CONFIG := lineageos_rhine_togari_row_defconfig

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 26

BOARD_BOOTIMAGE_PARTITION_SIZE     :=    20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=    16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   :=  2436890624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12891143680 # 12891176448 - 32k ? from n-mr0
BOARD_CACHEIMAGE_PARTITION_SIZE    :=   209715200

# Security patch level
VENDOR_SECURITY_PATCH := 2015-11-01

# Set seccomp policy for media server
# BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp from n-mr0
