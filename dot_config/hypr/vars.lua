local homeDir = (os.getenv("HOME") or "")

local vars = {
    -- paths
    home                  = homeDir,
    working_dir           = homeDir .. "/.config/hypr",
    scripts               = homeDir .. "/.config/hypr/scripts",

    -- modifiers
    mainMod               = "SUPER",

    -- workspaces
    presistent_workspaces = 5,

    -- noctalia IPC
    noctalia              = "noctalia msg ",

    -- monitors
    monitor1              = "DP-1",
    monitor2              = "",
    monitor3              = "",

    -- cursor
    pointer_name          = "Moga-Dark",
    pointer_size          = "32"
}

return vars
