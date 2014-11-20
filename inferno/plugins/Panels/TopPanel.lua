local TopPanel = {
	Right = {},
	Left = {},
	Middle = {}
}

function TopPanel.Right.Add(element)
	if (element["widget"] ~= nil)
	then
		if (element["screen"] ~= nil)
		then
			table.insert(TopPanel.Right[element["screen"]].Widgets, element["widget"])
		else
			for s = 1, screen.count() 
			do
				table.insert(TopPanel.Right[s].Widgets, element["widget"])
			end
		end
	end
end

function TopPanel.Left.Add(element)
	if (element["widget"] ~= nil)
	then
		if (element["screen"] ~= nil)
		then
			table.insert(TopPanel.Left[element["screen"]].Widgets, element["widget"])
		else
			for s = 1, screen.count() 
			do
				table.insert(TopPanel.Left[s].Widgets, element["widget"])
			end
		end
	end
end

function TopPanel.Middle.Add(element)
	if (element["widget"] ~= nil)
	then
		if (element["screen"] ~= nil)
		then
			table.insert(TopPanel.Middle[element["screen"]].Widgets, element["widget"])
		else
			for s = 1, screen.count() 
			do
				table.insert(TopPanel.Middle[s].Widgets, element["widget"])
			end
		end
	end
end

function TopPanel.Init(Core)
	TopPanel.Core = Core
	for s = 1, screen.count() 
	do
		TopPanel.Right[s] = { Widgets = {} }
		TopPanel.Left[s] = { Widgets = {} }
		TopPanel.Middle[s] = { Widgets = {} }
	end

	return TopPanel
end

function TopPanel.Setup()
	local awful = TopPanel.Core.Module("awful")
	local wibox = TopPanel.Core.Module("wibox")
	local topWibox = {}

	for s = 1, screen.count() 
	do
		topWibox[s] = awful.wibox({ position = "top", screen = s })
		
		local rightLayout = wibox.layout.fixed.horizontal()
		for i, w in pairs(TopPanel.Right[s].Widgets)
		do
			rightLayout:add(w)
		end

		local leftLayout = wibox.layout.fixed.horizontal()
		for i, w in pairs(TopPanel.Left[s].Widgets)
		do
			leftLayout:add(w)
		end

		local middleLayout = wibox.layout.fixed.horizontal()
		for i, w in pairs(TopPanel.Middle[s].Widgets)
		do
			middleLayout:add(w)
		end

		local layout = wibox.layout.align.horizontal()
	    --layout:set_middle(taskList)

		layout:set_left(leftLayout)

		layout:set_middle(middleLayout)

	    layout:set_right(rightLayout)

	    topWibox[s]:set_widget(layout)
	end
end

return TopPanel
