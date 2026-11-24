local vars     = require("vars")
local noct     = vars.noctalia
local launcher = vars.scripts .. "/app-launcher.sh"

local KEYBIND  = {
    LAUNCHER = "SUPER_L",
    LOCK = ("%s + L"):format(vars.mainMod),
    SETTINGS = ("%s + T"):format(vars.mainMod),
}

hl.bind(KEYBIND.LAUNCHER, hl.dsp.exec_cmd(launcher), { description = "Toggle launcher", release = true })
hl.bind(KEYBIND.LOCK, hl.dsp.exec_cmd(noct .. " session lock"), { description = "Lock screen" })
hl.bind(KEYBIND.SETTINGS, hl.dsp.exec_cmd(noct .. " settings-toggle"), { description = "Toggle settings" })
