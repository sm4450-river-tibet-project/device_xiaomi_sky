#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the common tree
$(call inherit-product, device/xiaomi/sm4450-common/common.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 32
BOARD_SHIPPING_API_LEVEL := 31

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
AB_OTA_UPDATER := true
PRODUCT_VIRTUAL_AB_OTA := true
PRODUCT_VIRTUAL_AB_COMPRESSION := true
