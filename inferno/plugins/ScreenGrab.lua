local ScreenGrab = {	
}


function ScreenGrab.Init(Core)
	local gk = Core.Plugin("GlobalKeys")
	local awful = Core.Module("awful")
	
	gk.Add({}, "Print",  function () awful.util.spawn("screengrab") end)

	return ScreenGrab
end

function ScreenGrab.Setup()
end

return ScreenGrab