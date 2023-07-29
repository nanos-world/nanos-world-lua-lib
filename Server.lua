-- Adds 'require' to searchers
table.insert(package.searchers, function(module_name)
    local calling_ENV = __GetCalling_ENV(4)
    if calling_ENV then
        local result = calling_ENV.Package.Require(module_name)
        return function() return result end
    end
end)