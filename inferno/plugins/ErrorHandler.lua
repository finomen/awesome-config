local ErrorHandler = {}

function ErrorHandler.Init(Core)
	local naughty = Core.Module("naughty")

	if awesome.startup_errors then
		naughty.notify({ preset = naughty.config.presets.critical,
			title = "Oops, there were errors during startup!",
			text = awesome.startup_errors,
			timeout = 5
		})
	end

	do
		local in_error = false
		awesome.connect_signal("debug::error", function (err)
			-- Make sure we don't go into an endless error loop
			if in_error then return end
			in_error = true

			naughty.notify({ preset = naughty.config.presets.critical,
				title = "Oops, an error happened!",
				timeout = 5,
				text = err })
			in_error = false
	    end)
	end

	return ErrorHandler
end

function ErrorHandler.Setup()
end

return ErrorHandler