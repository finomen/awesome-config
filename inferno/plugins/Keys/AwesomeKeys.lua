local AwesomeKeys = {
	
}


function AwesomeKeys.Init(Core)
	local modKey = Core.Module("Keys").ModKey
	local gk = Core.Plugin("GlobalKeys")
	local awful = Core.Module("awful")
	
	gk.Add({ modKey, "Control" }, "r",  awesome.restart)
   	gk.Add({ modKey, "Control" }, "q",  awesome.quit)

	return AwesomeKeys
end

function AwesomeKeys.Setup()
end

return AwesomeKeys