local HotKeys = {
	
}



function HotKeys.Init(Core)
	local modKey = Core.Module("Keys").ModKey
	local awful = Core.Module("awful")
	
	local startMenu = Core.Plugin("Menu.StartMenu")
	local topMenu = Core.Plugin("Menu.TopMenu")
	local gk = Core.Plugin("GlobalKeys")
	local launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = startMenu.Menu })
	

	gk.Add({ modKey }, "w", function() startMenu.Menu:toggle() end)
    gk.Add({ modkey }, "p", function () topMenu.Menu.show() end)
	

	return HotKeys
end

function HotKeys.Setup()
end

return HotKeys