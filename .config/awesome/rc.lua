-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
--local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- Widgets
local vicious = require("vicious")

-- Software
terminal         = "kitty"
disk_utility     = "gnome-disks"
editor           = os.getenv("EDITOR") or "vim"
editor_cmd       = terminal .. " -e " .. editor
browser          = "firefox-esr"

-- for Awesome WM scripts
awful.util.shell = "bash"
awful.shell      = "bash"

-- Functions
-- for screenshot
function scrot(cmd, callback, args)
  awful.spawn(cmd)
  callback(args)
end
    
function scrot_callback(text)
  naughty.notify({
    text = text,
    timeout = 1,
    hover_timeout = 5,
  })
end

-- Colours
color_close  = "</span>"
color_black  = "<span color='#000000'>"
color_white  = "<span color='#ffffff'>"
color_yellow = "<span color='#c2a800'>"
color_orange = "<span color='#b85900'>"
color_red    = "<span color='#ff0000'>"
color_green  = "<span color='#1a6600'>"

color_normal  = color_white
color_warning = color_yellow
color_error   = color_red

-- Icons
icon_memory      = " "
icon_temp        = "" 
icon_disk        = " "
icon_sound       = " " 
icon_clock       = " "
icon_bat_full    = " "
icon_bat_half    = " "
icon_bat_quarter = " "
icon_bat_empty   = " "
icon_keyboard    = " "

-- Symbols
symbol_light   = "⚡"
symbol_percent = "٪"
symbol_celsius = "°C"

-- Units
gb_unit = "Gb"
mb_unit = "Mb"

-- Mem widget
memwidget = wibox.widget.textbox()
memwidget:set_font("Source Code Pro Medium 12")
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "  " .. icon_memory .. "$1" .. symbol_percent, 13)
memwidget:buttons(
	awful.util.table.join(
		awful.button({ }, 1, function () awful.spawn(terminal .. " -e htop")   end)
	)
)

-- CPU temp widget
tempwidget = wibox.widget.textbox()
tempwidget:set_font("Source Code Pro Medium 12")
vicious.register(tempwidget, vicious.widgets.thermal, function (widget, args)
	local temp = args[1]
  if  temp > 65 and temp <= 75 then
    temp = color_warning .. temp .. color_close 	
	elseif temp > 75 and temp <= 80 then
    temp = color_error .. temp .. color_close 	
	elseif temp > 80 then
		-- naughty.notify({ title = "Temperature Warning", text = "Running hot! " .. args[1] .. "°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
    temp = color_error .. temp .. color_close 	
	else
    temp = color_normal .. temp .. color_close 	
	return "  " .. icon_temp .. " " .. temp .. symbol_celsius
	end
end, 19, "thermal_zone0" )

tempwidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.spawn("psensor", true) end)
))

-- Root usage widget
fswidget = wibox.widget.textbox()
fswidget:set_font("Source Code Pro Medium 12")
vicious.register(fswidget, vicious.widgets.fs, function (widget, args)
  local root_fs       = args["{/ used_p}"]
  -- local root_fs_full  = args["{/ size_gb}"] .. gb_unit

  if root_fs > 85 and root_fs <= 95 then
    root_fs = color_warning .. root_fs .. color_close
  elseif root_fs > 95 then
    root_fs = color_error .. root_fs .. color_close
  else
    root_fs = color_normal .. root_fs .. color_close

  -- return "  " .. icon_disk .. root_fs .. symbol_percent .. "/" .. root_fs_full
  return "  " .. icon_disk .. root_fs .. symbol_percent
  end
end, 620)

fswidget:buttons(
	awful.util.table.join(
		awful.button({ }, 1, function () awful.spawn( disk_utility, { floating = true } )   end)
	)
)

-- Volume widget
volwidget = wibox.widget.textbox()
volwidget:set_font("Source Code Pro Medium 12")
vicious.register(volwidget, vicious.widgets.volume, function (widget, args)
	local volume = args[1]
	local mute   = args[2]

	if mute == "🔈" then
		volume = color_error .. volume .. color_close
	end

	return "  " .. icon_sound .. volume .. symbol_percent
	end, 0.2, "Master")

volwidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () 
	awful.util.spawn("amixer -q set Master toggle", false) 
    end),
    
    -- ALSA
    --awful.button({ }, 3, function () awful.spawn(terminal .. " -e alsamixer", true) end),
    --awful.button({ }, 4, function () awful.spawn("amixer -q set Master 1dB+", false) end),
    --awful.button({ }, 5, function () awful.spawn("amixer -q set Master 1dB-", false) end)

    -- PulseAudio
    awful.button({ }, 3, function () awful.spawn("pavucontrol", true) end),
    awful.button({ }, 4, function () awful.spawn("amixer -D pulse sset Master 5%+ > /dev/null", false) end),
    awful.button({ }, 5, function () awful.spawn("amixer -D pulse sset Master 5%- > /dev/null", false) end)
))

-- Battery widget
batterywidget = wibox.widget.textbox()
batterywidget:set_font("Source Code Pro Medium 12")
vicious.register(batterywidget, vicious.widgets.bat, function (widget, args)
	local status = args[1] 
	local percent = args[2]
	local bat_icon = icon_bat_empty

	-- Charging or not
	if status == "-" then
		status = ""
	else
		status = symbol_light
	end

	-- Charge percentage
	if percent > 10 and percent <= 45 then
		bat_icon = icon_bat_quarter
	elseif percent > 45 and percent <= 85 then
		bat_icon = icon_bat_half
	elseif percent > 85 then
		bat_icon = icon_bat_full
	end

	return "  " .. bat_icon .. status .. percent .. symbol_percent

	end, 1.5, "BAT0")

-- batterywidget:buttons(awful.util.table.join(
--     awful.button({ }, 1, function () awful.spawn("sudo powertop", false) 
--     end)
-- ))

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua",
    -- os.getenv("HOME"), config.context.theme)
    os.getenv("HOME"), "default")
beautiful.init(theme_path)

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
}
-- }}}

-- Keyboard map indicator and switcher.python_history
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock(" " .. icon_clock .. "%m/%d %H:%M", 1)
mytextclock:set_font("Source Code Pro Medium 12")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                   awful.button({ }, 3, awful.tag.viewtoggle),
                   awful.button({ modkey }, 3, function(t)
                                             if client.focus then
                                                 client.focus:toggle_tag(t)
                                             end
                                         end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
	style   = {
		font    = "Source Code Pro Bold 10",
	}
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
      spacing = 10,
	    memwidget,
	    tempwidget,
	    fswidget,
	    volwidget,
	    batterywidget, 
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      mytextclock,
	    wibox.container.margin(wibox.widget.systray(), 6, 6, 6, 6),
      wibox.container.margin(s.mylayoutbox, 4, 4, 4, 4),
      },
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Brightness
    -- awful.key({ }, "XF86MonBrightnessDown", function ()
    --     awful.util.spawn("xbacklight -dec 15") end),
    -- awful.key({ }, "XF86MonBrightnessUp", function ()
    --     awful.util.spawn("xbacklight -inc 15") end),

    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Make screenshots
    -- screenshot = os.getenv("HOME") .. "/Images/Screenshots/$(date +%F_%T).png"
    awful.key({ modkey, "Ctrl" }, "p", function () 
	    scrot("scrot -z -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot") end,
              {description = "interactively choose a window or rectangle with the mouse", group = "screenshot"}),

    awful.key({ "Ctrl", "Shift" }, "p", function () 
	    scrot("scrot -z -f -s -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of selection") end,
              {description = "interactively choose a window or rectangle with the mouse", group = "screenshot"}),

    -- Lock screen
    awful.key({ modkey, "Ctrl" }, "l", function () 
	    --awful.spawn_with_shell("~/.config/awesome/locker") end,
      awful.spawn("sync")
      awful.spawn("dm-tool lock")
    end,
    	{description = "Lock screen", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program

    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control", "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "t", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "t", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
    -- Rofi
    awful.key({ modkey, "Shift" }, "r", function () awful.spawn("rofi -show drun") end)
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ }, 2, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },
    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}

-- Gaps
beautiful.useless_gap = 3
beautiful.gap_single_client = true

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Autorun
awful.spawn(os.getenv("HOME") .. "/.config/awesome/autorun.sh")
-- Screen layout
-- awful.spawn(os.getenv("HOME") .. "/.screenlayout/home.sh")
-- Language layputs
awful.spawn("setxkbmap -option grp:'alt_shift_toggle' -layout 'us,ru'") 
-- Network applet
awful.spawn("nm-applet")
-- Bluetooth applet
awful.spawn("blueman-applet")
-- Clipboard manager
awful.spawn("parcellite")
-- Gnome keyring daemon
awful.spawn("/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh")
-- Compositor
awful.spawn("compton -b -c --backend xrender --vsync none")
-- }}}
