#
# This is the product configuration for a full solana
#

DEVICE_FOLDER := device/motorola/solana

# Device overlay
    DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay/aosp

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/audio/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    $(DEVICE_FOLDER)/audio/audio.primary.omap4.so:/system/lib/hw/audio.primary.solana.so \
    $(DEVICE_FOLDER)/audio/audio_policy.omap4.so:/system/lib/hw/audio_policy.omap4.so \
    $(DEVICE_FOLDER)/audio/libasound.so:/system/lib/libasound.so \
    $(DEVICE_FOLDER)/audio/libaudio_ext.so:/system/lib/libaudio_ext.so

# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.solana \
    sensors.solana

# Modem
PRODUCT_PACKAGES += \
    libreference-cdma-sms

# Rootfs files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/default.prop:/root/default.prop \
    $(DEVICE_FOLDER)/root/init.mapphone_cdma.rc:/root/init.mapphone_cdma.rc \
    $(DEVICE_FOLDER)/root/init.mapphone_umts.rc:/root/init.mapphone_umts.rc \
    $(DEVICE_FOLDER)/root/ueventd.rc:/root/ueventd.rc \
    $(DEVICE_FOLDER)/root/ueventd.mapphone_cdma.rc:/root/ueventd.mapphone_cdma.rc \
    $(DEVICE_FOLDER)/root/ueventd.mapphone_umts.rc:/root/ueventd.mapphone_umts.rc \

# Kexec files
ifeq ($(TARGET_PRODUCT),full_solana)
PRODUCT_COPY_FILES += device/motorola/common/prebuilt/etc/rootfs/init:root/init
endif
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/kexec/arm_kexec.ko:system/etc/kexec/arm_kexec.ko \
    $(DEVICE_FOLDER)/kexec/devtree:system/etc/kexec/devtree \
    $(DEVICE_FOLDER)/kexec/kexec.ko:system/etc/kexec/kexec.ko \
    $(DEVICE_FOLDER)/kexec/uart.ko:system/etc/kexec/uart.ko \
    out/target/product/solana/ramdisk.img:system/etc/kexec/ramdisk.img \
    out/target/product/solana/kernel:system/etc/kexec/kernel

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/battd:system/bin/battd \
    $(DEVICE_FOLDER)/prebuilt/bin/mount_ext3.sh:system/bin/mount_ext3.sh \
    $(DEVICE_FOLDER)/prebuilt/etc/firmware/ducati-m3.512MB.bin:system/etc/firmware/ducati-m3.512MB.bin \
    $(DEVICE_FOLDER)/prebuilt/etc/gps.conf:system/etc/gps.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    $(DEVICE_FOLDER)/prebuilt/etc/TICameraCameraProperties.xml:system/etc/TICameraCameraProperties.xml \

#    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \

# Phone settings
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product-if-exists, vendor/motorola/solana/solana-vendor.mk)

