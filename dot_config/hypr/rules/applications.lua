-- Copied from MinimaLinux
-- https://gitlab.com/minimalinux/minimaDots.git
hl.window_rule({ match = { class = "^de\\.haeckerfelix\\.Shortwave$" }, float = true })
hl.window_rule({ match = { class = "^Signal$" }, float = true })
hl.window_rule({ match = { class = "^com\\.github\\.rafostar\\.Clapper$" }, float = true })
hl.window_rule({ match = { class = "^app\\.drey\\.Warp$" }, float = true })
hl.window_rule({ match = { class = "^net\\.davidotek\\.pupgui2$" }, float = true })
hl.window_rule({ match = { class = "^yad$" }, float = true })
hl.window_rule({ match = { class = "^eog$" }, float = true })
hl.window_rule({ match = { class = "^io\\.github\\.alainm23\\.planify$" }, float = true })
hl.window_rule({ match = { class = "^io\\.gitlab\\.theevilskeleton\\.Upscaler$" }, float = true })
hl.window_rule({ match = { class = "^com\\.github\\.unrud\\.VideoDownloader$" }, float = true })
hl.window_rule({ match = { class = "^io\\.gitlab\\.adhami3310\\.Impression$" }, float = true })
hl.window_rule({ match = { class = "^io\\.missioncenter\\.MissionCenter$" }, float = true, size = "1290 950" })
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, float = true, size = "1221 619", })
hl.window_rule({ match = { title = "^File Operation Progress$" }, float = true, size = "600 50", })
hl.window_rule({ match = { class = "^xfce-polkit$" }, float = true, size = "600 50", })
hl.window_rule({ match = { class = "^blueman-manager$" }, float = true, size = "600 300", })

hl.window_rule({ match = { class = "^.*jetbrains.*$", title = "^win[0-9]+$" }, no_initial_focus = true })
hl.window_rule({ match = { class = "^foot$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.kde\\.dolphin$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.kde\\.ark$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^nwg-look$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^qt5ct$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^qt6ct$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^extsource$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^kvantummanager$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^blueman-manager$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^nm-applet$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^nm-connection-editor$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.kde\\.polkit-kde-authentication-agent-1$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^polkit-gnome-authentication-agent-1$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.freedesktop\\.impl\\.portal\\.desktop\\.gtk$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^org\\.freedesktop\\.impl\\.portal\\.desktop\\.hyprland$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^steamwebhelper$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^[Ss]potify$" }, opacity = 1.0 })
hl.window_rule({ match = { initial_title = "^Spotify Free$" }, opacity = 1.0 })
hl.window_rule({ match = { initial_title = "^Spotify Premium$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^com\\.github\\.rafostar\\.Clapper$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^com\\.github\\.tchx84\\.Flatseal$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^hu\\.kramo\\.Cartridges$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^com\\.obsproject\\.Studio$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^gnome-boxes$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^vesktop$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^discord$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^WebCord$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^ArmCord$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^app\\.drey\\.Warp$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^net\\.davidotek\\.pupgui2$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^yad$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^Signal$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^io\\.github\\.alainm23\\.planify$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^io\\.gitlab\\.theevilskeleton\\.Upscaler$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^com\\.github\\.unrud\\.VideoDownloader$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^io\\.gitlab\\.adhami3310\\.Impression$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^io\\.missioncenter\\.MissionCenter$" }, opacity = 1.0 })
hl.window_rule({ match = { class = "^io\\.github\\.flattool\\.Warehouse$" }, opacity = 1.0 })
hl.window_rule({
    match = { title = "^Affinity Photo 2$" },
    no_anim = true,
    no_shadow = true,
    border_size = 0,
    no_blur = true,
    no_dim = true,
    immediate = true,
    decorate = false,
    opaque = true,
    tonemap =
        off,
})

-- Helium
hl.window_rule({
    match = { class = "^(.*[hH]elium.*)$" },
    -- always render even out of focus
    render_unfocused = true,
})

-- Ristretto
hl.window_rule({
    match = { class = "^org\\.xfce\\.ristretto$" },
    opacity = "1 override 1 override 1 override"
})

-- Kitty
hl.window_rule({
    match = { class = "^(.*[kK]itty.*|.*[aA]lacritty.*)$" },
    float = true,
    size = { "max(monitor_w, monitor_h)*0.34", "min(monitor_w, monitor_h)*0.40" },
    center = true
})

-- Steam
hl.window_rule({
    match = { class = "^(.*[Ss]team.*)$", initial_class = "^[Ss]team$" },
    float = true,
    opacity =
    "1 override 1 override 1 override"
})
