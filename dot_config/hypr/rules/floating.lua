-- File Picker
hl.window_rule({
    match = { class = "^(.*desktop-portal.*)$" },
    float = true,
    border_size = 2,
    no_blur = true,
    center = 1,
    opacity = "1 override 1 override 1 override",
    size = { "max(monitor_w, monitor_h)*0.50", "min(monitor_w, monitor_h)*0.55" },
    move = {
        "max(20, min(cursor_x - (window_w*0.50), monitor_w - window_w + 20))", -- X axis clamping
        "max(20, min(cursor_y - 50, monitor_h - window_h + 20))"               -- Y axis clamping
    },
})

hl.window_rule({
    match = { class = "^(.*[Tt]hunar.*)$", title = "^(.*[Rr]ename.*)$" },
    float = true,
    border_size = 2,
    no_blur = true,
    center = 1,
    opacity = "1 override 1 override 1 override",
    size = { "max(monitor_w, monitor_h)*0.20", "min(monitor_w, monitor_h)*0.05" },
    move = {
        "max(20, min(cursor_x - (window_w*0.50), monitor_w - window_w + 20))", -- X axis clamping
        "max(20, min(cursor_y - 50, monitor_h - window_h + 20))"               -- Y axis clamping
    },
})

-- Hyprland Screen Share Picker
hl.window_rule({
    match = { class = "^(.*hyprland-share-picker.*)$" },
    float = true,
    center = 1
})
