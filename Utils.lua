-- Overrides print to call Package Log instead
print = function(...)
	return Package:Log(...)
end

table.insert(package.searchers, function(module_name)
	local success, result = pcall(Package.Require, Package, module_name)
	if success then
		return function() return result end
	end
end)
