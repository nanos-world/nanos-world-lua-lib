--[[ Nanos Utils Library --]]

NanosUtils = {}

function NanosUtils.IsA(object, class)
	return getmetatable(object) == class
end

function NanosUtils.Dump(object, indentation)
	indentation = indentation or 0

	if (type(object) == 'table') then
		local keys = {}

		for key, v in pairs(object) do
			table.insert(keys, key)
		end

		table.sort(keys)

		indentation = indentation + 1

		local output = indentation == 1 and "\n{" or "{"

		for k, key in pairs(keys) do
			output = output .. "\n" .. string.rep(" ", indentation * 4) .. key .. ' = ' .. NanosUtils.Dump(object[key], indentation) .. ","
		end

		indentation = indentation - 1

		return output .. "\n" .. string.rep(" ", indentation * 4) .. '}'
	else
		if type(object) == 'string' then
			return '"'.. tostring(object) ..'"'
		else
			return tostring(object)
		end
	end
end