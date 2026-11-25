#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the common tree
$(call inherit-product, device/xiaomi/sm4450-common/common.mk)

# Overlays
# There is no overlay directory yet; DEVICE_PACKAGE_OVERLAYS pointed at a
# missing path. Add the variable back together with the overlay resources.

# Device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440
