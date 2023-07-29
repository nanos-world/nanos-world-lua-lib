--[[ Custom String methods --]]

function string.StartsWith(str, text)
	return str:sub(1, #str) == text
end

function string.EndsWith(str, text)
	return text == "" or str:sub(-#text) == text
end

function string.Trim(str)
	return str:gsub("^%s*(.-)%s*$", "%1")
end

function string.FormatArgs(str, ...)
	str = str or ""

	for i, arg in ipairs { ... } do
		str = str:gsub("{" .. tonumber(i) .. "}", tostring(arg))
	end

	return str
end

function string.split(str, sep) -- basic string.split handling 1 character for sep.
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end