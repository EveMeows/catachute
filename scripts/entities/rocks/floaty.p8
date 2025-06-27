floaty = {}
floaty.__index = floaty

function floaty.new(min, max)
	f = {
		spd = roll_all(min, max), scl = roll_all(2, 4),
		x = 0, y = 130,
	}

	local min_x = 10
	local max_x = 128 - (8 * f.scl * 2)
	f.x = roll_all(min_x, max_x)

	return setmetatable(f, floaty)
end

function floaty:update()
	self.y -= self.spd
end

function floaty:draw()
	aspr(self.x, self.y, 2, 3, 2, 1, self.scl)
end