local TextClock = {
	
}



function TextClock.Init(Core)
	local awful = Core.Module("awful")
	local lain = Core.Module("lain")
	
	local widget = awful.widget.textclock("<span font='Tamsyn 5'> </span>%H:%M ")

	lain.widgets.calendar:attach(widget)
	

	Core.Plugin("Panels.TopPanel").Right.Add({widget = widget})

	

	return TextClock
end

function TextClock.Setup()
end

return TextClock