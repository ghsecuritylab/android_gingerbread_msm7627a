# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(QC_PROP),true)
    BOARD_USES_QCOM_HARDWARE := true
    BOARD_USES_ADRENO_200 := true
    HAVE_ADRENO200_SOURCE := true
    HAVE_ADRENO200_SC_SOURCE := true
    HAVE_ADRENO200_FIRMWARE := true
    BOARD_USES_QCOM_AUDIO_V2 := true
    BOARD_USE_QCOM_TESTONLY := true
    TARGET_USES_SF_BYPASS := true
    TARGET_USES_C2D_COMPOSITION := true
    BOARD_USES_QCNE := true
    TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
    TARGET_HAS_S3D_SUPPORT := true
    WEBCORE_INPAGE_VIDEO := true

    ifneq ($(BUILD_TINY_ANDROID), true)
    BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
    BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
    BOARD_CAMERA_LIBRARIES := libcamera
    BOARD_HAVE_BLUETOOTH := true
    BOARD_HAVE_QCOM_FM := true
    BOARD_HAS_QCOM_WLAN := true
    BOARD_WPA_SUPPLICANT_DRIVER := WEXT
    WPA_SUPPLICANT_VERSION := VER_0_6_X
    WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
    WIFI_SDIO_IF_DRIVER_MODULE_NAME := "librasdioif"
    WIFI_SDIO_IF_DRIVER_MODULE_ARG  := ""
    HAVE_QC_TIME_SERVICES := true
    endif   # !BUILD_TINY_ANDROID
else
    BOARD_USES_GENERIC_AUDIO := true
    USE_CAMERA_STUB := true

endif # QC_PROP

BOARD_USES_ADRENO_200 := true
HAVE_ADRENO200_SOURCE := true
HAVE_ADRENO200_SC_SOURCE := true
HAVE_ADRENO200_FIRMWARE := true
TARGET_HAVE_TSLIB := false
TARGET_HAVE_HDMI_OUT := true
TARGET_USES_OVERLAY := true
TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
QCOM_TARGET_PRODUCT := msm8660_surf

BOARD_KERNEL_BASE    := 0x40200000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_USES_LAUNCHER_V1 := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom
BOARD_EGL_CFG := device/qcom/$(TARGET_PRODUCT)/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 125829120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_PERSISTIMAGE_PARTITION_SIZE := 4096000
BOARD_CACHEIMAGE_PARTITION_SIZE := 4096000
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
# Set to 9 for 8650A
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

HAVE_CYTTSP_FW_UPGRADE := true