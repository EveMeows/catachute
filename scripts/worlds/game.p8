game = {}

function game:init()
	self.data = {
		edge_spawner = spawner.new(2.5, function (spawn) 
			add(spawn.entities, edge.new(1, 4))
		end),

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

	data.edge_spawner:update()
end

function game:draw()
	local data = self.data

	cls(12)
	car:draw()

	data.edge_spawner:draw()
end