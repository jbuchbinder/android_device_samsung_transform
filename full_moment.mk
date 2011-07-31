# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/moment/prelink-linux-arm-moment.map

DEVICE_PACKAGE_OVERLAYS += device/samsung/moment/overlay

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

PRODUCT_COPY_FILES += \
        device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml 

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/moment/media_profiles.xml:system/etc/media_profiles.xml

# T-Mobile theme engine
PRODUCT_PACKAGES += \
       ThemeManager \
       ThemeChooser \
       com.tmobile.themes

PRODUCT_COPY_FILES += \
       vendor/cyanogen/prebuilt/common/etc/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

# Theme packages
PRODUCT_PACKAGES += \
       Androidian \
       Cyanbread

#
# Copy moment specific prebuilt files
#

#
# AKMD
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/akmd/akmd:system/bin/akmd

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/wifi/libwlmlogger.so:system/lib/libwlmlogger.so \
    device/samsung/moment/prebuilt/moment/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/moment/prebuilt/moment/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/moment/prebuilt/acclaim/wifi/rtecdc.bin:system/etc/rtecdc.bin \
    device/samsung/moment/prebuilt/acclaim/wifi/rtecdc_apsta.bin:system/etc/rtecdc_apsta.bin \
    device/samsung/moment/prebuilt/moment/wifi/nvram_mfg.txt:system/etc/nvram_mfg.txt \
    device/samsung/moment/prebuilt/moment/wifi/rtecdc_mfg.bin:system/etc/rtecdc_mfg.bin \
    device/samsung/moment/prebuilt/moment/wifi/bcm_supp.conf:system/etc/bcm_supp.conf \
    device/samsung/moment/prebuilt/moment/wifi/wifi.conf:system/etc/wifi.conf \
    device/samsung/moment/prebuilt/moment/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/spica/prebuilt/spica/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/spica/prebuilt/spica/wifi/wlservice:system/bin/wlservice

#
# Display (3D)
#
#PRODUCT_COPY_FILES += \
#    device/samsung/spica/prebuilt/spica/fimg-libs/egl.cfg:system/lib/egl/egl.cfg

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/keys/s3c-keypad-rev0040.kl:system/usr/keylayout/s3c-keypad-rev0040.kl \
    device/samsung/moment/prebuilt/moment/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/moment/prebuilt/moment/keys/s3c-keypad-rev0040.kcm.bin:system/usr/keychars/s3c-keypad-rev0040.kcm.bin

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/vold/vold.fstab:system/etc/vold.fstab

#
# RIL
#
PRODUCT_COPY_FILES += \
#    device/samsung/moment/prebuilt/moment/ril/drexe:system/bin/drexe \
#    device/samsung/moment/prebuilt/moment/ril/efsd:system/bin/efsd \
#    device/samsung/moment/prebuilt/moment/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/moment/prebuilt/moment/ril/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/moment/prebuilt/moment/ril/rild:system/bin/rild

#
# GSM APN list
#
#PRODUCT_COPY_FILES += \
#    device/samsung/spica/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/audio/asound.conf:system/etc/asound.conf

#
# SamdroidTools
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/samdroidtools/SamdroidTools.apk:system/app/SamdroidTools.apk \
    device/samsung/moment/prebuilt/moment/samdroidtools/libsamdroidtools.so:system/lib/libsamdroidtools.so

#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/bt/BCM4325D1_004.002.004.0153.0173.hcd:system/bin/BCM4325D1_004.002.004.0153.0173.hcd

#
# system/sd
#
PRODUCT_COPY_FILES += \
    device/samsung/moment/prebuilt/moment/placeholder/.placeholder:system/sd/.placeholder

#
# Setup device specific product configuration.
#
PRODUCT_NAME := full_moment
PRODUCT_DEVICE := SPH-M900
PRODUCT_MODEL := SPH-M900
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

