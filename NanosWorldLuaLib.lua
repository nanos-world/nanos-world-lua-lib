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

function Rotator:__add(Other)
	if type(Other) ~= "table" then Other = Rotator(Other) end
	return Rotator(self.Pitch + Other.Pitch, self.Yaw + Other.Yaw, self.Roll + Other.Roll)
end

function Rotator:__sub(Other)
	if type(Other) ~= "table" then Other = Rotator(Other) end
	return Rotator(self.Pitch - Other.Pitch, self.Yaw - Other.Yaw, self.Roll - Other.Roll)
end

function Rotator:__mul(Other)
	if type(Other) ~= "table" then Other = Rotator(Other) end
	return Rotator(self.Pitch * Other.Pitch, self.Yaw * Other.Yaw, self.Roll * Other.Roll)
end

function Rotator:__tostring()
	return "Rotator(Pitch = " .. self.Pitch .. ", Yaw = " .. self.Yaw .. ", Roll = " .. self.Roll .. ")"
end

function Rotator:Equals(Other, Tolerance)
	if not Tolerance then Tolerance = 0.0000001 end
	return math.abs(NanosMathLibrary.NormalizeAxis(self.Pitch - Other.Pitch)) <= Tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Yaw - Other.Yaw)) <= Tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Roll - Other.Roll)) <= Tolerance
end

function Rotator:GetNormalized()
	local NewRot = Rotator(self.X, self.Y, self.Z)
	NewRot:Normalize()
	return NewRot
end

function Rotator:IsNearlyZero(Tolerance)
	if not Tolerance then Tolerance = 0.0000001 end
	return math.abs(self.Pitch) <= Tolerance and math.abs(self.Yaw) <= Tolerance and math.abs(self.Roll) <= Tolerance
end

function Rotator:IsZero()
	return self.Pitch == 0 and self.Yaw == 0 and self.Roll == 0
end

function Rotator:RotateVector(V)
	Q = Vector(self.Pitch, self.Yaw, self.Roll)
	T = Vector(2) * (Q ^ V)
	return V + (Q ^ T)
end

function Rotator:GetForwardVector()
	PitchNoWinding = self.Pitch % 360
	YawNoWinding = self.Yaw % 360

	SP = math.sin(math.rad(PitchNoWinding))
	CP = math.cos(math.rad(PitchNoWinding))

	SY = math.sin(math.rad(YawNoWinding))
	CY = math.cos(math.rad(YawNoWinding))

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

function Vector:__add(Other)
	if type(Other) ~= "table" then Other = Vector(Other) end
	return Vector(self.X + Other.X, self.Y + Other.Y, self.Z + Other.Z)
end

function Vector:__sub(Other)
	if type(Other) ~= "table" then Other = Vector(Other) end
	return Vector(self.X - Other.X, self.Y - Other.Y, self.Z - Other.Z)
end

function Vector:__mul(Other)
	if type(Other) ~= "table" then Other = Vector(Other) end
	return Vector(self.X * Other.X, self.Y * Other.Y, self.Z * Other.Z)
end

function Vector:__div(Other)
	if type(Other) ~= "table" then Other = Vector(Other) end
	return Vector(self.X / Other.X, self.Y / Other.Y, self.Z / Other.Z);
end

function Vector:__pow(Other)
	return Vector(self.Y * Other.Z - self.Z * Other.Y, self.Z * Other.X - self.X * Other.Z, self.X * Other.Y - self.Y * Other.X)
end

function Vector:__eq(Other)
	return self.X == Other.X and self.Y == Other.Y and self.Z == Other.Z
end

function Vector:__tostring()
	return "Vector(X = " .. self.X .. ", Y = " .. self.Y .. ", Z = " .. self.Z .. ")"
end

function Vector:Equals(Other, Tolerance)
	if not Tolerance then Tolerance = 0.0000001 end
	return math.abs(NanosMathLibrary.NormalizeAxis(self.X - Other.X)) <= Tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Y - Other.Y)) <= Tolerance 
			and math.abs(NanosMathLibrary.NormalizeAxis(self.Z - Other.Z)) <= Tolerance
end

function Vector:SizeSquared()
	return self.X * self.X + self.Y * self.Y + self.Z * self.Z
end

function Vector:Size()
	return math.sqrt(self:SizeSquared())
end

function Vector:IsNearlyZero(Tolerance)
	if not Tolerance then Tolerance = 0.0000001 end
	return math.abs(self.X) <= Tolerance and math.abs(self.Y) <= Tolerance and math.abs(self.Z) <= Tolerance
end

function Vector:IsZero()
	return self.X == 0 and self.Y == 0 and self.Z == 0
end

function Vector:DistanceSquared(Other)
	return math.sqrt(Other.X - self.X) + math.sqrt(Other.Y - self.Y) + math.sqrt(Other.Z - self.Z)
end

function Vector:Distance(Other)
	return math.sqrt(self:DistanceSquared(Other))
end


--[[ Math Utility Library --]]
NanosMathLibrary = {}

function math.clamp(N, Low, High) return math.min(math.max(N, Low), High) end

--[[ Vector Functions --]]

--[[ Rotator Functions --]]

function NanosMathLibrary.ClampAxis(Angle)
	Angle = Angle % 360

	if Angle < 0 then
		Angle = Angle + 360
	end

	return Angle
end

function NanosMathLibrary.NormalizeAxis(Angle)
	Angle = NanosMathLibrary.ClampAxis(Angle)

	if Angle > 180 then
		Angle = Angle - 360;
	end

	return Angle
end

function NanosMathLibrary.FInterpTo(Current, Target, DeltaTime, InterpSpeed)

	if InterpSpeed <= 0 then return Target end

	Delta = Target - Current

	if math.sqrt(Delta) < 0.00001 then return Target end

	DeltaMove = Delta * math.clamp(DeltaTime * InterpSpeed, 0, 1)

	return Current + DeltaMove
end

function NanosMathLibrary.RInterpTo(Current, Target, DeltaTime, InterpSpeed)
	
	if InterpSpeed <= 0 then return Target end

	Delta = (Target - Current):GetNormalized()

	if (Delta:IsNearlyZero()) then return Target end

	DeltaMove = Delta * math.clamp(DeltaTime * InterpSpeed, 0, 1)

	return (Current + DeltaMove):GetNormalized()
end

function NanosMathLibrary.VInterpTo(Current, Target, DeltaTime, InterpSpeed)
	
	if InterpSpeed <= 0 then return Target end

	Delta = Target - Current

	if (Delta:IsNearlyZero()) then return Target end

	DeltaMove = Delta * math.clamp(DeltaTime * InterpSpeed, 0, 1)

	return Current + DeltaMove
end

function NanosMathLibrary.VInterpConstantTo(Current, Target, DeltaTime, InterpSpeed)

	Delta = Target - Current
	DeltaM = Delta:Size()
	MaxStep = InterpSpeed * DeltaTime

	if (DeltaM > MaxStep) then
		if (MaxStep > 0) then
			DeltaN = Delta / DeltaM
			return Current + DeltaN * MaxStep
		end
	else
		return Current
	end

	return Target
end

function NanosMathLibrary.RInterpConstantTo(Current, Target, DeltaTime, InterpSpeed)

	if DeltaTime == 0 or Current == Target then return Current end
	if InterpSpeed <= 0 then return Target end

	DeltaInterpSpeed = InterpSpeed * DeltaTime
	DeltaMove = (Target - Current):GetNormalized()

	Result = Rotator(
		math.clamp(DeltaMove.Pitch, -DeltaInterpSpeed, DeltaInterpSpeed),
		math.clamp(DeltaMove.Yaw, -DeltaInterpSpeed, DeltaInterpSpeed),
		math.clamp(DeltaMove.Roll, -DeltaInterpSpeed, DeltaInterpSpeed)
	)

	Result:Normalize()

	return Result
end


)
