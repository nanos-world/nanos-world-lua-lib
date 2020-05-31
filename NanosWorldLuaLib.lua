NANOS_LUA_FILE(

--[[ Please only use Block Comments --]]


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


--[[ Rotator --]]

Rotator = {}
Rotator.__index = Rotator

setmetatable(Rotator, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Rotator.new(_Pitch, _Yaw, _Roll)
	local Self = setmetatable({}, Rotator)

	Self.Pitch = _Pitch or 0
	Self.Yaw = _Yaw or _Pitch or 0
	Self.Roll = _Roll or _Pitch or 0

	return Self
end

function Rotator:__tostring()
	return "Rotator(Pitch = " .. self.Pitch .. ", Yaw = " .. self.Yaw .. ", Roll = " .. self.Roll .. ")"
end

function Rotator:RotateVector(V)
	Q = Vector(self.Pitch, self.Yaw, self.Roll)
	T = Vector(2) * (Q ^ V)
	return V + (Q ^ T)
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

function Vector:__add(Other)
	return Vector(
		self.X + Other.X,
		self.Y + Other.Y,
		self.Z + Other.Z
	)
end

function Vector:__eq(Other)
	return self.X == Other.X and self.Y == Other.Y and self.Z == Other.Z
end

function Vector:__mul(Other)
	return Vector(
		self.X * Other.X,
		self.Y * Other.Y,
		self.Z * Other.Z
	)
end

function Vector:__pow(Other)
	return Vector(
		self.Y * Other.Z - self.Z * Other.Y,
		self.Z * Other.X - self.X * Other.Z,
		self.X * Other.Y - self.Y * Other.X
	)
end

function Vector:__tostring()
	return "Vector(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ")"
end


--[[ Math Utility Library --]]
NanosMathLibrary = {

	--[[ Vector Functions --]]

	--[[ Rotator Functions --]]

	GetForwardVector = function(Rotation)
		return Rotation:RotateVector(Vector(1, 0, 0))
	end

}


)
