local TagBox = {
	
}



function TagBox.Init(Core)
	local modKey = Core.Module("Keys").ModKey 
	local awful = Core.Module("awful")
	local tags = Core.Plugin("Tags").Tags

	local taglist = {}
	taglist.buttons = awful.util.table.join(
		awful.button({ }, 1, awful.tag.viewonly),
		awful.button({ modKey }, 1, awful.client.movetotag),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modKey }, 3, awful.client.toggletag),
		awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
		awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
	)

	for s = 1, screen.count() 
	do
		local widget = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist.buttons)
		
		Core.Plugin("Panels.TopPanel").Left.Add({widget = widget, screen = s})
	end

	

	return TagBox
end

function TagBox.Setup()
end

return TagBox