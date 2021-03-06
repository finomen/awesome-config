local TitleBar = {}

function TitleBar.Init(Core)
	local awful = Core.Module("awful")
	local modKey = Core.Module("Keys").ModKey
	local gk = Core.Plugin("GlobalKeys")
	gk.Add({ modKey }, "t", function ()
		if client.focus then
        	if (client.focus:titlebar_top():geometry()['height'] > 0) then
		        awful.titlebar(client.focus, {size = 0})
		    else
		    	local c = client.focus
		        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )
 
		        -- Widgets that are aligned to the left
		        local left_layout = wibox.layout.fixed.horizontal()
		        left_layout:add(awful.titlebar.widget.iconwidget(c))
		        left_layout:buttons(buttons)
		 
		        -- Widgets that are aligned to the right
		        local right_layout = wibox.layout.fixed.horizontal()
		        right_layout:add(awful.titlebar.widget.floatingbutton(c))
		        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
		        right_layout:add(awful.titlebar.widget.stickybutton(c))
		        right_layout:add(awful.titlebar.widget.ontopbutton(c))
		        right_layout:add(awful.titlebar.widget.closebutton(c))
		 
		        -- The title goes in the middle
		        local middle_layout = wibox.layout.flex.horizontal()
		        local title = awful.titlebar.widget.titlewidget(c)
		        title:set_align("center")
		        middle_layout:add(title)
		        middle_layout:buttons(buttons)
		 
		        -- Now bring it all together
		        local layout = wibox.layout.align.horizontal()
		        layout:set_left(left_layout)
		        layout:set_right(right_layout)
		        layout:set_middle(middle_layout)
		 
		        awful.titlebar(c):set_widget(layout)
		    end
    	end
	end)
	
	return TitleBar
end

function TitleBar.Setup(Core)
	
end

return TitleBar