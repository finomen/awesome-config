local TaskList = {}

function TaskList.Init(Core)
	local awful = Core.Module("awful")
	local tasklist = {}
	tasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
		  c.minimized = true
		else
		  -- Without this, the following
		  -- :isvisible() makes no sense
		  c.minimized = false
		  if not c:isvisible() then
		      awful.tag.viewonly(c:tags()[1])
		  end
		  -- This will also un-minimize
		  -- the client, if needed
		  client.focus = c
		  c:raise()
		end
	end),
	awful.button({ }, 3, function ()
		if instance then
		  instance:hide()
		  instance = nil
		else
		  instance = awful.menu.clients({
		      theme = { width = 250 }
		  })
		end
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
		if client.focus then client.focus:raise() end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then client.focus:raise() end
	end))

	for s = 1, screen.count() do
		local widget = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist.buttons)
		Core.Plugin("Panels.TopPanel").Middle.Add({widget = widget, screen = s})
	end

	return TaskList
end

function TaskList.Setup(Core)
	
end

return TaskList