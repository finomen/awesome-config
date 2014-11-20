local AlsaKeys = {	
}

function AlsaKeys.Volume(s)
	return function()
		AlsaKeys.awful.util.spawn("amixer -q set " .. AlsaKeys.volume.channel .. " " .. AlsaKeys.volume.step .. s)
	end
end

function AlsaKeys.Mute()
	return function()
		AlsaKeys.awful.util.spawn("amixer -q set " .. AlsaKeys.volume.channel .. " playback toggle")
	end
end

function AlsaKeys.Init(Core)
	local gk = Core.Plugin("GlobalKeys")
	
	AlsaKeys.volume = Core.Plugin("Alsa.AlsaBar").volume
	AlsaKeys.awful = Core.Module("awful")

	gk.Add({}, "XF86AudioRaiseVolume",   AlsaKeys.Volume("+"))
    gk.Add({}, "XF86AudioLowerVolume", 	 AlsaKeys.Volume("-"))
    gk.Add({}, "XF86AudioMute",   		 AlsaKeys.Mute())
	

	return AlsaKeys
end

function AlsaKeys.Setup()
end

return AlsaKeys