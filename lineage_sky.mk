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
PRODUCT_MODEL := 23076RA4BR
PRODUCT_NAME := lineage_sky

# Marketing name shown in Settings > About phone.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.marketname=Redmi 12 5G

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Maintainer. LineageOS reads PRODUCT_MAINTAINER when generating the build
# metadata that ships in the ROM (proprietary/lineage build vars are set by the
# build script, so the build type is not declared here).
PRODUCT_MAINTAINER := Yassin

# Fingerprint of the stock ROM these blobs were extracted from. Verified against
# the extracted vendor/build_S88029JA1.prop, which is the SKU that carries our
# retail model number:
#   ro.vendor.build.fingerprint=Redmi/river_jp/river:14/UKQ1.231003.002/OS2.0.204.0.VMWJPXM:user/release-keys
#   ro.product.vendor.model=23076RA4BR
#   ro.product.vendor.marketname=Redmi 12 5G
#   ro.product.device=river
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="river_jp-user 14 UKQ1.231003.002 OS2.0.204.0.VMWJPXM release-keys" \
    BuildFingerprint=Redmi/river_jp/river:14/UKQ1.231003.002/OS2.0.204.0.VMWJPXM:user/release-keys \
    DeviceProduct=river_jp
