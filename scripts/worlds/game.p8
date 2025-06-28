game = {}

function game:init()
	self.data = {
		spawners = {
			["edge"] = spawner.new(2.5, function (spawn) 
				add(spawn.entities, edge.new(1, 4))
			end),

			["float"] = spawner.new(3.5, function (spawn)
				add(spawn.entities, floaty.new(1, 4))
			end),

			["bean"] = spawner.new(4, function (spawn)
				add(spawn.entities, bean.new(1, 4))
			end),
		},

		score = 0,
		metres = 0,
		travel = {
			time = 0,
			timeout = 0.8,
		},
	}

	car:init()
end

function game:update()
	local data = self.data

	car:update()

	for name, spawner in pairs(data.spawners) do
		spawner:update()
		
		for entity in all(spawner.entities) do
			if aabb_check(car.data.body, entity.body) do
				if name == "bean" then
					self.data.score += 1
					del(spawner.entities, entity)

					goto continue
				end

				world:set(death)
			end

			::continue::
		end
	end

	local trv = data.travel
	trv.time += dt
	if trv.time >= trv.timeout then
		trv.time = 0
		data.metres += 1
	end
end

function game:draw()
	local data = self.data

	cls(12)
	car:draw()

	for name, spawner in pairs(data.spawners) do
		spawner:draw()	
	end

	?data.metres .. "m travelled", 1, 1, 7
	?data.score .. " beans", 1, 8, 7
end