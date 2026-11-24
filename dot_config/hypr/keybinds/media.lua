local vars     = require("vars")
local noct     = vars.noctalia

local KEYBINDS = {
    PLAY  = "XF86AudioPlay",
    NEXT  = "XF86AudioNext",
    PREV  = "XF86AudioPrev",
    VOLUP = "XF86AudioRaiseVolume",
    VOLDN = "XF86AudioLowerVolume"
}

hl.bind(KEYBINDS.PLAY, hl.dsp.exec_cmd(noct .. "media toggle"), { locked = true, description = "Play or pause" })
hl.bind(KEYBINDS.NEXT, hl.dsp.exec_cmd(noct .. "media next"), { locked = true, description = "Next track" })
hl.bind(KEYBINDS.PREV, hl.dsp.exec_cmd(noct .. "media previous"),
    { locked = true, description = "Previous track" })
hl.bind(KEYBINDS.VOLUP, hl.dsp.exec_cmd("noctalia msg volume-up 5%"),
    { locked = true, description = "Volume up" })
hl.bind(KEYBINDS.VOLDN, hl.dsp.exec_cmd("noctalia msg volume-down 5%"),
    { locked = true, description = "Volume down" })

-- Misc Controls
--hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, description = "Volume Up" })
--hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, description = "Volume Down" })
--hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),                      { locked = true, description = "Play" })
--hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, description = "Volume Mute" })
