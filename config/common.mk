PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Boot animation include
PRODUCT_COPY_FILES += \
	vendor/proandroid/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

#APN LIST
PRODUCT_COPY_FILES := \
     vendor/proandroid/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
	
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

#skip Boot-Class jar check in Nougat 7.1.1
SKIP_BOOT_JARS_CHECK := true

# PROANDROID Required packages
PRODUCT_PACKAGES += \
    Launcher3 \
    ExactCalculator \
    Development \
    Terminal \
    libemoji \
    BluetoothExt \
    ExactCalculator \
    Chromium
	
# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker

PRODUCT_PACKAGE_OVERLAYS += vendor/proandroid/overlay/common

# easy way to extend to add more packages
-include vendor/extra/product.mk

#inherit PROANDROID Prebuilt Stuffs
-include vendor/prebuilt/Android.mk

# PROANDROID Versioning
-include vendor/proandroid/config/proandroid_version.mk
