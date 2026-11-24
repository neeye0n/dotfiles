-- Fix some dragging issues with XWayland
hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Opaque Maximized Windows
hl.window_rule({
    match = { fullscreen_state_internal = 1 },
    opacity = "1 override 1 override 1 override"
})

-- Idle inhibit rules
hl.window_rule({ match = { class = "^(.*celluloid.*|.*mpv.*|.*vlc.*)$" }, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { class = "^(.*[Ss]potify.*)$" }, idle_inhibit = "fullscreen" })
hl.window_rule({
    match = { class = "^(.*LibreWolf.*|.*floorp.*|.*brave-browser.*|.*brave-origin.*|.*firefox.*|.*chromium.*|.*zen.*|.*vivaldi.*|.*[hH]elium.*)$" },
    idle_inhibit =
    "fullscreen",
    maximize = true
})
