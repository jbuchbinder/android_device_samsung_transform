# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/transform/prelink-linux-arm-transform.map

DEVICE_PACKAGE_OVERLAYS += device/samsung/transform/overlay

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
    device/samsung/transform/media_profiles.xml:system/etc/media_profiles.xml

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
# Copy transform specific prebuilt files
#

#
# AKMD
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/akmd/akmd:system/bin/akmd

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/wifi/libwlmlogger.so:system/lib/libwlmlogger.so \
    device/samsung/transform/prebuilt/transform/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/transform/prebuilt/transform/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/transform/prebuilt/acclaim/wifi/rtecdc.bin:system/etc/rtecdc.bin \
    device/samsung/transform/prebuilt/acclaim/wifi/rtecdc_apsta.bin:system/etc/rtecdc_apsta.bin \
    device/samsung/transform/prebuilt/transform/wifi/nvram_mfg.txt:system/etc/nvram_mfg.txt \
    device/samsung/transform/prebuilt/transform/wifi/rtecdc_mfg.bin:system/etc/rtecdc_mfg.bin \
    device/samsung/transform/prebuilt/transform/wifi/bcm_supp.conf:system/etc/bcm_supp.conf \
    device/samsung/transform/prebuilt/transform/wifi/wifi.conf:system/etc/wifi.conf \
    device/samsung/transform/prebuilt/transform/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/transform/prebuilt/transform/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/transform/prebuilt/transform/wifi/wlservice:system/bin/wlservice

#
# Display (3D)
#
#PRODUCT_COPY_FILES += \
#    device/samsung/transform/prebuilt/transform/fimg-libs/egl.cfg:system/lib/egl/egl.cfg

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0040.kl:system/usr/keylayout/s3c-keypad-rev0040.kl \
    device/samsung/transform/prebuilt/transform/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0040.kcm.bin:system/usr/keychars/s3c-keypad-rev0040.kcm.bin

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/vold/vold.fstab:system/etc/vold.fstab \
    device/samsung/transform/prebuilt/transform/vovld/vold.conf:system/etc/vold.conf

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/ril/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/transform/prebuilt/transform/ril/rild:system/bin/rild
#    device/samsung/transform/prebuilt/transform/ril/drexe:system/bin/drexe \
#    device/samsung/transform/prebuilt/transform/ril/efsd:system/bin/efsd \
#    device/samsung/transform/prebuilt/transform/ril/rilclient-test:system/bin/rilclient-test \

#
# GSM APN list
#
#PRODUCT_COPY_FILES += \
#    device/samsung/transform/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/audio/asound.conf:system/etc/asound.conf

#
# SamdroidTools
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/samdroidtools/SamdroidTools.apk:system/app/SamdroidTools.apk \
    device/samsung/transform/prebuilt/transform/samdroidtools/libsamdroidtools.so:system/lib/libsamdroidtools.so

#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/bt/BCM4325D1_004.002.004.0153.0173.hcd:system/bin/BCM4325D1_004.002.004.0153.0173.hcd

#
# system/sd
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/placeholder/.placeholder:system/sd/.placeholder

#
# Setup device specific product configuration.
#
PRODUCT_NAME := full_transform
PRODUCT_DEVICE := SPH-M920
PRODUCT_MODEL := SPH-M920
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

