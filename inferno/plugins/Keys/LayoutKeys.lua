local LayoutKeys = {
	
}

function LayoutKeys.Init(Core)
	local modKey = Core.Module("Keys").ModKey
	local gk = Core.Plugin("GlobalKeys")
	local awful = Core.Module("awful")
	LayoutKeys.awful = awful

    -- Layout manipulation
	gk.Add({ modKey, "Shift" },   "k",   function () awful.client.swap.byidx(  1)    end)
    gk.Add({ modKey, "Shift" },   "j",   function () awful.client.swap.byidx( -1)    end)
    gk.Add({ modKey, "Control" }, "k",   function () awful.screen.focus_relative( 1) end)
    gk.Add({ modKey, "Control" }, "j",   function () awful.screen.focus_relative(-1) end)
    gk.Add({ modKey },            "u",   awful.client.urgent.jumpto)

	return LayoutKeys
end

function LayoutKeys.Setup()
end

return LayoutKeys