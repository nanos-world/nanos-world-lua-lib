--[[ Enums --]]

AimMode = {	None = 0, ADS = 1, ZoomedZoom = 2, Zoomed = 3, ZoomedFar = 4 }
AnimationSlotType = { FullBody = 0, UpperBody = 1 }
AttenuationFunction = { Linear = 0, Logarithmic = 1, Inverse = 2, LogReverse = 3, NaturalSound = 4 }
CameraMode = { FPSTPS = 0, FPSOnly = 1, TPSOnly = 2 }
CollisionChannel = { WorldStatic = 1 << 0, WorldDynamic = 1 << 1, Pawn = 1 << 2, PhysicsBody = 1 << 5, Vehicle = 1 << 6, Destructible = 1 << 7, TracePrimitive = 1 << 16, Mesh = 1 << 17, Foliage = 1 << 20 }
CollisionType = { Normal = 0, StaticOnly = 1, NoCollision = 2 }
ConstraintMotion = { Free = 0, Limited = 1, Locked = 2 }
CrosshairType = { None = 0, Regular = 1, Circle = 2, Crossbow = 3, Dot = 4, Holo = 5, Launcher = 6, RegularX = 7, Rocket = 8, SeparatedTriangle = 9, Shotgun = 10, Square = 11, Submachine = 12, Tee = 13, ThreeDots = 14, Triangle = 15, Vee = 16 }
CursorType = { None = 0, Default = 1, TextEditBeam = 2, ResizeLeftRight = 3, ResizeUpDown = 4, ResizeSouthEast = 5, ResizeSouthWest = 6, CardinalCross = 7, Crosshairs = 8, Hand = 9, GrabHand = 10, GrabHandClosed = 11, SlashedCircle = 12, EyeDropper = 13 }
DamageType = { Shot = 0, Explosion = 1, Punch = 2, Fall = 3, RunOver = 4, Unknown = 5 }
DifferentialType = { LimitedSlip_4W = 0, LimitedSlip_FrontDrive = 1, LimitedSlip_RearDrive = 2, Open_4W = 3, Open_FrontDrive = 4, Open_RearDrive = 5 }
FallingMode = { None = 0, Jumping = 1, Climbing = 2, Vaulting = 3, Falling = 4, HighFalling = 5, Parachuting = 6, SkyDiving = 7 }
FontType = { Roboto = 0, GothicA1 = 1, PoiretOne = 2, Oswald = 3, Roboto_Mono = 4 }
GaitMode = { None = 0, Walking = 1, Sprinting = 2 }
HandlingMode = { SingleHandedWeapon = 0, DoubleHandedWeapon = 1, SingleHandedMelee = 2, DoubleHandedMelee = 3, Throwable = 4, Torch = 5, Barrel = 6, Box = 7 }
LightType = { Point = 0, Spot = 1, React = 2 }
LogType = { Display = 0, Warning = 1, Error = 2, Debug = 3, Verbose = 4, Scripting = 5, Chat = 6, WebUI = 7 }
MaterialType = { None = 0, Masked = 1, Translucent = 2, TranslucentDepth = 3 }
SoundType = { SFX = 0, Music = 1 }
StanceMode = { None = 0, Standing = 1, Crouching = 2, Proning = 3 }
SurfaceType = { Default = 0, Carpet = 1, Concrete = 2, Grass = 3, Gravel = 4, Ground = 5, MetalLight = 6, Plastic = 7, Sand = 8, Snow = 9, Water = 10, WoodLight = 11, Flesh = 12, MetalHeavy = 13, WoodHeavy = 14, Ice = 15, Mud = 16, Rock = 17, Thump = 18, Glass = 19 }
SwimmingMode = { None = 0, Superficie = 1, Underwater = 2 }
TextRenderAlignCamera = { Unaligned = 0, AlignCameraRotation = 1, FaceCamera = 2 }
TextRenderBevelType = { Linear = 0, HalfCircle = 1, Convex = 2, Concave = 3, OneStep = 4, TwoSteps = 5, Engraved = 6 }
TextRenderHorizontalAlignment = { Left = 0, Center = 1, Right = 2 }
TextRenderVerticalAlignment = { FirstLine = 0, Top = 1, Center = 2, Bottom = 3 }
TriggerType = { Sphere = 0, Box = 1 }
ViewMode = { FPS = 0, TPS1 = 1, TPS2 = 2, TPS3 = 3 }
VOIPSetting = { Local = 0, Global = 1, Muted = 2 }
WeatherType = { Clear = 0, Rain = 1, Cloudy = 2, Thunderstorm = 3 }

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

	Self.R = tonumber(_R) or 0
	Self.G = tonumber(_G) or 0
	Self.B = tonumber(_B) or 0
	Self.A = tonumber(_A) or 1

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
	return Color(self.R / other.R, self.G / other.G, self.B / other.B, self.A / other.A)
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

	Self.X = tonumber(_X) or 0
	Self.Y = tonumber(_Y) or Self.X or 0

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
	return Vector2D(self.X / other.X, self.Y / other.Y)
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

	Self.Pitch = tonumber(_pitch) or 0
	Self.Yaw = tonumber(_yaw) or Self.Pitch or 0
	Self.Roll = tonumber(_roll) or Self.Pitch or 0

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

	Self.X = tonumber(_X) or 0
	Self.Y = tonumber(_Y) or Self.X or 0
	Self.Z = tonumber(_Z) or Self.X or 0

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
	return Vector(self.X / other.X, self.Y / other.Y, self.Z / other.Z)
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

function Vector:Normalize(tolerance)
	if not tolerance then tolerance = 0.000001 end

	local square_sum = self:SizeSquared()

	if (square_sum > tolerance) then
		local scale = 1 / math.sqrt(square_sum)

		self.X = self.X * scale
		self.Y = self.Y * scale
		self.Z = self.Z * scale

		return true
	end

	return false
end

function Vector:GetUnsafeNormal()
	local scale = 1 / math.sqrt(self:SizeSquared())
	return self * scale
end

function Vector:GetSafeNormal(tolerance)
	if not tolerance then tolerance = 0.000001 end

	local square_sum = self:SizeSquared()

	if (square_sum == 1) then
		return self
	elseif (square_sum < tolerance) then
		return Vector(0, 0, 0)
	end

	local scale = 1 / math.sqrt(square_sum)
	return self * scale
end


--[[ Math Default Overload Library --]]

function math.clamp(value, low, high)
	return math.min(math.max(value, low), high)
end

function math.round(value)
	return math.floor(value + 0.5)
end


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
