-- Overrides print to call Package Log instead
print = function(...)
    local toprint = ""
    for i, v in ipairs({...}) do
        toprint = toprint .. tostring(v) .. "\t"
    end

    return Package:Log(toprint)
end
