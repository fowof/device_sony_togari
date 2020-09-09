###### forked from [115ek/twrp_device_sony_amami](https://github.com/115ek/twrp_device_sony_amami)

# TWRP for Sony Xperia Z Ultra

Minimal tree to build TWRP

## Compile

    export ALLOW_MISSING_DEPENDENCIES=true
    . build/envsetup.sh
    lunch omni_togari-eng
    mka adbd recoveryimage

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core (4x2.2 GHz Krait 400)
Chipset | Qualcomm MSM8974 Snapdragon 800
GPU     | Adreno 330
Memory  | 2 GB RAM
Shipped Android Version | 4.2
Storage | 16 GB
Battery | Li-ion 3050 mAh battery
Display | 1080 × 1920 pixels, 6.44 inches (342 ppi pixel density)
Rear Camera  | 8.08 MP 1/4" Exmor RS IMX134 back-illuminated CMOS image sensor
Front Camera | 2.07 MP
