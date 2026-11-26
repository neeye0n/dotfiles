local vars              = require("vars")
local ssFilenamePattern = "screenshot-%Y%m%d-%H%M%S"
local screenshotDir     = vars.home .. "/Pictures/Screenshots"
local annotator         = vars.scripts .. "/satty.sh " .. screenshotDir
local noct              = vars.noctalia
local screenRecorder    = noct .. "plugin noctalia/screen_recorder:service all toggle "

local KEYBIND           = {
    FULLSCREEN_SS_2CLIPBOARD = "PRINT",
    FULLSCREEN_SS            = ("%s + PRINT"):format(vars.mainMod),
    FULLSCREEN_RECORD        = ("%s + CTRL + PRINT"):format(vars.mainMod),
    WINDOW_SS_2CLIPBOARD     = "SHIFT + PRINT",
    WINDOW_SS                = ("%s + SHIFT + PRINT"):format(vars.mainMod),
    WINDOW_RECORD            = ("%s + CTRL + SHIFT + PRINT"):format(vars.mainMod),
    ANNOTATE                 = ("%s + A"):format(vars.mainMod),
    REGIONAL_RECORD          = ("%s + CTRL + A"):format(vars.mainMod)
}

hl.bind(KEYBIND.FULLSCREEN_SS_2CLIPBOARD,
    hl.dsp.exec_cmd(noct ..
        "screenshot-fullscreen --no-save-to-file --copy-to-clipboard"),
    {
        description = "Screenshot monitor to clipboard",
        release = true
    })

hl.bind(KEYBIND.FULLSCREEN_SS,
    hl.dsp.exec_cmd(noct ..
        "screenshot-fullscreen --filename-pattern " .. ssFilenamePattern .. " --directory " .. screenshotDir),
    {
        description = "Screenshot monitor",
        release = true
    })

hl.bind(KEYBIND.FULLSCREEN_RECORD,
    hl.dsp.exec_cmd(screenRecorder .. "focused"),
    {
        description = "Screenrecord focused workspace",
        release = true
    })

hl.bind(KEYBIND.WINDOW_SS_2CLIPBOARD,
    hl.dsp.exec_cmd(noct .. "screenshot-window --no-save-to-file --copy-to-clipboard"),
    {
        description = "Screenshot window to clipboard",
        release = true
    })

hl.bind(KEYBIND.WINDOW_SS,
    hl.dsp.exec_cmd(noct ..
        "screenshot-window --filename-pattern " ..
        ssFilenamePattern .. " --copy-to-clipboard --directory " .. screenshotDir),
    {
        description = "Screenshot window",
        release = true
    })

hl.bind(KEYBIND.WINDOW_RECORD,
    hl.dsp.exec_cmd(screenRecorder .. "portal"),
    {
        description = "Window-record",
        release = true
    })

hl.bind(KEYBIND.ANNOTATE,
    hl.dsp.exec_cmd(annotator),
    {
        description = "Regional Screenshot Annotate",
        release = true
    })

hl.bind(KEYBIND.REGIONAL_RECORD,
    hl.dsp.exec_cmd(screenRecorder .. "region"),
    {
        description = "Regional Screenrecord",
        release = true
    })
