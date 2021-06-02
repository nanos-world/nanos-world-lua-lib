-- Overrides print to call Package Log instead
print = function(...)
	return Package:Log(...)
end