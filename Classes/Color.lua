--[[ Color --]]

Color = {}
Color.__index = Color

setmetatable(Color, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Color.new(_R, _G, _B, _A)
	local _self = setmetatable({}, Color)

	_self.R = tonumber(_R) or 0
	_self.G = tonumber(_G) or _self.R
	_self.B = tonumber(_B) or _self.G
	_self.A = tonumber(_A) or 1

	return _self
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

Color.WHITE =		Color(1,   1,   1)
Color.BLACK =		Color(0,   0,   0)

Color.RED =			Color(1,   0,   0)
Color.GREEN =		Color(0,   1,   0)
Color.BLUE =		Color(0,   0,   1)

Color.YELLOW =		Color(1,   1,   0)
Color.CYAN =		Color(0,   1,   1)
Color.MAGENTA =		Color(1,   0,   1)

Color.ORANGE =		Color(1,   0.5, 0)
Color.CHARTREUSE =	Color(0.5, 1,   1)
Color.AQUAMARINE =	Color(0,   1,   0.5)
Color.AZURE =		Color(0,   0.5, 1)
Color.VIOLET =		Color(0.5, 0,   1)
Color.ROSE =		Color(1,   0,   0.5)

Color.PALETTE = {
	Color.WHITE,
	Color.BLACK,
	Color.RED,
	Color.GREEN,
	Color.BLUE,
	Color.YELLOW,
	Color.CYAN,
	Color.MAGENTA,
	Color.ORANGE,
	Color.CHARTREUSE,
	Color.AQUAMARINE,
	Color.AZURE,
	Color.VIOLET,
	Color.ROSE,
}

function Color.RandomPalette()
	return Color.PALETTE[math.random(#Color.PALETTE)]
end

function Color.Random()
	return Color(math.random(), math.random(), math.random())
end
