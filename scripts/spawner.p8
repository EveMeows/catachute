spawner = {}
spawner.__index = spawner

function spawner.new(timeout, on_timeout)
	s = {
		entities = {},
		timer = {
			timeout = timeout,
			time = 0,
		},

		on_timeout = on_timeout,
	}

	return setmetatable(s, spawner)
end

function spawner:update()
	local timer = self.timer
	timer.time += dt
	if timer.time >= timer.timeout then
		timer.time = 0
		self.on_timeout(self)
	end

	for e in all(self.entities) do
		e:update()
		if e.y < -60 then
			del(self.entities, e)
		end
	end
end

function spawner:draw()
	for e in all(self.entities) do
		e:draw()
	end
end