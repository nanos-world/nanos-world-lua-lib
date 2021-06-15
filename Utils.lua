-- Overrides print to call Package Log instead
print = function(...)
	local toprint = ""
	for i, v in ipairs({...}) do
		toprint = toprint .. tostring(v) .. "\t"
	end

	return Package:Log(toprint)
end

-- Adds 'require' to searchers
table.insert(package.searchers, function(module_name)
	local success, result = pcall(Package.Require, Package, module_name)
	if success then
		return function() return result end
	end
end)
