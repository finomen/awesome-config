local GlobalKeys = {
	keyTable = {}
}

function GlobalKeys.Add(modifiers, key, action)
	local awful = GlobalKeys.Core.Module("awful")
	GlobalKeys.keyTable = awful.util.table.join(GlobalKeys.keyTable,
		awful.key(modifiers, key, action)
	)
end

function GlobalKeys.Init(core)
	GlobalKeys.Core = core
	return GlobalKeys
end

function GlobalKeys.Setup()	
	root.keys(GlobalKeys.keyTable)
end

return GlobalKeys
