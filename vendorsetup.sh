#!/bin/bash

Enable ccache

export USE_CCACHE=1 export CCACHE_EXEC=/usr/bin/ccache export CCACHE_MAXSIZE="5G" export CCACHE_DIR="$HOME/ccache"

Ensure ccache directory exists (or mount it beforehand via CI)

if [ ! -d "$CCACHE_DIR" ]; then mkdir -p "$CCACHE_DIR" || { echo "Failed to create CCACHE_DIR at '$CCACHE_DIR'" exit 1 } fi

Ensure consistent locale

export LC_ALL="C"

Determine top of Android build tree (fallback to current dir)

BUILD_TOP=${ANDROID_BUILD_TOP:-$(pwd)}

Clone external/gflags only if not already present

GFLAGS_PATH="$BUILD_TOP/external/gflags" if [ ! -d "$GFLAGS_PATH/.git" ]; then echo "Cloning external/gflags for minimal manifest build..." git clone https://android.googlesource.com/platform/external/gflags/ 
-b android-12.1.0_r4 "$GFLAGS_PATH" || { echo "Error: failed to clone gflags into '$GFLAGS_PATH'" exit 1 } else echo "external/gflags already exists, skipping clone." fi

Register lunch combo(s) for GarudaX recovery

Replace <twrp_GarudaX> with your actual build product identifier

add_lunch_combo <twrp_GarudaX>-userdebug

