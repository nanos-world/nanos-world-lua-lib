--[[ Color --]]

Color = {}
Color.__index = Color

setmetatable(Color, {
	__call = function(cls, ...)
		return cls.new(...)
	end
})

function Color.new(_R, _G, _B, _A)
	return setmetatable({
		R = tonumber(_R) or 0,
		G = tonumber(_G) or 0,
		B = tonumber(_B) or 0,
		A = tonumber(_A) or 0
	}, Color)
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

function Color.FromRGBA(r, g, b, a)
	a = a or 255
	return Color(
		math.min(tonumber(r), 255) / 255,
		math.min(tonumber(g), 255) / 255,
		math.min(tonumber(b), 255) / 255,
		math.min(tonumber(a), 255) / 255
	)
end

function Color.FromCYMK(c, y, m, k, a)
	a = a or 1

	local r = c * (1.0 - k) + k
	local g = m * (1.0 - k) + k
	local b = y * (1.0 - k) + k

	return Color(1.0 - r, 1.0 - g, 1.0 - b, a)
end

function Color.FromHSL(h, s, l)
	h = h / 360

	local r, g, b;

	if s == 0 then
		r, g, b = l, l, l; -- achromatic
	else
		local function hue2rgb(p, q, t)
			if t < 0 then t = t + 1 end
			if t > 1 then t = t - 1 end
			if t < 1 / 6 then return p + (q - p) * 6 * t end
			if t < 1 / 2 then return q end
			if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
			return p;
		end

		local q = l < 0.5 and l * (1 + s) or l + s - l * s;
		local p = 2 * l - q;
		r = hue2rgb(p, q, h + 1 / 3);
		g = hue2rgb(p, q, h);
		b = hue2rgb(p, q, h - 1 / 3);
	end

	return Color(r, g, b)
end

function Color.FromHSV(h, s, v)
	local l = (2 - s) * v / 2

	if l ~= 0 then
		if l == 1 then
			s = 0
		elseif l < .5 then
			s = s * v / (l * 2)
		else
			s = s * v / (2 - l * 2)
		end
	end

	return Color.FromHSL(h, s, l)
end

function Color.FromHEX(hex)
	local maybeHashtag = hex:sub(1, 1)
	if maybeHashtag == "#" then
		hex = hex:sub(2)
	end

	local number = tonumber(hex, 16)

	-- is a shorthanded version
	if #hex == 3 or #hex == 4 then
		-- is alpha not defined
		if #hex == 3 then
			number = (number << 4) + 15
		end

		return Color(
			(number >> 12 & 15) / 15,
			(number >> 8 & 15) / 15,
			(number >> 4 & 15) / 15,
			(number & 15) / 15
		)
	-- is a full hex
	elseif #hex == 6 or #hex == 8 then
		-- is alpha not defined
		if #hex == 6 then
			number = (number << 8) + 255
		end

		return Color.FromRGBA(
			number >> 24 & 255,
			number >> 16 & 255,
			number >> 8 & 255,
			number & 255
		)
	end
end
