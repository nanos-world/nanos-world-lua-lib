-- Adds 'require' as alias to 'Package.Require()'
require = function(module_name, ...)
    local calling_ENV = __GetCalling_ENV(3)
    if calling_ENV then
        return calling_ENV.Package.Require(module_name)
    else
        error("Cannot get calling _ENV for require")
    end
end