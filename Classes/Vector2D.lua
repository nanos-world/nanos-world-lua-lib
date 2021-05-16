--[[ Vector2D --]]

Vector2D = {}
Vector2D.__index = Vector2D

setmetatable(Vector2D, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Vector2D.new(_X, _Y)
	local _self = setmetatable({}, Vector2D)

	_self.X = tonumber(_X) or 0
	_self.Y = tonumber(_Y) or _self.X or 0

	return _self
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
	return Vector2D(self.X / other.X, self.Y / other.Y)
end

function Vector2D:__unm()
	return Vector2D(-self.X, -self.Y)
end

function Vector2D:__eq(other)
	return self.X == other.X and self.Y == other.Y
end

function Vector2D:__tostring()
	return "Vector2D(X = " .. self.X .. ", Y = " .. self.Y .. ")"
end