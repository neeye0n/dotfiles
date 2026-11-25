local vars = require("vars")
-- Optional NVIDIA-specific tweaks. Keep false unless you explicitly want them.
local enable_nvidia_optional = vars.is_gpu_nvidia

local exec_once = {
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1",
    "gnome-keyring-daemon --start --components=secrets",
    "systemctl --user start --ignore-dependencies xdg-desktop-portal-hyprland.service xdg-desktop-portal.service",
    "noctalia",
    "wl-clip-persist --clipboard regular",
    "sh -c 'sleep 3 && easyeffects --gapplication-service'",
    "steam -silent",
    "vesktop --start-minimized"
}

local nvidia_exec_once_optional = {
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
}


hl.on("hyprland.start", function()
    for _, cmd in ipairs(exec_once) do
        hl.exec_cmd(cmd)
    end

    if enable_nvidia_optional then
        for _, cmd in ipairs(nvidia_exec_once_optional) do
            hl.exec_cmd(cmd)
        end
    end

    -- Run one final reload after startup commands have had time to initialize.
    hl.exec_cmd([[bash -lc 'sleep 2; hyprctl reload']])
end)

return true
