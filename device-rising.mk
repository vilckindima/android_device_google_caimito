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

# Rising and its GMS install apps into /system, and Rising's Pixel trees turn the
# generic_system artifact path check off. The entries below are the known ones,
# so the check can be turned back on by removing the next line.
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/permissions/privapp-permissions-appbackup.xml \
    system/priv-app/AppDataBackup/AppDataBackup.apk

# GMS replaces these AOSP system apps with Google versions, which have to stay in /system
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/GooglePrintRecommendationService/GooglePrintRecommendationService.apk \
    system/priv-app/DocumentsUIGoogle/DocumentsUIGoogle.apk \
    system/priv-app/GooglePackageInstaller/GooglePackageInstaller.apk \
    system/priv-app/TagGoogle/TagGoogle.apk
