local Alsa = {}

-- think about core
local wibox = require("wibox")

local volicon = wibox.widget.imagebox(beautiful.vol)
local volume = lain.widgets.alsabar({width = 55, ticks = true, ticks_size = 6, timeout = 1,

settings = function()
    if volume_now.status == "off" then
        volicon:set_image(beautiful.vol_mute)
    elseif volume_now.level == 0 then
        volicon:set_image(beautiful.vol_no)
    elseif volume_now.level <= 50 then
        volicon:set_image(beautiful.vol_low)
    else
        volicon:set_image(beautiful.vol)
    end
end,
colors =
{
    background = beautiful.bg_normal,
    mute = red,
    unmute = beautiful.fg_normal
}})

local volmargin = wibox.layout.margin(volume.bar, 2, 7)
volmargin:set_top(6)
volmargin:set_bottom(6)

Alsa.Widget = wibox.widget.background(volmargin)
Alsa.Widget:set_bgimage(beautiful.widget_bg)


function Alsa.Volume(s)
    return function()
        awful.util.spawn("amixer -q set " .. volume.channel .. " " .. volume.step .. s)
    end
end

function Alsa.Mute()
    return function()
        awful.util.spawn("amixer -q set " .. volume.channel .. " playback toggle")
    end
end

function Alsa.VolumeMax()
    return function()
        awful.util.spawn("amixer -q set " .. volume.channel .. " playback 100%")
    end
end

Alsa.Keys = awful.util.table.join(
    awful.key({ "Mod1" }, "Up",   Alsa.Volume("+")),
    awful.key({ "Mod1" }, "Down", Alsa.Volume("-")),
    awful.key({ "Mod1" }, "m",    Alsa.Mute()),
    awful.key({ "Mod1", "Control"}, "m", Alsa.VolumeMax())
)

return Alsa
