--[[ Vector4 ]]

Vector4 = {}
Vector4.__index = Vector4

setmetatable(Vector4, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Vector4.new(_X, _Y, _Z, _W)
	local self = setmetatable({}, Vector)

	self.X = tonumber(_X) or 0
	self.Y = tonumber(_Y) or self.X or 0
	self.Z = tonumber(_Z) or self.X or 0
	self.W = tonumber(_W) or self.X or 0

	return self
end

function Vector4:__tostring()
	return "Vector4(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ", W = " .. self.W .. ")"
end