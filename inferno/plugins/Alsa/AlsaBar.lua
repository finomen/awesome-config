local AlsaBar = {}

function AlsaBar.Init(Core)
	local wibox = Core.Module("wibox")
	local lain = Core.Module("lain")
	local beautiful = Core.Module("beautiful")
	local volicon = wibox.widget.imagebox(beautiful.vol)
	AlsaBar.volume = lain.widgets.alsabar({width = 55, ticks = true, ticks_size = 6, timeout = 1,
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
		}
	})

	local volmargin = wibox.layout.margin(AlsaBar.volume.bar, 2, 7)
	volmargin:set_top(6)
	volmargin:set_bottom(6)

	local widget = wibox.widget.background(volmargin)
	widget:set_bgimage(beautiful.widget_bg)

	Core.Plugin("Panels.TopPanel").Right.Add({widget = widget})

	return AlsaBar
end

function AlsaBar.Setup()
	-- body
end

return AlsaBar