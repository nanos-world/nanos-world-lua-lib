--[[ Vector4 ]]

Vector4 = {}
Vector4.__index = Vector4

setmetatable(Vector4, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Vector4.new(_X, _Y, _Z, _W)
	local X = tonumber(_X) or 0
	return setmetatable({
		X = X,
		Y = tonumber(_Y) or X,
		Z = tonumber(_Z) or X,
		W = tonumber(_W) or X
	}, Vector4)
end

function Vector4:__tostring()
	return "Vector4(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ", W = " .. self.W .. ")"
end