local vars = require("vars")

local env = {
    "HYPRCURSOR_THEME," .. vars.pointer_name,
    "HYPRCURSOR_SIZE," .. vars.pointer_size,
    "XCURSOR_THEME," .. vars.pointer_name,
    "XCURSOR_SIZE," .. vars.pointer_size,
    "QT_CURSOR_THEME," .. vars.pointer_name,
    "QT_CURSOR_SIZE," .. vars.pointer_size,
}

for _, item in ipairs(env) do
    local key, value = item:match("^([^,]+),(.+)$")
    if key and value then
        hl.env(key, value)
    end
end

hl.config({
    general = {
        gaps_in = 7,
        gaps_out = 14,
        border_size = 2,
    },
    decoration = {
        dim_special = 0.3,
        rounding = 12,
        rounding_power = 3,
        active_opacity = 0.94,
        inactive_opacity = 0.84,
        fullscreen_opacity = 1,
        shadow = {
            enabled = true,
            range = 32,
            render_power = 2,
            color = "rgba(00000055)",
            color_inactive = "rgba(00000033)",
            offset = { 0, 4 },
            scale = 1.0,
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 4,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
            special = true,
            noise = 0.05,
            brightness = 1,
            contrast = 0.8916,
            vibrancy = 0.35,
            vibrancy_darkness = 1.0,
        },
    },
})
