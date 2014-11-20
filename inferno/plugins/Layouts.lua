local Layouts = {
	
}

function Layouts.Init(Core)
    local awful = Core.Module("awful")
	Layouts.Layouts =
	{
	    awful.layout.suit.floating,
	    awful.layout.suit.tile,
	    awful.layout.suit.tile.left,
	    awful.layout.suit.tile.bottom,
	    awful.layout.suit.tile.top,
	    awful.layout.suit.fair,
	    awful.layout.suit.fair.horizontal,
	    awful.layout.suit.spiral,
	    awful.layout.suit.spiral.dwindle,
	    awful.layout.suit.max,
	    awful.layout.suit.max.fullscreen,
	    awful.layout.suit.magnifier
	}
	return Layouts
end

function Layouts.Setup()
end

return Layouts
