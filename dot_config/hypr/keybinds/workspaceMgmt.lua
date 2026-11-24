local vars      = require("vars")
local workspace = vars.scripts .. "/workspace.sh"

local KEYBIND   = {
    WORKSPACE_NEXT = ("%s + CTRL + right"):format(vars.mainMod),
    WORKSPACE_PREV = ("%s + CTRL + left"):format(vars.mainMod),
    WORKSPACE_EMPTY = ("%s + CTRL + down"):format(vars.mainMod),
    WORKSPACE = ("%s + TAB"):format(vars.mainMod),

    SCROLL_WORKSPACE_NEXT = ("%s + mouse_down"):format(vars.mainMod),
    SCROLL_WORKSPACE_PREV = ("%s + mouse_up"):format(vars.mainMod)
}

for i = 1, 9 do
    local focusKey = ("%s + %d"):format(vars.mainMod, i)
    hl.bind(focusKey, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })
end
hl.bind(("%s + 0"):format(vars.mainMod), hl.dsp.focus({ workspace = 10 }), { description = "Workspace 10" })

local wsLocked = false
local function cycle(direction)
    return function()
        if wsLocked then
            return
        end
        wsLocked = true
        hl.dispatch(hl.dsp.exec_cmd(workspace .. " " .. direction))
        hl.timer(function()
            wsLocked = false
        end, { timeout = 250, type = "oneshot" })
    end
end

hl.bind(KEYBIND.WORKSPACE_NEXT, cycle("next"), { description = "Next workspace" })
hl.bind(KEYBIND.WORKSPACE_PREV, cycle("prev"), { description = "Previous workspace" })
hl.bind(KEYBIND.WORKSPACE, cycle("next"), { description = "Workspace tabbing" })
hl.bind(KEYBIND.WORKSPACE_EMPTY, hl.dsp.focus({ workspace = "empty" }), { description = "Open empty workspace" })

hl.bind(KEYBIND.SCROLL_WORKSPACE_NEXT, hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll to next workspace" })
hl.bind(KEYBIND.SCROLL_WORKSPACE_PREV, hl.dsp.focus({ workspace = "e-1" }),
    { description = "Scroll to previous workspace" })
