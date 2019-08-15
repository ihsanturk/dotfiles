[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
export EDITOR="emacs"
export BROWSER="safari"
export FILE="nnn"

export VULKAN_ROOT_LOCATION="$HOME/Software/Library/"
export VULKAN_SDK_VERSION="1.1.114.0"
export VULKAN_SDK="$VULKAN_ROOT_LOCATION/vulkansdk-macos-$VULKAN_SDK_VERSION/macOS"
export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layers.d"
export PATH="$VULKAN_SDK/bin$:$PATH"
