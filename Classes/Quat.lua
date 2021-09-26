--[[ Quaternion --]]

Quat = {}
Quat.__index = Quat

setmetatable(Quat, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Quat.new(_X, _Y, _Z, _W)
	local X = tonumber(_X) or 0
	return setmetatable({
		X = X,
		Y = tonumber(_Y) or X,
		Z = tonumber(_Z) or X,
		W = tonumber(_W) or X
	}, Quat)
end

function Quat:__mul(other)
	local T0 = (self.Z - self.Y) * (other.Y - other.Z)
	local T1 = (self.W + self.X) * (other.W + other.X)
	local T2 = (self.W - self.X) * (other.Y + other.Z)
	local T3 = (self.Y + self.Z) * (other.W - other.X)
	local T4 = (self.Z - self.X) * (other.X - other.Y)
	local T5 = (self.Z + self.X) * (other.X + other.Y)
	local T6 = (self.W + self.Y) * (other.W - other.Z)
	local T7 = (self.W - self.Y) * (other.W + other.Z)
	local T8 = T5 + T6 + T7
	local T9 = 0.5 * (T4 + T8)

	return Quat(
		T1 + T9 - T8,
		T2 + T9 - T7,
		T3 + T9 - T6,
		T0 + T9 - T5
	)
end

function Quat:Rotator()
	local singularity_test = self.Z * self.X - self.W * self.Y
	local yaw_y = 2 * (self.W * self.Z + self.X * self.Y)
	local yaw_x = 1 - 2 * (self.Y * self.Y + self.Z * self.Z)

	local singularity_threshold = 0.4999995
	local rad_to_deg = 180 / math.pi

	local rotator = Rotator()

	if (singularity_test < -singularity_threshold) then
		rotator.Pitch = -90
		rotator.Yaw = math.atan(yaw_y, yaw_x) * rad_to_deg
		rotator.Roll = NanosMath.NormalizeAxis(-rotator.Yaw - (2 * math.atan(self.X, self.W) * rad_to_deg))
	elseif (singularity_test > singularity_threshold) then
		rotator.Pitch = 90
		rotator.Yaw = math.atan(yaw_y, yaw_x) * rad_to_deg
		rotator.Roll = NanosMath.NormalizeAxis(rotator.Yaw - (2 * math.atan(self.X, self.W) * rad_to_deg))
	else
		rotator.Pitch = math.asin(2 * singularity_test) * rad_to_deg
		rotator.Yaw = math.atan(yaw_y, yaw_x) * rad_to_deg
		rotator.Roll = math.atan(-2 * (self.W * self.X + self.Y * self.Z), (1 - 2 * (self.X * self.X + self.Y * self.Y))) * rad_to_deg
	end

	return rotator
end

function Quat:__tostring()
	return "Quat(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ", W = " .. self.W .. ")"
end