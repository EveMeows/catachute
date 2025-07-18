edge = {}
edge.__index = edge

function edge.new(min, max)
	e = {
		spd = roll_all(min, max), scl = roll_all(2, 4),
		x = 0, y = 130,
		flp = false,

		body = {x=0,y=0,w=0,h=0}
	}

	e.x = 128 - (8 * e.scl * 2)
	if roll_all(1, 3) == 2 then
		e.flp = true
		e.x = 0
	end

	return setmetatable(e, edge)
end

function edge:update()
	self.y -= self.spd

	self.body = {
		x = self.x, y = self.y + 6,
		w = 8 * self.scl * 2, h = 7 * self.scl - 5
	}
end

function edge:draw()
	aspr(self.x, self.y, 0, 3, 2, 1, self.scl, self.flp)
	
	-- collider
	-- rect(self.body.x, self.body.y, self.body.x + self.body.w, self.body.y + self.body.h, 8)
end