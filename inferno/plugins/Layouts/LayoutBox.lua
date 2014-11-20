local LayoutBox = {
	
}



function LayoutBox.Init(Core)
	local awful = Core.Module("awful")
	local layouts = Core.Plugin("Layouts").Layouts

	for s = 1, screen.count() 
	do
		local mylayoutbox = awful.widget.layoutbox(s)
	    mylayoutbox:buttons(awful.util.table.join(
			awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
			awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
			awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
			awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end))
	    )

		Core.Plugin("Panels.TopPanel").Right.Add({widget = mylayoutbox, screen = s})
	end

	

	return LayoutBox
end

function LayoutBox.Setup()
end

return LayoutBox