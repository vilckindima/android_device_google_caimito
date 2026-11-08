#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := komodo
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/komodo
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := infinity_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Boot animation
TARGET_SCREEN_HEIGHT := 2992
TARGET_SCREEN_WIDTH := 1344

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="komodo-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildSystemDesc="generic_system_google-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildFingerprint=google/komodo/komodo:17/CP3A.261005.005/16271449:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP3A.261005.005/16271449:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# Project Infinity X
INFINITY_MAINTAINER ?= vilckindima
WITH_GAPPS ?= true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
# zumapro ships the stock Pixel face unlock HAL
TARGET_PROVIDES_FACE_UNLOCK_HAL := true

# About phone: marketing name, SoC and cameras
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/infinity.prop

# Infinity X and its GMS add apps and properties to the system partition,
# which the generic_system artifact path check rejects. DISABLE_* turns off
# the Make side, PRODUCT_ENFORCE_* the Soong side; the latter has to be set
# here, in the top product makefile, to win over "relaxed" from aosp_common.mk.
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

# generic_system.mk adds the gms_mainline release config, whose
# RELEASE_APEX_CONTRIBUTIONS_* select Google's prebuilt mainline modules
# (*.google.contributions.prebuilt). They are not in this tree. Without GMS
# (LineageOS) core/product_config.mk switches them off by itself; the
# com.google.android.* packages from GMS make it treat the product as a
# Google one. Build mainline from source, as LineageOS does.
PRODUCT_BUILD_IGNORE_APEX_CONTRIBUTION_CONTENTS := true

# Defined both in the stock blobs and in GMS: install the GMS copy
PRODUCT_PACKAGES += \
    AICorePrebuilt-aicore_20260302.01_RC00

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
