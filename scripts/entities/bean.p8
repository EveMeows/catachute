bean = {}
bean.__index = bean

function bean.new()
	b = {
		rot = 0,
		x = roll_all(20, 90), y = 130,
		spd = roll_all(1, 3),

		body = {x=0,y=0,w=0,h=0}
	}

	return setmetatable(b, bean)
end

function bean:update()
	self.rot += dt * 1.3
	self.y -= self.spd

	self.body = {
		x = self.x, y = self.y,
		w = 7, h = 7,
	}
end

function bean:draw()
	spra(self.rot, 34, self.x, self.y, 1, 1)
end