local SysTray = {}

function SysTray.Init(Core)
	local wibox = Core.Module("wibox")
	Core.Plugin("Panels.TopPanel").Right.Add({widget = wibox.widget.systray(), screen = 1})
	return SysTray
end

function SysTray.Setup(Core)
	
end

return SysTray