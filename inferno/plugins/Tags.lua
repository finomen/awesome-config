local Tags = {
	Tags = {}
}

function Tags.Init(Core)
	local awful = Core.Module("awful")
	local layouts = Core.Plugin("Layouts").Layouts

	for s = 1, screen.count() do
    	-- Each screen has its own tag table.
    	Tags.Tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
	end

	return Tags
end

function Tags.Setup()
end

return Tags