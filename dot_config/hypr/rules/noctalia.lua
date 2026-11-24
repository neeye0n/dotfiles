hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

hl.window_rule({
    match = {
        class = "^(dev\\.)?(noctalia\\.Noctalia(\\.Settings)?)$"
    },
    float = true,
    size = { "monitor_w*0.70", "monitor_h*0.70" }
})
