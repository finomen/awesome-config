local Core = {
	modules = {},
	plugins = {}
}

function Core.Module (moduleName)
	if (Core.modules[moduleName] == nil) 
	then
		Core.modules[moduleName] = require(moduleName)
	end

	return Core.modules[moduleName]
end

function Core.Plugin(pluginName)
	if (Core.plugins[pluginName] == nil) 
	then
		Core.plugins[pluginName] = Core.Module(pluginName).Init(Core)
	end
	return Core.plugins[pluginName]
end

function Core.Setup()
	for pluginName, plugin in pairs(Core.plugins) do
		plugin.Setup()
	end
end


return Core