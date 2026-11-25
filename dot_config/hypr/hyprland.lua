local config_dir = (os.getenv("HOME") or "") .. "/.config/hypr"
package.path = table.concat({
    config_dir .. "/?.lua",
    config_dir .. "/?/init.lua",
    package.path,
}, ";")

-- Clear cached modules so they re-execute on reload (ensures binds/rules re-register)
for _, mod in ipairs({ "vars", "environment", "monitors", "inputs", "animations", "decorations", "layouts", "workspaces" }) do
    package.loaded[mod] = nil
end

require("vars")
require("environment")
require("startup")
require("monitors") -- Auto Generated from nwg-displays
require("inputs")
require("layouts")
require("./keybinds/*")
require("./rules/*")
require("animations")
require("decorations")
require("workspaces")

-- Functional Behavior
hl.config({
    general = {
        resize_on_border = true,
        allow_tearing = false,
        snap = {
            enabled = true,
        },
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        anr_missed_pings = 5,
        allow_session_lock_restore = true,
        focus_on_activate = true,
        vrr = 3,
    },
    render = {
        direct_scanout = 2,
        -- Use the option below if you find games constantly black screening for a couple seconds whenever direct scanout enables/disables
        -- non_shader_cm = 0,
    },
    xwayland = {
        force_zero_scaling = true,
    },
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
