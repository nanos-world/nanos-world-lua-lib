-- Overrides print to call Package Log instead
print = function(...)
	local toprint = ""
	for i = 1, select("#", ...) do
		toprint = toprint .. tostring(select(i, ...)) .. "\t"
	end

	return Package.Log(toprint)
end

-- Adds 'require' to searchers
table.insert(package.searchers, function(module_name)
	local success, result = pcall(Package.Require, Package, module_name)
	if success then
		return function() return result end
	end
end)

-- Compacts the IsValid function
function IsValid( entity )
	return entity and type( entity.IsValid ) == "function" and entity:IsValid()
end
