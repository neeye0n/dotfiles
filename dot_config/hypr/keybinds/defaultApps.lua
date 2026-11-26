local vars            = require("vars")
local terminal        = "kitty"
local backup_terminal = "alacritty"
local editor          = "code"
local browser         = vars.scripts .. "/browser-launcher.sh"
local fileManager     = "thunar"

local KEYBIND         = {
    TERMINAL = ("%s + X"):format(vars.mainMod),
    BCKUP_TERMINAL = ("%s + SHIFT + X"):format(vars.mainMod),
    EDITOR = ("%s + C"):format(vars.mainMod),
    BROWSER = ("%s + B"):format(vars.mainMod),
    FILEMAN = ("%s + E"):format(vars.mainMod)
}

hl.bind(KEYBIND.TERMINAL, hl.dsp.exec_cmd(terminal), { description = "Kitty" })
hl.bind(KEYBIND.BCKUP_TERMINAL, hl.dsp.exec_cmd(backup_terminal), { description = "Alacritty" })
hl.bind(KEYBIND.EDITOR, hl.dsp.exec_cmd(editor), { description = "Code editor" })
hl.bind(KEYBIND.BROWSER, hl.dsp.exec_cmd(browser), { description = "Browser" })
hl.bind(KEYBIND.FILEMAN, hl.dsp.exec_cmd(fileManager), { description = "File manager" })
