#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# RisingOS Revived 9 (Android 17, seventeen) for caimito (komodo, caiman)

# Maintainer: lunch banner and OFFICIAL/UNOFFICIAL/COMMUNITY build type
RISING_MAINTAINER := vilckindima
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Google Tensor G4" \
    RisingMaintainer="Vilckin Dima"

# UDFPS animations and icons from vendor/addons
TARGET_HAS_UDFPS := true

# Pixel Camera from the factory image replaces Aperture and Pixel Launcher stays
# the default launcher. Skip the extra apps Rising adds by default: the super
# partition has little headroom.
TARGET_FACE_UNLOCK_SUPPORTED := false
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := false

# Rising and its GMS install apps and properties into the system partition,
# which generic_system.mk does not allow. This turns off the Make side of the
# artifact path check; lineage_<device>.mk turns off the Soong side.
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Google charging optimization and battery health pages. Rising turns them off
# because Google's charging policy and Lineage charging control fight over the
# charger. The charging owner arbiter in lineage-sdk serializes the two, so turn
# the pages back on, but only when that lineage-sdk is in the tree.
ifneq ($(wildcard lineage-sdk/lineage/lib/main/java/org/lineageos/platform/internal/health/ChargingControlOwner.java),)
PRODUCT_COPY_FILES += \
    device/google/caimito/charging-component-overrides.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/charging-component-overrides.xml
endif
