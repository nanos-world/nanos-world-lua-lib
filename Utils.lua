-- Overrides print to call Package Log instead
print = function(...)
	return Package:Log(...)
end

table.insert(package.searchers, function(moduleName)
    local success, result = pcall(Package.Require, Package, moduleName)
    if success then return function() return result end end
end)
