local vars    = require("vars")
local KEYBIND = {
    CLOSE = "ALT + F4",
    FLOAT = ("%s + W"):format(vars.mainMod),
    FULLSCREEN = ("%s + F"):format(vars.mainMod),
    CYCLE_WINDOWS = "ALT + tab",

    RESIZE_RIGHT = ("%s + SHIFT + right"):format(vars.mainMod),
    RESIZE_LEFT = ("%s + SHIFT + left"):format(vars.mainMod),
    RESIZE_UP = ("%s + SHIFT + up"):format(vars.mainMod),
    RESIZE_DOWN = ("%s + SHIFT + down"):format(vars.mainMod),

    MOVE_SWAP_LEFT = ("%s + SHIFT + CTRL + left"):format(vars.mainMod),
    MOVE_SWAP_RIGHT = ("%s + SHIFT + CTRL + right"):format(vars.mainMod),
    MOVE_SWAP_UP = ("%s + SHIFT + CTRL + up"):format(vars.mainMod),
    MOVE_SWAP_DOWN = ("%s + SHIFT + CTRL + down"):format(vars.mainMod),

    MOVE_TO_NEXT_WORKSPACE = ("%s + CTRL + ALT + right"):format(vars.mainMod),
    MOVE_TO_PREV_WORKSPACE = ("%s + CTRL + ALT + left"):format(vars.mainMod),

    MOUSE_DRAG = ("%s + mouse:272"):format(vars.mainMod),
    -- TODO: Verify how this fires
    -- MOUSE_RESIZE = ("%s + mouse:273"):format(vars.mainMod),
}

hl.bind(KEYBIND.CLOSE, hl.dsp.window.close(), { description = "Close window" })
hl.bind(KEYBIND.FLOAT, hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(KEYBIND.FULLSCREEN, hl.dsp.window.fullscreen({ mode = "maximized", action = toggle }),
    { description = "Toggle fullscreen" })
hl.bind(KEYBIND.CYCLE_WINDOWS, hl.dsp.window.cycle_next(), { description = "Cycle windows" })

hl.bind(KEYBIND.RESIZE_RIGHT, hl.dsp.window.resize({
    x = 30,
    y = 0,
    relative = true
}), { description = "Resize window right" })

hl.bind(KEYBIND.RESIZE_LEFT, hl.dsp.window.resize({
    x = -30,
    y = 0,
    relative = true
}), { description = "Resize window left" })

hl.bind(KEYBIND.RESIZE_UP, hl.dsp.window.resize({
    x = 0,
    y = -30,
    relative = true
}), { description = "Resize window up" })

hl.bind(KEYBIND.RESIZE_DOWN, hl.dsp.window.resize({
    x = 0,
    y = 30,
    relative = true
}), { description = "Resize window down" })

hl.bind(
    KEYBIND.MOVE_SWAP_LEFT,
    hl.dsp.window.move({ direction = "left" }),
    { description = "Move or swap window left" }
)

hl.bind(
    KEYBIND.MOVE_SWAP_RIGHT,
    hl.dsp.window.move({ direction = "right" }),
    { description = "Move or swap window right" }
)

hl.bind(
    KEYBIND.MOVE_SWAP_UP,
    hl.dsp.window.move({ direction = "up" }),
    { description = "Move or swap window up" }
)

hl.bind(
    KEYBIND.MOVE_SWAP_DOWN,
    hl.dsp.window.move({ direction = "down" }),
    { description = "Move or swap window down" }
)

-- Move window to n workspace
for i = 1, 9 do
    local moveKey = ("%s + SHIFT + %d"):format(vars.mainMod, i)
    hl.bind(moveKey, hl.dsp.window.move({ workspace = i }), { description = "Move to workspace " .. i })
end
hl.bind(("%s + SHIFT + 0"):format(vars.mainMod), hl.dsp.window.move({ workspace = 10 }),
    { description = "Move to workspace 10" })

hl.bind(KEYBIND.MOVE_TO_NEXT_WORKSPACE, hl.dsp.window.move({ workspace = "r+1" }),
    { description = "Move to next workspace" })
hl.bind(KEYBIND.MOVE_TO_PREV_WORKSPACE, hl.dsp.window.move({ workspace = "r-1" }),
    { description = "Move to previous workspace" })


-- Drag and Resize Window
hl.bind(KEYBIND.MOUSE_DRAG, hl.dsp.window.drag(), { mouse = true, description = "Drag window" })
-- TODO: Verify how this fires
-- hl.bind(KEYBIND.MOUSE_RESIZE, hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
