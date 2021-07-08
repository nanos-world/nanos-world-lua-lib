--[[ Rotator --]]

Rotator = {}
Rotator.__index = Rotator

setmetatable(Rotator, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Rotator.new(_pitch, _yaw, _roll)
	local _self = setmetatable({}, Rotator)

	_self.Pitch = tonumber(_pitch) or 0
	_self.Yaw = tonumber(_yaw) or _self.Pitch or 0
	_self.Roll = tonumber(_roll) or _self.Pitch or 0

	return _self
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
	return math.abs(NanosMath.NormalizeAxis(self.Pitch - other.Pitch)) <= tolerance 
			and math.abs(NanosMath.NormalizeAxis(self.Yaw - other.Yaw)) <= tolerance 
			and math.abs(NanosMath.NormalizeAxis(self.Roll - other.Roll)) <= tolerance
end

function Rotator:GetNormalized()
	local new_rotation = Rotator(self.Pitch, self.Yaw, self.Roll)
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
	return Matrix(self):TransformVector(V)
end

function Rotator:UnrotateVector(V)
	return Matrix(self):GetTransposed():TransformVector(V)
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
	self.Pitch = NanosMath.NormalizeAxis(self.Pitch)
	self.Yaw = NanosMath.NormalizeAxis(self.Yaw)
	self.Roll = NanosMath.NormalizeAxis(self.Roll)
end

function Rotator:Quaternion()
	local deg_to_rad = math.pi / 180
	local rads_divided_by_2 = deg_to_rad / 2

	local pitch_no_winding = self.Pitch % 360
	local yaw_no_winding = self.Yaw % 360
	local roll_no_winding = self.Roll % 360

	local SP = math.sin(pitch_no_winding * rads_divided_by_2)
	local CP = math.cos(pitch_no_winding * rads_divided_by_2)
	local SY = math.sin(yaw_no_winding * rads_divided_by_2)
	local CY = math.cos(yaw_no_winding * rads_divided_by_2)
	local SR = math.sin(roll_no_winding * rads_divided_by_2)
	local CR = math.cos(roll_no_winding * rads_divided_by_2)

	return Quat(
		 CR * SP * SY - SR * CP * CY,
		-CR * SP * CY - SR * CP * SY,
		 CR * CP * SY - SR * SP * CY,
		 CR * CP * CY + SR * SP * SY
	)
end