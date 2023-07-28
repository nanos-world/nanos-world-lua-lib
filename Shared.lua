-- Overrides print to call Console Log instead
print = function(...)
	-- Table used to store the final output, which will be concatted in the end
	local buffer = {}

	-- Cache table.insert as local because it's faster
	local table_insert = table.insert

	for i = 1, select("#", ...) do
		table_insert(buffer, tostring(select(i, ...)))
		table_insert(buffer, "\t")
	end

	-- After all, concats the results
	return Console.Log(table.concat(buffer))
end