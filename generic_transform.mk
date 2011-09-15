# Generic leshakmod product
PRODUCT_NAME := CyanogenMod
PRODUCT_BRAND := criminal
PRODUCT_DEVICE := generic

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=amend

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapsize=32m

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# mobile interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0

#scan interval
PRODUCT_PROPERTY_OVERRIDES += \
wifi.supplicant_scan_interval=90

# Repeat ring tone on incoming calls (CM/Blade)
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.call_ring.multiple=false

# OpenVPN
PRODUCT_PACKAGES += \
    openvpn

PRODUCT_PACKAGES += \
    ADWLauncher \
    AndroidTerm \
    CMParts \
    CMStats \
    CMUpdateNotify \
    CMWallpapers \
    FileManager \
    Pacman \
    Stk \
    Superuser

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    librs_jni

# Packages in device dir
PRODUCT_PACKAGES += \
    libs3cjpeg.so \
    libcamera.so \
    copybit.SPH-M920 \
    gps.SPH-M920 \
    gralloc.SPH-M920 \
    lights.SPH-M920 \
    sensors.SPH-M920 \
    libsecgps.so \
    libsecril-client.so \
    libGLES_fimg \
    libfimg

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/transform/overlay/transform

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    device/samsung/transform/prebuilt/common/bin/remount:system/bin/remount \
    device/samsung/transform/prebuilt/common/bin/compcache:system/bin/compcache \
    device/samsung/transform/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    device/samsung/transform/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    device/samsung/transform/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    device/samsung/transform/prebuilt/common/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
    device/samsung/transform/prebuilt/common/etc/init.d/05apps2sdoff:system/etc/init.d/05apps2sdoff \
    device/samsung/transform/prebuilt/common/etc/init.d/07userinit:system/etc/init.d/07userinit \
    device/samsung/transform/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    device/samsung/transform/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    device/samsung/transform/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/samsung/transform/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    device/samsung/transform/prebuilt/common/etc/profile:system/etc/profile \
    device/samsung/transform/prebuilt/common/xbin/bash:system/xbin/bash \
    device/samsung/transform/prebuilt/common/xbin/htop:system/xbin/htop \
    device/samsung/transform/prebuilt/common/xbin/lsof:system/xbin/lsof \
    device/samsung/transform/prebuilt/common/xbin/nano:system/xbin/nano \
    device/samsung/transform/prebuilt/common/xbin/powertop:system/xbin/powertop \
    device/samsung/transform/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

SPICA_WITH_GOOGLE:=true
# I'll always build with gapps :)
ifdef SPICA_WITH_GOOGLE
PRODUCT_COPY_FILES += \
    vendor/transform/proprietary/CarHomeLauncher.apk:system/app/CarHomeLauncher.apk \
    vendor/transform/proprietary/FOTAKill.apk:system/app/FOTAKill.apk \
    vendor/transform/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
    vendor/transform/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/transform/proprietary/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/transform/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/transform/proprietary/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/transform/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/transform/proprietary/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
    vendor/transform/proprietary/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/transform/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
    vendor/transform/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
    vendor/transform/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/transform/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/transform/proprietary/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/transform/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/transform/proprietary/Talk.apk:system/app/Talk.apk \
    vendor/transform/proprietary/Vending.apk:system/app/Vending.apk \
    vendor/transform/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/transform/proprietary/features.xml:system/etc/permissions/features.xml \
    vendor/transform/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/transform/proprietary/libvoicesearch.so:system/lib/libvoicesearch.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
	vendor/transform/CHANGELOG:system/etc/CHANGELOG.txt

PRODUCT_COPY_FILES += \
	vendor/cyanogen/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

#
# Copy bootanimation
#
PRODUCT_COPY_FILES += \
	device/samsung/transform/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
