local KeyboardLayout = {
	cmd = "setxkbmap",
	layout = { { "us", "" , "us" }, { "ru", "" , "ru" } },
	current = 1,
}

function KeyboardLayout.switch()
  KeyboardLayout.current = KeyboardLayout.current % #(KeyboardLayout.layout) + 1
  local t = KeyboardLayout.layout[KeyboardLayout.current]
  KeyboardLayout.widget:set_text(" " .. t[3] .. " ")
  os.execute( KeyboardLayout.cmd .. " " .. t[1] .. " " .. t[2] )
end


function KeyboardLayout.Init(Core)
	local wibox = Core.Module("wibox")
	local gk = Core.Plugin("GlobalKeys")
	
	KeyboardLayout.widget = wibox.widget.textbox()
	KeyboardLayout.widget:set_text(" " .. KeyboardLayout.layout[KeyboardLayout.current][3] .. " ")
	KeyboardLayout.widget:buttons(
	 awful.util.table.join(awful.button({ }, 1, function () KeyboardLayout.switch() end))
	)

	Core.Plugin("Panels.TopPanel").Right.Add({widget = KeyboardLayout.widget})

	gk.Add({ "Control" }, "Shift_L", function() KeyboardLayout.switch() end)

	return KeyboardLayout
end

function KeyboardLayout.Setup()
end

return KeyboardLayout