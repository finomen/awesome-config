local Launcher = {
	
}



function Launcher.Init(Core)
	local awful = Core.Module("awful")
	local beautiful = Core.Module("beautiful")
	local startMenu = Core.Plugin("Menu.StartMenu")
	local launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = startMenu.Menu })
	

	Core.Plugin("Panels.TopPanel").Left.Add({widget = launcher})

	

	return Launcher
end

function Launcher.Setup()
end

return Launcher