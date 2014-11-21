local LogWidget = {}

function LogWidget.Init(Core)
	local wibox = Core.Module("wibox")
	
	local wbox = wibox({ bg = theme.bg_normal or "#000000",
	                height = 100,
	                width = 100,
	                screen = 2
                	})
	wbox.ontop = false
	wbox.visible = true

	local scrgeom = screen[2].geometry
 	wbox:geometry({ x = scrgeom.x + 120, y = 120})

	return LogWidget
end

function LogWidget.Setup()
end

return LogWidget