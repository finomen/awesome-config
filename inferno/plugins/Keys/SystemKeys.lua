local SystemKeys = {
	
}


function SystemKeys.Init(Core)
	local modKey = Core.Module("Keys").ModKey
	local gk = Core.Plugin("GlobalKeys")
	local awful = Core.Module("awful")
	
	gk.Add({ modKey }, "l",  function() awful.util.spawn("slimlock") end)

	return SystemKeys
end

function SystemKeys.Setup()
end

return SystemKeys