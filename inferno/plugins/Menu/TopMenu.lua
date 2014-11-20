local TopMenu = {
	
}


function TopMenu.Init(Core)
	TopMenu.Menu = Core.Module("menubar")

	TopMenu.Menu.utils.terminal = "terminology" -- TODO: move out
	TopMenu.Menu.cache_entries = true

	return TopMenu
end

function TopMenu.Setup()
end

return TopMenu