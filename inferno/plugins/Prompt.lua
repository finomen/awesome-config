local Prompt = {}

function Prompt.Init(Core)
	local awful = Core.Module("awful")
	Core.Plugin("Panels.TopPanel").Left.Add({widget = awful.widget.prompt()})
	return Prompt
end

function Prompt.Setup(Core)
	
end

return Prompt