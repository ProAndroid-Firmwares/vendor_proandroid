PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif


#APN LIST
PRODUCT_COPY_FILES := \
     vendor/proandroid/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# LatinIME Gesture typing
ifneq ($(filter shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/proandroid/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/proandroid/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/proandroid/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/proandroid/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
endif

# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/proandroid/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Boot animation include
PRODUCT_COPY_FILES += \
	vendor/proandroid/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
	
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
    ProandroidLauncher \
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
