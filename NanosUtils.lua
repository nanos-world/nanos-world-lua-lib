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
	for i = 0, amount do
		func(...)
	end

	-- Calculates the elapsed time in ms
	local elapsed_ms = (os.clock() - start_time) * 1000

	Console.Log("Benchmark '%s' (x%d) took %.0fms.", name, amount, elapsed_ms)
end

function NanosUtils.IsA(object, class)
	return ((type(object) == "table") and object.IsA and object:IsA(class))
end
