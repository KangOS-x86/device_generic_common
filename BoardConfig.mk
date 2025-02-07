#
# BoardConfig.mk for x86 platform
#

TARGET_BOARD_PLATFORM := android-x86

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth
BOARD_SEPOLICY_DIRS += system/bt/vendor_libs/linux/sepolicy

BOARD_USE_LEGACY_UI := true

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
endif

# the following variables could be overridden
TARGET_PRELINK_MODULE := false
TARGET_NO_KERNEL ?= false
TARGET_NO_RECOVERY ?= true
TARGET_EXTRA_KERNEL_MODULES := tp_smapi
ifneq ($(filter efi_img,$(MAKECMDGOALS)),)
TARGET_KERNEL_ARCH ?= x86_64
endif
TARGET_USES_64_BIT_BINDER := true

BOARD_USES_GENERIC_AUDIO ?= false
BOARD_USES_ALSA_AUDIO ?= true
BUILD_WITH_ALSA_UTILS ?= true
BOARD_HAS_GPS_HARDWARE ?= true

# Don't build emulator
BUILD_EMULATOR ?= false
BUILD_STANDALONE_EMULATOR ?= false
BUILD_EMULATOR_QEMUD ?= false
BUILD_EMULATOR_OPENGL ?= false
BUILD_EMULATOR_OPENGL_DRIVER ?= false
BUILD_EMULATOR_QEMU_PROPS ?= false
BUILD_EMULATOR_CAMERA_HAL ?= false
BUILD_EMULATOR_GPS_MODULE ?= false
BUILD_EMULATOR_LIGHTS_MODULE ?= false
BUILD_EMULATOR_SENSORS_MODULE ?= false

BUILD_ARM_FOR_X86 := $(WITH_NATIVE_BRIDGE)

BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true
USE_INTEL_OMX_COMPONENTS := true

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS ?= 3
BOARD_USES_DRM_GRALLOC := true
BOARD_USES_DRM_HWCOMPOSER ?= true

BOARD_USES_MINIGBM := true
BOARD_USES_MINIGBM_INTEL := true
BOARD_USES_GRALLOC1 := true
BOARD_USES_IA_HWCOMPOSER := true
TARGET_USES_HWC2 ?= true
#BOARD_USES_VULKAN := true

USE_CAMERA_STUB ?= false

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

# This enables the wpa wireless driver
BOARD_WPA_SUPPLICANT_DRIVER ?= NL80211
WPA_SUPPLICANT_VERSION ?= VER_2_1_DEVEL

BOARD_GPU_DRIVERS ?= i915 i965 iris nouveau r300g r600g radeonsi virgl vmwgfx
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
endif

BOARD_KERNEL_CMDLINE := root=/dev/ram0$(if $(filter x86_64,$(TARGET_ARCH) $(TARGET_KERNEL_ARCH)),, vmalloc=192M)
TARGET_KERNEL_DIFFCONFIG := device/generic/common/selinux_diffconfig

COMPATIBILITY_ENHANCEMENT_PACKAGE := true
PRC_COMPATIBILITY_PACKAGE := true
ZIP_OPTIMIZATION_NO_INTEGRITY := true

DEVICE_MANIFEST_FILE := device/generic/common/manifest.xml

BOARD_SEPOLICY_DIRS += device/generic/common/sepolicy/nonplat \
                       system/bt/vendor_libs/linux/sepolicy \

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := device/generic/common/sepolicy/plat_private

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 33554432
BOARD_USES_OEMIMAGE := true
BUILD_BROKEN_USES_NETWORK := true
USE_XML_AUDIO_POLICY_CONF := 1

BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

ifeq ($(USE_LIBNDK_TRANSLATION_NB),true)
-include vendor/google/emu-x86/board/native_bridge_arm_on_x86.mk
endif

ifeq ($(USE_CROS_HOUDINI_NB),true)
-include vendor/google/chromeos-x86/board/native_bridge_arm_on_x86.mk
endif

STAGEFRIGHT_AVCENC_CFLAGS := -DANDROID_GCE
