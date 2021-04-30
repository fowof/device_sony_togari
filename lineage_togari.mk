# Inherit Lineage common Phone stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

$(call inherit-product, device/sony/togari/full_togari.mk)

PRODUCT_NAME := lineage_togari

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6833
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/C6833/C6833:5.1.1/14.6.A.1.236/834130922:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="C6833-user 5.1.1 14.6.A.1.236 834130922 release-keys"

# AICP Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
        DEVICE_MAINTAINERS="SpiritCroc"
