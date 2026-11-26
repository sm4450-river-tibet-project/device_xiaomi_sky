#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/sky

# Inherit from the common tree
include device/xiaomi/sm4450-common/BoardConfigCommon.mk

# Architecture
# 64-bit only. The 6.12 kernel's headers_install exports the arm64 UAPI tree
# (asm/sigcontext.h uses __uint128_t, which does not exist on 32-bit ARM) into
# generated_kernel_includes, and that dir lands on -I ahead of bionic's
# asm-arm (-isystem), so every 32-bit compile that reaches <signal.h> fails.
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_SUPPORTS_32_BIT_APPS := false

# Assert
TARGET_OTA_ASSERT_DEVICE := sky

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := parrot
TARGET_NO_BOOTLOADER := true

# Kernel
# GKI mixed build: the Image comes from the 6.12 GKI + CLO tree, the vendor
# modules are built from the same tree via the parrot wiring.
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NEEDS_DTBOIMAGE := true
BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true

BOARD_KERNEL_CMDLINE := \
    disable_dma32=on

BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3

# Partitions
# Sizes are read from the stock programming tables, not guessed:
#   rawprogram4.xml -> boot_a, recovery_a, dtbo_a, vendor_boot_a
#   rawprogram0.xml -> super (1,703,936 sectors x 4096)
BOARD_FLASH_BLOCK_SIZE := 0x020000
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SUPER_PARTITION_SIZE := 6979321856

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6975127552

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_USES_METADATA_PARTITION := true

# A/B is declared in the common tree, including the OTA partition list; a second
# list here would silently replace it.

# SELinux
# The policy lives in the common tree; there is no sky-specific policy yet, and
# the common tree has no product policy (only vendor), so product is not listed.

# Platform
# This must be the literal string "true": vendor/lineage/config/BoardConfigLineage.mk
# gates hardware/qcom-caf/common/BoardConfigQcom.mk on
# `ifeq ($(BOARD_USES_QCOM_HARDWARE),true)`, and that file is what registers
# hardware/qcom-caf/{bootctrl,thermal,wlan,data-ipa-cfg-mgr} and the sound-trigger
# HAL as soong namespaces. With any other value the whole CAF layer silently
# disappears and every module from it is reported as non-existent.
BOARD_USES_QCOM_HARDWARE := true

# TARGET_BOARD_PLATFORM lives in the common tree: it is a SoC property, not a
# device one.

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

-include vendor/lineage/config/BoardConfigReservedSize.mk
