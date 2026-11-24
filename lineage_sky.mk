#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Xiaomi Redmi 12 5G (sky) -- SM4450 / parrot SoC, ravelin board
#
# Hardware facts below are taken from the retail stock image
# sky_jp_global_images_OS2.0.205.0.VMWJPXM_15.0 and from the live device:
#   PRODUCT_DEVICE=sky, PRODUCT_BRAND=Redmi, PRODUCT_MODEL=12,
#   Arch=arm64, density 440, 1080x2460
#
# "ravelin" is the board codename in the Qualcomm DTS and "parrot" is the SoC
# family used by the CLO build configs. Both are driver-side identifiers and
# must not be rewritten to sky.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sky device.
$(call inherit-product, device/xiaomi/sky/device.mk)

# Inherit from the LineageOS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := sky
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi 12 5G
PRODUCT_NAME := lineage_sky

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Fingerprint of the stock ROM this tree extracts from. Must match the image
# used with extract-files, otherwise the vendor blob set will not correlate.
#
# Verified against the extracted vendor/odm images:
#   ro.vendor.build.fingerprint=Redmi/sky/sky:12/SKQ1.230118.001/OS2.0.204.0.VMWJPXM:user/release-keys
#   ro.vendor.build.version.sdk=32
#   ro.vendor.build.security_patch=2026-04-05
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sky-user 12 SKQ1.230118.001 OS2.0.204.0.VMWJPXM release-keys" \
    BuildFingerprint=Redmi/sky/sky:12/SKQ1.230118.001/OS2.0.204.0.VMWJPXM:user/release-keys \
    DeviceProduct=sky
