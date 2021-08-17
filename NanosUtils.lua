--[[ Nanos Utils Library --]]

NanosUtils = {}

function NanosUtils.IsA(object, class)
	return getmetatable(object) == class
end

function NanosUtils.Dump(object, indentation)
    indentation = indentation or 0
    local visited = {}

    local function dump(object)
        if type(object) == 'table' and not visited[object] then
            visited[object] = true

            local keys = {}

            for key, v in pairs(object) do
                table.insert(keys, key)
            end

            table.sort(keys)

            indentation = indentation + 1

            local output = indentation == 1 and "\n{" or "{"

            for k, key in pairs(keys) do
                output = output .. "\n" .. string.rep(" ", indentation * 4) .. key .. ' = ' .. dump(object[key]) .. ","
            end

            return output .. "\n" .. string.rep(" ", (indentation - 1) * 4) .. '}'
        else
            if type(object) == 'string' then
                return '"'.. tostring(object) ..'"'
            else
                return tostring(object)
            end
        end
    end

    return dump(object)
end
