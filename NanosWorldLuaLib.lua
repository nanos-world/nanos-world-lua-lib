
--[[ Color --]]

Color = {}
Color.__index = Color

setmetatable(Color, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Color.new(_R, _G, _B, _A)
	local Self = setmetatable({}, Color)

	Self.R = _R or 0
	Self.G = _G or 0
	Self.B = _B or 0
	Self.A = _A or 1

	return Self
end

function Color:__add(other)
	if type(other) ~= "table" then other = Color(other) end
	return Color(self.R + other.R, self.G + other.G, self.B + other.B, self.A + other.A)
end

function Color:__sub(other)
	if type(other) ~= "table" then other = Color(other) end
	return Color(self.R - other.R, self.G - other.G, self.B - other.B, self.A - other.A)
end

function Color:__mul(other)
	if type(other) ~= "table" then other = Color(other) end
	return Color(self.R * other.R, self.G * other.G, self.B * other.B, self.A * other.A)
end

function Color:__div(other)
	if type(other) ~= "table" then other = Color(other) end
	return Color(self.R / other.R, self.G / other.G, self.B / other.B, self.A / other.A);
end

function Color:__eq(other)
	return self.R == other.R and self.G == other.G and self.B == other.B and self.A == other.A
end

function Color:__tostring()
	return "Color(R = " .. self.R .. ", G = " .. self.G .. ", B = " .. self.B .. ", A = " .. self.A .. ")"
end


--[[ Vector2D --]]

Vector2D = {}
Vector2D.__index = Vector2D

setmetatable(Vector2D, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Vector2D.new(_X, _Y)
	local Self = setmetatable({}, Vector2D)

	Self.X = _X or 0
	Self.Y = _Y or _X or 0

	return Self
end

function Vector2D:__add(other)
	if type(other) ~= "table" then other = Vector2D(other) end
	return Vector2D(self.X + other.X, self.Y + other.Y)
end

function Vector2D:__sub(other)
	if type(other) ~= "table" then other = Vector2D(other) end
	return Vector2D(self.X - other.X, self.Y - other.Y)
end

function Vector2D:__mul(other)
	if type(other) ~= "table" then other = Vector2D(other) end
	return Vector2D(self.X * other.X, self.Y * other.Y)
end

function Vector2D:__div(other)
	if type(other) ~= "table" then other = Vector2D(other) end
	return Vector2D(self.X / other.X, self.Y / other.Y);
end

function Vector2D:__eq(other)
	return self.X == other.X and self.Y == other.Y
end

function Vector2D:__tostring()
	return "Vector2D(X = " .. self.X .. ", Y = " .. self.Y .. ")"
end


--[[ Rotator --]]

Rotator = {}
Rotator.__index = Rotator

setmetatable(Rotator, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Rotator.new(_pitch, _yaw, _roll)
	local Self = setmetatable({}, Rotator)

	Self.Pitch = _pitch or 0
	Self.Yaw = _yaw or _pitch or 0
	Self.Roll = _roll or _pitch or 0

	return Self
end

function Rotator:__add(other)
	if type(other) ~= "table" then other = Rotator(other) end
	return Rotator(self.Pitch + other.Pitch, self.Yaw + other.Yaw, self.Roll + other.Roll)
end

function Rotator:__sub(other)
	if type(other) ~= "table" then other = Rotator(other) end
	return Rotator(self.Pitch - other.Pitch, self.Yaw - other.Yaw, self.Roll - other.Roll)
end

function Rotator:__mul(other)
	if type(other) ~= "table" then other = Rotator(other) end
	return Rotator(self.Pitch * other.Pitch, self.Yaw * other.Yaw, self.Roll * other.Roll)
end

function Rotator:__tostring()
	return "Rotator(Pitch = " .. self.Pitch .. ", Yaw = " .. self.Yaw .. ", Roll = " .. self.Roll .. ")"
end

function Rotator:Equals(other, tolerance)
	if not tolerance then tolerance = 0.000001 end
	return math.abs(NanosMathLibrary.NormalizeAxis(self.Pitch - other.Pitch)) <= tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Yaw - other.Yaw)) <= tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Roll - other.Roll)) <= tolerance
end

function Rotator:GetNormalized()
	local new_rotation = Rotator(self.X, self.Y, self.Z)
	new_rotation:Normalize()
	return new_rotation
end

function Rotator:IsNearlyZero(tolerance)
	if not tolerance then tolerance = 0.000001 end
	return math.abs(self.Pitch) <= tolerance and math.abs(self.Yaw) <= tolerance and math.abs(self.Roll) <= tolerance
end

function Rotator:IsZero()
	return self.Pitch == 0 and self.Yaw == 0 and self.Roll == 0
end

function Rotator:RotateVector(V)
	local Q = Vector(self.Pitch, self.Yaw, self.Roll)
	local T = Vector(2) * (Q ^ V)
	return V + (Q ^ T)
end

function Rotator:GetForwardVector()
	local pitch_no_winding = self.Pitch % 360
	local yaw_no_winding = self.Yaw % 360

	local SP = math.sin(math.rad(pitch_no_winding))
	local CP = math.cos(math.rad(pitch_no_winding))

	local SY = math.sin(math.rad(yaw_no_winding))
	local CY = math.cos(math.rad(yaw_no_winding))

	return Vector(CP * CY, CP * SY, SP)
end

function Rotator:Normalize()
	self.Pitch = NanosMathLibrary.NormalizeAxis(self.Pitch)
	self.Yaw = NanosMathLibrary.NormalizeAxis(self.Yaw)
	self.Roll = NanosMathLibrary.NormalizeAxis(self.Roll)
end

--[[ Vector ]]

Vector = {}
Vector.__index = Vector

setmetatable(Vector, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Vector.new(_X, _Y, _Z)
	local Self = setmetatable({}, Vector)

	Self.X = _X or 0
	Self.Y = _Y or _X or 0
	Self.Z = _Z or _X or 0

	return Self
end

function Vector:__add(other)
	if type(other) ~= "table" then other = Vector(other) end
	return Vector(self.X + other.X, self.Y + other.Y, self.Z + other.Z)
end

function Vector:__sub(other)
	if type(other) ~= "table" then other = Vector(other) end
	return Vector(self.X - other.X, self.Y - other.Y, self.Z - other.Z)
end

function Vector:__mul(other)
	if type(other) ~= "table" then other = Vector(other) end
	return Vector(self.X * other.X, self.Y * other.Y, self.Z * other.Z)
end

function Vector:__div(other)
	if type(other) ~= "table" then other = Vector(other) end
	return Vector(self.X / other.X, self.Y / other.Y, self.Z / other.Z);
end

function Vector:__pow(other)
	return Vector(self.Y * other.Z - self.Z * other.Y, self.Z * other.X - self.X * other.Z, self.X * other.Y - self.Y * other.X)
end

function Vector:__eq(other)
	return self.X == other.X and self.Y == other.Y and self.Z == other.Z
end

function Vector:__tostring()
	return "Vector(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ")"
end

function Vector:Equals(other, tolerance)
	if not tolerance then tolerance = 0.000001 end
	return math.abs(NanosMathLibrary.NormalizeAxis(self.X - other.X)) <= tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Y - other.Y)) <= tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Z - other.Z)) <= tolerance
end

function Vector:SizeSquared()
	return self.X * self.X + self.Y * self.Y + self.Z * self.Z
end

function Vector:Size()
	return math.sqrt(self:SizeSquared())
end

function Vector:IsNearlyZero(tolerance)
	if not tolerance then tolerance = 0.000001 end
	return math.abs(self.X) <= tolerance and math.abs(self.Y) <= tolerance and math.abs(self.Z) <= tolerance
end

function Vector:IsZero()
	return self.X == 0 and self.Y == 0 and self.Z == 0
end

function Vector:DistanceSquared(other)
	return ((other.X - self.X) ^ 2) + ((other.Y - self.Y) ^ 2) + ((other.Z - self.Z) ^ 2)
end

function Vector:Distance(other)
	return math.sqrt(self:DistanceSquared(other))
end


--[[ Math Utility Library --]]
NanosMathLibrary = {}

function math.clamp(N, Low, High) return math.min(math.max(N, Low), High) end

--[[ Vector Functions --]]

--[[ Rotator Functions --]]

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
		angle = angle - 360;
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
