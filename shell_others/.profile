export BROWSER=chromium-browser

export BLPAPI_ROOT="/home/ihsn/API/blpapi_cpp_3.12.3.1"
export VULKAN_ROOT_LOCATION="$HOME/Software/Library/"
export VULKAN_SDK_VERSION="1.1.114.0"
export VULKAN_SDK="$VULKAN_ROOT_LOCATION/vulkansdk-macos-$VULKAN_SDK_VERSION/macOS"
export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layers.d"
export PATH="$VULKAN_SDK/bin$:$PATH"

# Nodejs
VERSION=v12.13.1
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
