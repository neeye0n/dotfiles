local vars = require("vars")
-- Optional NVIDIA-specific tweaks. Keep false unless you explicitly want them.
local enable_nvidia_optional = vars.is_gpu_nvidia

local env = {
    "XDG_CURRENT_DESKTOP,Hyprland",
    "XDG_SESSION_TYPE,wayland",
    "QT_QPA_PLATFORMTHEME,qt6ct",
    "QT_AUTO_SCREEN_SCALE_FACTOR,1",
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1",
    "ELECTRON_OZONE_PLATFORM_HINT,wayland",
    -- workaround for gtk4 blur effects ( https://github.com/hyprwm/Hyprland/discussions/16507#discussioncomment-18806397)
    "GDK_WAYLAND_DISABLE,ext_background_effect_manager_v1"
}

local nvidia_optional = {
    "WLR_NO_HARDWARE_CURSORS,1",
    "LIBVA_DRIVER_NAME,nvidia",
    "GBM_BACKEND,nvidia-drm",
    "__GLX_VENDOR_LIBRARY_NAME,nvidia",
    "NVD_BACKEND,direct",
}

for _, item in ipairs(env) do
    local key, value = item:match("^([^,]+),(.+)$")
    if key and value then
        hl.env(key, value)
    end
end

if enable_nvidia_optional then
    for _, item in ipairs(nvidia_optional) do
        local key, value = item:match("^([^,]+),(.+)$")
        if key and value then
            hl.env(key, value)
        end
    end
end
