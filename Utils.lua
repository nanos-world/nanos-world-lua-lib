-- Overrides print to call Package Log instead
print = function(...)
    local toprint = ""
    for i, v in ipairs({...}) do
        toprint = toprint .. tostring(v) .. "\t"
    end

    return Package:Log(toprint)
end

local function dumptable(t, indent, done)
    done = done or {}
    indent = indent or 0

    done[t] = true

    for key, value in pairs(t) do
        print(string.rep("\t", indent))

        if type(value) == "table" and not done[value] then
            done[value] = true
            print(key, ":\n")

            dumptable(value, indent + 2, done)
            done[value] = nil
        else
            print(key, "\t=\t", value, "\n")
        end
    end
end

function dump(t)
    dumptable(t)
end
