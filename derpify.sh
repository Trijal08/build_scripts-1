#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 15

# Clone local_manifests repository
git clone https://github.com/shravansayz/local_manifests.git --depth 1 -b test  .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

export BUILD_USERNAME=shravan
export BUILD_HOSTNAME=crave

#customs
rm -rf frameworks/base
git clone https://github.com/shravansayz/frameworks_base_derp.git -b 15 frameworks/base --depth=1

# packages_apps_Settings
rm -rf packages/apps/Settings
git clone -b 15 https://github.com/shravansayz/packages_apps_Settings.git packages/apps/Settings

# audio-hal
rm -rf hardware/qcom-caf/sdm845/audio
git clone -b 15 https://github.com/Krtonia/android_hardware_qcom_audio.git hardware/qcom-caf/sdm845/audio

#Private Keys
rm -rf vendor/derp/signing
git clone https://github.com/shravansayz/private_keys.git -b rise vendor/derp/signing

# Set up build environment
source build/envsetup.sh
lunch derp_RMX1901-userdebug
make installclean
mka derp
