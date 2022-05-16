--[[ Nanos Utils Library --]]

NanosUtils = {}

function NanosUtils.IsA(object, class)
	return getmetatable(object) == class
end


function NanosUtils.Dump(full_object)
	-- Table used to store already visited tables (avoid recursion)
	local visited = {}

	-- Table used to store the final output, which will be concatted in the end
	local buffer = {}

	-- Cache table.insert as local because it's faster
	local table_insert = table.insert

	-- Internal recursive function
	local function DumpRecursive(object, indentation)
		local object_type = type(object)

		-- If it's a table and was not outputted yet
		if (object_type == 'table' and not visited[object]) then
			local object_metatable = getmetatable(object)

			-- If it's a nanos world struct, just stringify it
			if (object_metatable == Vector or object_metatable == Rotator or object_metatable == Vector2D or object_metatable == Color) then
				-- Anything else just stringify it
				table_insert(buffer, tostring(object))
				return
			end

			-- Marks as visited
			visited[object] = true

			-- Stores all keys in another table, sorting it
			local keys = {}

			for key, v in pairs(object) do
				table_insert(keys, key)
			end

			table.sort(keys, function(a, b)
				if type(a) == "number" and type(b) == "number" then
					return a < b
				else
					return tostring(a) < tostring(b)
				end
			end)

			-- Increases one indentation, as we will start outputting table elements
			indentation = indentation + 1

			-- Main table displays '{' in a separated line, subsequent ones will be in the same line
			table_insert(buffer, indentation == 1 and "\n{" or "{")

			-- For each member of the table, recursively outputs it
			for k, key in ipairs(keys) do
				local formatted_key = type(key) == "number" and tostring(key) or '"' .. tostring(key) .. '"'

				-- Appends the Key with indentation
				table_insert(buffer, "\n" .. string.rep(" ", indentation * 4) .. formatted_key .. " = ")

				-- Appends the Element
				DumpRecursive(object[key], indentation)

				-- Appends a last comma
				table_insert(buffer, ",")
			end

			-- After outputted the whole table, backs one indentation
			indentation = indentation - 1

			-- Adds the closing bracket
			table_insert(buffer, "\n" .. string.rep(" ", indentation * 4) .. "}")
		elseif (object_type == "string") then
			-- Outputs string with quotes
			table_insert(buffer, '"' .. tostring(object) .. '"')
		else
			-- Anything else just stringify it
			table_insert(buffer, tostring(object))
		end
	end

	-- Main call
	DumpRecursive(full_object, 0)

	-- After all, concats the results
	return table.concat(buffer)
end


function NanosUtils.Benchmark(name, amount, func, ...)
	collectgarbage()

	-- Store current time
	local start_time = os.clock()

	-- Do the operation 'amount' times
	for i = 0, amount do
		func(...)
	end

	-- Calculates the elapsed time in ms
	local elapsed_ms = (os.clock() - start_time) * 1000

	Package.Log("Benchmark '%s' (x%d) took %.0fms.", name, amount, elapsed_ms)
end


function NanosUtils.FormatString(str, ...)
	str = str or ""

	for i, arg in ipairs { ... } do
		str = string.gsub(str, "{" .. tonumber(i) .. "}", tostring(arg))
	end

	return str
end


-- converts any value to a boolean
function NanosUtils.ToBool(val)
    if not val or (val == "false") or (val == 0) or (val== "0") then
        return false
    end

    return true
end


-- add Get/Set functions to a provided table
local function valueToType(val, type)
    if not type then return val end

    if (type == "number") then return tonumber(val) end
    if (type == "string") then return tostring(val) end
    if (type == "boolean") then return NanosUtils.ToBool(val) end

    return val
end

function NanosUtils.AddAccessors(table, name, key, type, default_fallback)
    if not table or (type(table) ~= "table") or not name or not key then
        return
    end

    name, key = tostring(name)

    if table["Set" .. name] or table["Get" .. name] then
        return
    end

	key = tostring(key)

	table["Set" .. name] = function(self, val)
        self[key] = valueToType(val, type)
        return self
    end

    table["Get" .. name] = function(self)
        return (self[key] ~= nil) and self[key] or default_fallback
    end
end