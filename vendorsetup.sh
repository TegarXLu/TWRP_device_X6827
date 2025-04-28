#!/bin/bash

# Enable ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE="5G"
export CCACHE_DIR="$HOME/ccache"

# Check whether the ccache directory is mounted
if [ ! -d "$CCACHE_DIR" ]; then
  echo "CCACHE Directory/Partition is not mounted at \"$CCACHE_DIR\""
  echo "Please edit the CCACHE_DIR build variable or mount the directory."
fi

# Ensure consistent locale
export LC_ALL="C"

# Clone external/gflags only if not already present
GFLAGS_PATH="$ANDROID_BUILD_TOP/external/gflags"
if [ ! -d "$GFLAGS_PATH/.git" ]; then
  echo "Cloning external/gflags for minimal manifest build..."
  git clone https://android.googlesource.com/platform/external/gflags/ -b android-12.1.0_r4 "$GFLAGS_PATH"
else
  echo "external/gflags already exists, skipping clone."
fi

# Register lunch combo(s) for GarudaX recovery
# Replace <product_name> with your actual build product identifier
add_lunch_combo <twrp_GarudaX>-userdebug
