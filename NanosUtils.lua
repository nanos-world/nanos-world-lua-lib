--[[ Nanos Utils Library --]]

NanosUtils = {}


function NanosUtils.IsEntityValid(entity)
	return entity and entity:IsValid()
end

function NanosUtils.Benchmark(name, amount, func, ...)
	collectgarbage()

	-- Store current time
	local start_time = os.clock()

	-- Do the operation 'amount' times
	for _ = 1, amount do
		func(...)
	end

	-- Calculates the elapsed time in ms
	local elapsed_ms = (os.clock() - start_time) * 1000

	Console.Log("Benchmark '%s' (x%d) took %.0fms.", name, amount, elapsed_ms)
end

function NanosUtils.PrintTable(tTbl, iIndent)
    iIndent = iIndent or 0
    local sIndentString = string.rep("  ", iIndent)

    for xKey, xValue in pairs(tTbl) do
        if type(xValue) == "table" then
            print(sIndentString .. tostring(xKey) .. ":")
            PrintTable(xValue, iIndent + 1)
        else
            print(sIndentString .. tostring(xKey) .. ": " .. tostring(xValue))
        end
    end
end
