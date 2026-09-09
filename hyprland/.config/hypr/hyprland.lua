-- ############################################################################
-- Hyprland Lua config (migrated from hyprland.conf)
-- Docs: https://wiki.hypr.land/Configuring/Start/
-- ############################################################################

---@module 'hl'

------------------
---- MONITORS ----
------------------
hl.monitor({ output = "",      mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })

---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "alacritty"
local fileManager = "nautilus"
local menu        = "walker"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("elephant")
    hl.exec_cmd("teams-for-linux")
    hl.exec_cmd("zen-browser")
    hl.exec_cmd("thunderbird")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("waybar & swaync & flameshot & hypridle & blueman-applet")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 1,
        border_size = 1,
        col = {
            active_border   = "rgba(85c1dcaa)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
    },

    decoration = {
        rounding = 0,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    -- You had animations turned off, so we keep them off.
    animations = {
        enabled = false,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Example per-device config
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------
---- GROUP ----
---------------
hl.config({
    group = {
        col = {
            border_active          = "rgba(85c1dcaa)",
            border_inactive        = "rgba(595959aa)",
            border_locked_active   = "rgba(ff5500ee)",
            border_locked_inactive = "rgba(994400aa)",
        },
        groupbar = {
            enabled = true,
            font_size = 7,
            render_titles = false,
            col = {
                active         = "rgba(85c1dcaa)",
                inactive       = "rgba(595959aa)",
                locked_active  = "rgba(85c1dcaa)",
                locked_inactive = "rgba(994400aa)",
            },
        },
    },
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd("zen-browser"))

-- Groups / tab-groups
hl.bind(mainMod .. " + left", hl.dsp.group.prev())      -- was: changegroupactive, b
hl.bind(mainMod .. " + right", hl.dsp.group.next())     -- was: changegroupactive, f
hl.bind(mainMod .. " + W", hl.dsp.group.toggle())       -- was: exec hyprctl dispatch togglegroup

-- Move focus (your custom h/j/k/l mapping)
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces / move window to workspace, keys 1-9 and 0 -> ws 10
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special (scratchpad) workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Color picker
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- Screenshot / lock
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.exec_cmd("hyprlock"))

-- OSD (only on the focused monitor)
local osdclient = "swayosd-client --monitor $(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume lower"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(osdclient .. " --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(osdclient .. " --input-volume mute-toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(osdclient .. " --brightness raise"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(osdclient .. " --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(osdclient .. " --playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- Assign apps to workspaces
hl.window_rule({ match = { class = "^org.mozilla.Thunderbird$" },        workspace = "10" })
hl.window_rule({ match = { class = "^teams-for-linux$" }, workspace = "9" })
hl.window_rule({ match = { class = "^zen-browser$" },     workspace = "2" })

-- Picture-in-Picture (two title spellings, matched together with a regex)
hl.window_rule({ match = { title = "[Pp]icture[- ][Ii]n[- ][Pp]icture" }, float = true })
hl.window_rule({ match = { title = "[Pp]icture[- ][Ii]n[- ][Pp]icture" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { title = "[Pp]icture[- ][Ii]n[- ][Pp]icture" }, size = "600 337.5" })
hl.window_rule({ match = { title = "[Pp]icture[- ][Ii]n[- ][Pp]icture" }, pin = true })

-- mpv
hl.window_rule({ match = { class = "mpv" }, float = true })
hl.window_rule({ match = { class = "mpv" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "mpv" }, size = "600 337.5" })
hl.window_rule({ match = { class = "mpv" }, pin = true })

-- Wi-Fi picker. The waybar network module launches impala under this class,
-- so float and center it to get a popup instead of a window in the tiling
-- layout. Sizes match what omarchy uses for the same terminal TUIs.
hl.window_rule({ match = { class = "Impala" }, float = true })
hl.window_rule({ match = { class = "Impala" }, center = true })
hl.window_rule({ match = { class = "Impala" }, size = "800 600" })
