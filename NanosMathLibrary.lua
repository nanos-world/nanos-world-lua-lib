--[[ Math Utility Library --]]

NanosMathLibrary = {}

function NanosMathLibrary.ClampAxis(angle)
	local angle = angle % 360

	if angle < 0 then
		angle = angle + 360
	end

	return angle
end

function NanosMathLibrary.NormalizeAxis(angle)
	local angle = NanosMathLibrary.ClampAxis(angle)

	if angle > 180 then
		angle = angle - 360
	end

	return angle
end

function NanosMathLibrary.FInterpTo(current, target, delta_time, interp_speed)

	if interp_speed <= 0 then return target end

	local delta = target - current

	if math.sqrt(delta) < 0.00001 then return target end

	local delta_move = delta * math.clamp(delta_time * interp_speed, 0, 1)

	return current + delta_move
end

function NanosMathLibrary.RInterpTo(current, target, delta_time, interp_speed)

	if interp_speed <= 0 then return target end

	local delta = (target - current):GetNormalized()

	if (delta:IsNearlyZero()) then return target end

	local delta_move = delta * math.clamp(delta_time * interp_speed, 0, 1)

	return (current + delta_move):GetNormalized()
end

function NanosMathLibrary.VInterpTo(current, target, delta_time, interp_speed)

	if interp_speed <= 0 then return target end

	local delta = target - current

	if (delta:IsNearlyZero()) then return target end

	local delta_move = delta * math.clamp(delta_time * interp_speed, 0, 1)

	return current + delta_move
end

function NanosMathLibrary.VInterpConstantTo(current, target, delta_time, interp_speed)

	local delta = target - current
	local delta_m = delta:Size()
	local max_step = interp_speed * delta_time

	if (delta_m > max_step) then
		if (max_step > 0) then
			local delta_n = delta / delta_m
			return current + delta_n * max_step
		end
	else
		return current
	end

	return target
end

function NanosMathLibrary.RInterpConstantTo(current, target, delta_time, interp_speed)

	if delta_time == 0 or current == target then return current end
	if interp_speed <= 0 then return target end

	local delta_interp_speed = interp_speed * delta_time
	local delta_move = (target - current):GetNormalized()

	local result = Rotator(
		math.clamp(delta_move.Pitch, -delta_interp_speed, delta_interp_speed),
		math.clamp(delta_move.Yaw, -delta_interp_speed, delta_interp_speed),
		math.clamp(delta_move.Roll, -delta_interp_speed, delta_interp_speed)
	)

	result:Normalize()

	return result
end


--[[ Math Default Overload Library --]]

function math.clamp(value, low, high)
	return math.min(math.max(value, low), high)
end

function math.round(value)
	return math.floor(value + 0.5)
end