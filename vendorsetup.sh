#!/usr/bin/env bash set -e

-- ccache configuration --

export USE_CCACHE=1 export CCACHE_EXEC=/usr/bin/ccache export CCACHE_MAXSIZE="5G" export CCACHE_DIR="${HOME}/ccache"

Create ccache directory if missing

if [ ! -d "${CCACHE_DIR}" ]; then mkdir -p "${CCACHE_DIR}" fi

Ensure consistent locale

export LC_ALL="C"

Determine Android build tree root (fallback to current dir)

BUILD_TOP="${ANDROID_BUILD_TOP:-$(pwd)}"

Clone external/gflags into correct relative path

GFLAGS_PATH="${BUILD_TOP}/external/gflags" if [ ! -d "${GFLAGS_PATH}/.git" ]; then echo "Cloning external/gflags for minimal manifest build..." git clone https://android.googlesource.com/platform/external/gflags/ 
-b android-12.1.0_r4 "${GFLAGS_PATH}" fi

Register lunch combo(s) for GarudaX recovery

Replace twrp_GarudaX with your actual product name if needed

add_lunch_combo twrp_GarudaX-userdebug

