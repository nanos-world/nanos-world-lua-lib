--[[ Nanos Utils Library --]]

NanosUtils = {}

function NanosUtils.IsA(object, class)
	return getmetatable(object) == class
end

function NanosUtils.Dump(full_object)
	-- Table used to store already visited tables (avoid recursion)
	local visited = {}

	-- Internal recursive function
	local function DumpRecursive(object, indentation)
		local object_type = type(object)

		-- If it's a table and was not outputted yet
		if (object_type == 'table' and not visited[object]) then
			-- Marks as visited
			visited[object] = true

			-- Table used to store the final output, which will be concatted in the end
			local output_table = {}

			-- Stores all keys in another table, sorting it
			local keys = {}

			for key, v in pairs(object) do
				table.insert(keys, key)
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
			table.insert(output_table, indentation == 1 and "\n{" or "{")

			-- For each member of the table, recursively outputs it
			for k, key in pairs(keys) do
				table.insert(output_table, "\n" .. string.rep(" ", indentation * 4) .. tostring(key) .. " = " .. DumpRecursive(object[key], indentation) .. ",")
			end

			-- After outputted the whole table, backs one indentation
			indentation = indentation - 1

			-- Adds the closing bracket
			table.insert(output_table, "\n" .. string.rep(" ", indentation * 4) .. "}")

			-- After all, concats all elements into the output
			return table.concat(output_table)
		else
			-- Outputs string with quotes
			if (object_type == "string") then
				return '"' .. tostring(object) .. '"'
			else
				return tostring(object)
			end
		end
	end

	return DumpRecursive(full_object, 0)
end